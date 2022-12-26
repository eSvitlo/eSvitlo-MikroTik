#!/bin/env python3

import re
import sys
from pathlib import Path
from typing import Tuple

EXTRA_PARAMS_PATTERN = re.compile(r"^# (.+=.+)$", flags=re.MULTILINE)
TEMPLATE = '/system script add name="%s" %s source={%s}'


def read(path: str) -> Tuple[str, str]:
    p = Path(path)
    return p.stem, p.read_text()


def extra_parameters(text: str) -> str:
    return " ".join(EXTRA_PARAMS_PATTERN.findall(text))


for file_name in sys.argv[1:]:
    name, source = read(file_name)
    params = extra_parameters(source)
    output = TEMPLATE % (name, params, source)

    print(output)
