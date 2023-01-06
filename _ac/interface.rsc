# dont-require-permissions=yes

:local interface "etherX"

:if ([/interface get "$interface" running] = yes) do={
  :return 1
} else={
  :return 0
}