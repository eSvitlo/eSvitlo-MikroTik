:local acPrev [:parse [/system script get _ac_prev source]]
:local telegram [:parse [/system script get _telegram source]]

:log info message="AC online"

:local message "\F0\9F\92\A1\20\D0\A1\D0\B2\D1\96\D1\82\D0\BB\D0\BE\20\D1\94\21"
$telegram message=$message

$acPrev state=1