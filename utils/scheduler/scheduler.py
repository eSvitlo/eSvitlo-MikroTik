#!/bin/env python3

import datetime
import re
from pathlib import Path

SHUTDOWNS = Path(__file__).parent / "shutdowns.txt"
NOTIFY_BEFORE = datetime.timedelta(minutes=30)

TEMPLATE = (
    '/system scheduler add name="{0}" start-time=startup '
    'interval={1} on-event={0} {2}'
)
TEMPLATE_ST = (
    '/system scheduler add name="{0}-{1}" start-date={2} start-time={3} '
    'interval=1w on-event={0} {4}'
)

POLICY_PATTERN = re.compile("^# (policy=.+)$", flags=re.MULTILINE)
DISABLED_PATTERN = re.compile("^# scheduler: (disable=(yes|no)+)$", flags=re.MULTILINE)


def parse_comment(name: str) -> str:
    content = Path(name).with_suffix(".rsc").read_text()
    matches = [p.search(content)for p in (POLICY_PATTERN, DISABLED_PATTERN)]
    return " ".join(m.group(1) for m in matches if m)


def schedule_on_boot(name: str, interval: str) -> str:
    return TEMPLATE.format(name, interval, parse_comment(name))


print(schedule_on_boot("ac-check", "20s"))
print(schedule_on_boot("ac-restore", "0s"))

for line in SHUTDOWNS.read_text().splitlines():
    if line.startswith("#"):
        continue

    name_ = "ac-shutdown"
    params = parse_comment(name_)

    day, time = line.split()[:2]
    date = datetime.datetime(2001, 1, int(day), *map(int, time.split(":")))

    name_suff = "{date.day}-{date.hour:02}".format(date=date)

    sched_date = date - NOTIFY_BEFORE
    start_date = sched_date.strftime("%b/%d/%Y").lower()
    start_time = str(sched_date.time())

    print(TEMPLATE_ST.format(name_, name_suff, start_date, start_time, params))
