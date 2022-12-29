# dont-require-permissions=yes
# comment=1

:global AC

:local key "_ac_prev"
:local value "$state"

:if ([:typeof "$AC"] = "nothing") do={
  :set AC [/system script get "$key" comment]
}

:if ([:typeof "$value"] = "nothing") do={
  :return $AC
} else={
  /system script set "$key" comment "$value"
  :set AC "$value"
}