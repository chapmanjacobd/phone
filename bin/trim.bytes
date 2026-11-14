#!/usr/bin/env python3

import argparse


def trim_zero_bytes(data):
    data = data.lstrip(b'\x00')
    data = data.rstrip(b'\x00')
    return data


def trim_zero(input_file, output_file):
    with open(input_file, 'rb') as f:
        data = f.read()

    trimmed_data = trim_zero_bytes(data)

    with open(output_file, 'wb') as f:
        f.write(trimmed_data)


def main():
    parser = argparse.ArgumentParser(description="Trim leading and trailing 00 bytes from a binary file.")
    parser.add_argument('input_file', help="Path to the input binary file")
    parser.add_argument('output_file', help="Path to the output binary file")
    args = parser.parse_args()

    trim_zero(args.input_file, args.output_file)


if __name__ == '__main__':
    main()
