#!/usr/bin/python3
import argparse
import json
import os
import re
import sys
import time

DEFAULT_FISH_FUNC_DIR = os.path.expanduser("~/.config/fish/functions")
RENAMES_FILE = "fish_renames.jsonl"
FILE_ENCODING = "utf-8"


def load_renames(args):
    """Loads previous renames from the JSONL file."""
    renames = []
    try:
        with open(args.renames_file, 'r', encoding=FILE_ENCODING) as f:
            for line in f:
                line = line.strip()
                if line:
                    try:
                        renames.append(json.loads(line))
                    except json.JSONDecodeError:
                        print(f"[WARN] Skipped malformed JSONL line in {args.renames_file}.")
        return renames
    except FileNotFoundError:
        print(f"[{RENAMES_FILE}] No previous renames file found. Starting fresh.")
        return []
    except Exception as e:
        print(f"Error loading renames from {args.renames_file}: {e}. Starting fresh.")
        return []


def save_rename_entry(original_name, new_name, entry_type, args):
    entry = {"type": entry_type, "original_name": original_name, "timestamp": time.time()}

    if entry_type == "rename":
        entry["new_name"] = new_name

    try:
        with open(args.renames_file, 'a', encoding=FILE_ENCODING) as f:
            f.write(json.dumps(entry) + '\n')
        print(f"[LOG] Action '{entry_type}' saved to {args.renames_file}.")
    except Exception as e:
        print(f"[ERROR] Failed to save rename entry: {e}")


def get_function_details(filepath):
    function_name = None
    lines = []

    try:
        with open(filepath, 'r', encoding=FILE_ENCODING) as f:
            lines = f.readlines()

        for line in lines:
            match = re.match(r'^function\s+(\S+)', line.strip())
            if match:
                function_name = match.group(1)
                break

    except UnicodeDecodeError:
        print(f"[WARN] Skipping file {filepath}: Encoding error.")
        return None, None, None
    except Exception as e:
        print(f"[ERROR] Could not process {filepath}: {e}")
        return None, None, None

    if function_name is None:
        function_name = os.path.splitext(os.path.basename(filepath))[0]

    description = "".join(lines)

    return function_name, description, lines


def process_functions(args):
    functions_dir = os.path.abspath(args.fish_dir)

    if not os.path.isdir(functions_dir):
        print(f"[FATAL] Functions directory not found: {functions_dir}")
        print("Please check the path or use the --fish-dir argument.")
        sys.exit(1)

    all_renames = load_renames(args)
    func_files = [f for f in os.listdir(functions_dir) if f.endswith('.fish')]

    funcmv_commands = []
    for i, filename in enumerate(sorted(func_files)):
        filepath = os.path.join(functions_dir, filename)

        original_name, description, _ = get_function_details(filepath)
        if not original_name:
            continue

        is_already_known = False
        for r in all_renames:
            if r.get('type') == 'skip' and r.get('original_name') == original_name:
                is_already_known = True
                break

            if r.get('original_name') == original_name:
                command = f"funcmv {original_name} {r.get('new_name')}"
                funcmv_commands.append(command)

                is_already_known = True
                break
            elif r.get('new_name') == original_name:
                is_already_known = True
                break

        if is_already_known:
            continue

        print(f"\n({i + 1}/{len(func_files)}) Processing: {filename}")
        print(f"\033[92m{original_name}\033[0m")
        print()
        print(description)

        new_name = input(f"Enter new name: ").strip()
        if not new_name:
            new_name = original_name.replace("-", ".").replace("_", ".")
        elif new_name != original_name:
            new_name = new_name.replace("-", ".").replace("_", ".")

        if new_name == original_name:
            save_rename_entry(original_name, "", "skip", args)
            print("[SKIP] No new name entered. Logged as skip.")
        else:
            command = f"funcmv {original_name} {new_name}"
            funcmv_commands.append(command)

            save_rename_entry(original_name, new_name, "rename", args)

    if funcmv_commands:
        print("\n" + "=" * 50)
        print("Copy the lines below and run them in your Fish shell:")
        print("=" * 50)
        for cmd in funcmv_commands:
            print(cmd)
        print("=" * 50)
    else:
        print("\n[INFO] No new rename commands were recorded this session.")


def main():
    """Parses arguments and starts the process."""
    parser = argparse.ArgumentParser(
        description="Interactive Fish Function Renamer and Logger.", formatter_class=argparse.RawTextHelpFormatter
    )

    parser.add_argument(
        '-d',
        '--fish-dir',
        type=str,
        default=DEFAULT_FISH_FUNC_DIR,
        help=f"Path to the Fish functions directory.\n(Default: {DEFAULT_FISH_FUNC_DIR})",
    )
    parser.add_argument(
        '-r',
        '--renames-file',
        type=str,
        default=RENAMES_FILE,
        help=f"File to save the rename history (JSONL format).\n(Default: ./{RENAMES_FILE})",
    )

    args = parser.parse_args()

    process_functions(args)


if __name__ == "__main__":
    main()
