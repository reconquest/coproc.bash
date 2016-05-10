coproc:run echo_proc echo 1 '1>&2'

tests:eval coproc:get-stderr-only "$echo_proc"
tests:assert-stdout 1

coproc:wait "$echo_proc"
