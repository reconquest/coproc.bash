coproc:run bc_proc "bc"

coproc:get-stdin-fd "$bc_proc" stdin
echo 1+1 >&$stdin
coproc:close-fd stdin

tests:eval coproc:get-stdout-only "$bc_proc"
tests:assert-stdout "2"

coproc:stop "$bc_proc"
