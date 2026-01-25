#!/usr/bin/python3

import sys
import unicodedata

def get_utf8_info(char):
    try:
        name = unicodedata.name(char)
        code_point = ord(char)
        return name, code_point
    except ValueError:
        return "Not found", None

def process_input(text):
    prev_char_ascii = False
    for char in text:
        if ord(char) > 127:
            if prev_char_ascii:
                print()

            name, code_point = get_utf8_info(char)
            print(f"{char} ({name}, U+{code_point}, 0x{char.encode().hex()})")
            prev_char_ascii = False
        else:
            print(char, end='')
            prev_char_ascii = True

def main():
    input_text = sys.stdin.read()
    process_input(input_text)

if __name__ == "__main__":
    main()
