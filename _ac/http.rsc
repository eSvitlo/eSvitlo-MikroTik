# dont-require-permissions=yes

:local url "http://xxx.xxx.xxx.xxx/ac"

:local acCurr
:do {
  :set acCurr [/tool fetch url="$url" output=user as-value]
} on-error={
  :return -1
}

:if ($acCurr->"status" = "finished") do={
  :if ($acCurr->"data" = "1\n") do={
    :return 1
  } else={
    :return 0
  }
} else={
  :return -1
}