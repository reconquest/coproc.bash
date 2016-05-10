coproc:run echo_proc "sleep 10 & sleep 11 & sleep 12"

coproc:stop "$echo_proc"
