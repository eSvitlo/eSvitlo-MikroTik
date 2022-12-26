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


def get_policy(name: str) -> str:
    content = Path(name).with_suffix(".rsc").read_text()
    match = POLICY_PATTERN.search(content)
    return match.group(1) if match else ""


def schedule_on_boot(name: str, interval: str) -> str:
    return TEMPLATE.format(name, interval, get_policy(name))


print(schedule_on_boot("ac-check", "20s"))
print(schedule_on_boot("ac-restore", "0s"))

for line in SHUTDOWNS.read_text().splitlines():
    if line.startswith("#"):
        continue

    name_ = "ac-shutdown"
    policy = get_policy(name_)

    day, time = line.split()
    date = datetime.datetime(2001, 1, int(day), *map(int, time.split(":")))

    name_suff = "{date.day}-{date.hour:02}".format(date=date)

    sched_date = date - NOTIFY_BEFORE
    start_date = sched_date.strftime("%b/%d/%Y").lower()
    start_time = str(sched_date.time())

    print(TEMPLATE_ST.format(name_, name_suff, start_date, start_time, policy))
