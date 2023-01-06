# policy=read,write,policy,test
# scheduler: disable=yes

:local ac [:parse [/system script get _ac source]]
:local acPrev [:parse [/system script get _ac_prev source]]

:delay 20

:local acState [$ac]
:local acPrevState [$acPrev]

:if ($acState = -1 && $acPrevState = 0) do={
  /system script run ac-online
}