# dont-require-permissions=yes
# comment=1

:local key "_ac_prev"
:local value "$state"

:if ([:typeof "$value"] = "nothing") do={
  :return [/system script get "$key" comment]
} else={
  /system script set "$key" comment "$value"
}