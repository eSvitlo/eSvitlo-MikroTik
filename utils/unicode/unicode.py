#!/bin/env python3

import sys


def encode(text: str) -> str:
    hex_upper = text.encode().hex().upper()
    result = ""
    for i in range(0, len(hex_upper), 2):
        result += "\\" + hex_upper[i:i + 2]
    return result


print(encode(" ".join(sys.argv[1:])))
