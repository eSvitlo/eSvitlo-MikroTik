:local acPrev [:parse [/system script get _ac_prev source]]
:local telegram [:parse [/system script get _telegram source]]

:log info message="AC offline"

:local message "\F0\9F\8C\9A\20\D0\A1\D0\B2\D1\96\D1\82\D0\BB\D0\B0\20\D0\BD\D0\B5\D0\BC\D0\B0\E2\80\A6"
$telegram message=$message

$acPrev state=0