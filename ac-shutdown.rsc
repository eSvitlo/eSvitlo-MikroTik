# policy=read,test

:local telegram [:parse [/system script get _telegram source]]
:local message ( \
  "\E2\8F\B1\EF\B8\8F\20\D0\97\D0\B0\20\33\30\20\D1\85\D0\B2\D0\B8\D0\BB\D0\B8\D0\BD\20\D0\BC\D0\BE\D0\B6\D0\BB\D0\B8\D0\B2\D1\96\20\D1\81\D1\82" \
. "\D0\B0\D0\B1\D1\96\D0\BB\D1\96\D0\B7\D0\B0\D1\86\D1\96\D0\B9\D0\BD\D1\96\20\D0\B2\D1\96\D0\B4\D0\BA\D0\BB\D1\8E\D1\87\D0\B5\D0\BD\D0\BD\D1\8F" \
)
$telegram message=$message