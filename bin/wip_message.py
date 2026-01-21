#!/usr/bin/env python3

# Suggested usage:
# git commit -m "$(wip_message --staged)"

import argparse
import difflib
import os
import re
import subprocess
import sys
from collections import defaultdict


def get_diff(args):
    try:
        if args.staged:
            cmd = ['git', 'diff', '--name-status', '--staged', '-z']
        else:
            cmd = ['git', 'diff', '--name-status', '-z', f"{args.commit_hash}^", args.commit_hash]
        result = subprocess.run(cmd, capture_output=True, text=True, check=True, encoding='utf-8')
    except subprocess.CalledProcessError as e:
        print(f"Error calling git: {e}", file=sys.stderr)
        sys.exit(1)

    output = result.stdout.strip()
    if not output:
        return defaultdict(list)

    diff_list = output.split('\x00')
    files_by_status = defaultdict(list)
    i = 0
    while i < len(diff_list) - 1:
        status = diff_list[i].strip()
        if status.startswith('R'):
            old_name, new_name = diff_list[i + 1], diff_list[i + 2]
            files_by_status[status].append(f"{old_name} -> {new_name}")
            i += 3
        else:
            files_by_status[status].append(diff_list[i + 1])
            i += 2
    return files_by_status


def get_diff_stats(args, filename):
    try:
        if args.staged:
            cmd = ['git', 'diff', '--staged', '--numstat', '--', f":/{filename}"]
        else:
            cmd = ['git', 'diff', '--numstat', f"{args.commit_hash}^", args.commit_hash, '--', filename]
        result = subprocess.run(cmd, capture_output=True, text=True, check=True, encoding='utf-8')
        match = re.match(r'(\d+)\s+(\d+)\s+.*', result.stdout)
        if match:
            return {'added': int(match.group(1)), 'deleted': int(match.group(2))}
    except subprocess.CalledProcessError as e:
        print(f"Error getting diff for {filename}: {e}", file=sys.stderr)
    return {}


def track_moved(added_lines: list[str], removed_lines: list[str]):
    added = list(added_lines)
    removed = list(removed_lines)
    modified = []
    moved = []
    for line in list(added_lines):
        if line in removed:
            added.remove(line)
            removed.remove(line)
            moved.append(line)

    remaining_added = list(added)
    for added_line in remaining_added:
        best_match = None
        highest_ratio = 0.0
        for removed_line in list(removed):
            s = difflib.SequenceMatcher(None, added_line, removed_line)
            ratio = s.ratio()
            if ratio > highest_ratio:
                highest_ratio = ratio
                best_match = removed_line

        if highest_ratio > 0.8:
            modified.append(added_line)
            added.remove(added_line)
            if best_match in removed:
                removed.remove(best_match)

    return added, removed, modified, moved


def get_diff_line(args, filename):
    try:
        if args.staged:
            cmd = ['git', 'diff', '--staged', '--unified=0', '--', f":/{filename}"]
        else:
            cmd = ['git', 'diff', '--unified=0', f"{args.commit_hash}^", args.commit_hash, '--', filename]
        result = subprocess.run(cmd, capture_output=True, text=True, check=True, encoding='utf-8')
    except subprocess.CalledProcessError as e:
        print(f"Error getting diff lines for {filename}: {e}", file=sys.stderr)
    else:
        added_lines, removed_lines = [], []
        for line in result.stdout.splitlines():
            if line.startswith('+') and not line.startswith('+++'):
                line = line[1:].strip()  # strip the +/- prefix
                if line:
                    added_lines.append(line)
            elif line.startswith('-') and not line.startswith('---'):
                line = line[1:].strip()  # strip the +/- prefix
                if line:
                    removed_lines.append(line)

        added, removed, modified, moved = track_moved(added_lines, removed_lines)
        # print(added, removed, moved)

        parts = []
        if added:
            text = "⏎".join(added)
            lines = "line" + ("s" if len(added) > 1 else "")
            parts.append(f"Added text '{text}'" if len(text) <= 80 else f"Added {len(added)} {lines}")
        if removed:
            text = "⏎".join(removed)
            lines = "line" + ("s" if len(removed) > 1 else "")
            parts.append(f"Deleted text '{text}'" if len(text) <= 80 else f"Deleted {len(removed)} {lines}")
        if modified:
            text = "⏎".join(modified)
            lines = "line" + ("s" if len(modified) > 1 else "")
            parts.append(f"Modified text to '{text}'" if len(text) <= 80 else f"Modified {len(modified)} {lines}")
        if moved:
            text = "⏎".join(moved)
            lines = "line" + ("s" if len(moved) > 1 else "")
            parts.append(f"Moved text '{text}'" if len(text) <= 80 else f"Moved {len(moved)} {lines}")
        return "; ".join(parts)


def format_single_file_message(args, filename):
    diff_line = get_diff_line(args, filename)
    if diff_line:
        is_short_change = len(diff_line) < 120
        if is_short_change:
            return f"{os.path.basename(filename)}: {diff_line}"
    elif " -> " in filename:
        return "Renamed " + filename

    diff_stats = get_diff_stats(args, filename)
    if diff_stats:
        parts = []
        if diff_stats.get('added', 0) > 0:
            parts.append(f"{diff_stats['added']} lines added")
        if diff_stats.get('deleted', 0) > 0:
            parts.append(f"{diff_stats['deleted']} lines deleted")
        if parts:
            return f"{os.path.basename(filename)}: {', '.join(parts)}"

    return os.path.basename(filename)


def format_files_for_message(files):
    if not files:
        return ""

    folders = defaultdict(list)
    for file in files:
        directory = os.path.dirname(file) or '.'
        folders[directory].append(file)

    message_parts = []
    for folder, file_list in folders.items():
        if len(file_list) > 3:
            message_parts.append(f"{len(file_list)} files in {folder}")
        else:
            message_parts.extend([os.path.basename(f) for f in file_list])

    return ', '.join(message_parts)


def build_commit_message(args):
    files_by_status = get_diff(args)
    all_files = [f for files in files_by_status.values() for f in files]
    if len(all_files) == 1:
        return format_single_file_message(args, all_files[0])

    prefix_map = {'A': 'Added', 'M': 'Modified', 'D': 'Deleted'}
    message_parts = []
    for status, prefix in prefix_map.items():
        if status in files_by_status:
            formatted_list = format_files_for_message(files_by_status[status])
            if formatted_list:
                message_parts.append(f"{prefix} {formatted_list}")
    for status, files in files_by_status.items():
        if status.startswith('R'):
            formatted_list = format_files_for_message(files)
            if formatted_list:
                message_parts.append(f"Renamed {formatted_list}")

    return '; '.join(message_parts)


def main():
    parser = argparse.ArgumentParser(description="Generate a Git commit message based on diffs.")
    parser.add_argument('--staged', action='store_true', help="Use staged changes instead of a commit hash.")
    parser.add_argument(
        'commit_hash', nargs='?', default='HEAD', help="The commit hash to generate the message for (default: HEAD)."
    )
    args = parser.parse_args()

    message = build_commit_message(args)
    if message:
        print(message)


if __name__ == "__main__":
    main()
