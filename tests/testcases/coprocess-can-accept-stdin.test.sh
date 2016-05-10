coproc:run bc_proc "bc" <<< "1+4"

tests:eval coproc:get-stdout-only "$bc_proc"
tests:assert-stdout "5"

coproc:stop "$bc_proc"
