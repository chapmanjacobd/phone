#!/usr/bin/python3
import sys


def sort_lines_by_last_name(lines: list[str]):
    lines_with_last_names = sorted([(line.split()[-1], line) for line in lines])  # (last_name, original_line)

    for _last_name, original_line in lines_with_last_names:
        print(original_line, end='')


if __name__ == "__main__":
    input_lines = sys.stdin.readlines()
    sort_lines_by_last_name(input_lines)
