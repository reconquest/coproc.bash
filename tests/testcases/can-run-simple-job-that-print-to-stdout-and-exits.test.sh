coproc:run echo_proc echo 1

tests:eval coproc:get-stdout-only "$echo_proc"
tests:assert-stdout 1
