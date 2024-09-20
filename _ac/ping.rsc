# dont-require-permissions=yes

:local ip "192.168.x.y"

:local count 10
:while (count > 0) do={
  :if ([/ping "$ip" count=1] != 0) do={
    return 1
  }

  :set count ($count - 1)
}

return 0