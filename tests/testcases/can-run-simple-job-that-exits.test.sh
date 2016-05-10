coproc:run echo_proc touch 123

coproc:wait "$echo_proc"

tests:ensure stat 123
