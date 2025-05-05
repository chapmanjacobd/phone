#!/usr/bin/python3
import colorsys
import hashlib
import sys

def string_to_rgb(input_string):
    hash_object = hashlib.md5(input_string.encode())
    hash_hex = hash_object.hexdigest()
    hash_int = int(hash_hex, 16)

    hue = hash_int % 360  # Hue is between 0 and 359
    saturation = 30 + (hash_int // 360) % 50  # Saturation is between 30 and 79
    lightness = 30 + (hash_int // (360 * 50)) % 50  # Lightness is between 30 and 79

    r, g, b = colorsys.hls_to_rgb(hue / 360, lightness / 100, saturation / 100)

    r = int(r * 255)
    g = int(g * 255)
    b = int(b * 255)

    return r, g, b

rgb_color = string_to_rgb(sys.argv[1])
print('%02x%02x%02x' % rgb_color)
