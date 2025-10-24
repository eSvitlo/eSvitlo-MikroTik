# policy=read,write,policy,test

:local ac [:parse [/system script get _ac source]]
:local acPrev [:parse [/system script get _ac_prev source]]

:local acState [$ac]
:local acPrevState [$acPrev]

:for LoopCount from=1 to=15 do={
  :if ($acState = $acPrevState) do={
    :return
  }
  :set acState [$ac]
  :delay 1
}

:if ($acState = 1 && $acPrevState = 0) do={
  /system script run ac-online
} else={
  :if ($acState = 0 && $acPrevState = 1) do={
    /system script run ac-offline
  }
}