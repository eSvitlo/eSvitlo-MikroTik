#!/bin/bash

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)

while read -r line; do
  "${SCRIPT_DIR}/unicode.py" "${line}"
done < "${SCRIPT_DIR}/messages.txt"
