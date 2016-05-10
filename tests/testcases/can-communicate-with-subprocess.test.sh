coproc:run bc_proc "bc"

coproc:get-stdin-fd "$bc_proc" stdin

coproc:get-stdout-fd "$bc_proc" stdout
coproc:get-stderr-fd "$bc_proc" stderr

echo 1+2 >&$stdin

tests:eval "read -u $stdout && echo \$REPLY"
tests:assert-stdout 3

echo 1+3 >&$stdin

tests:eval "read -u $stdout && echo \$REPLY"
tests:assert-stdout 4

coproc:stop "$bc_proc"
