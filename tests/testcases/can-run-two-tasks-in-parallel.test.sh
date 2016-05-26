while true; do
    echo -n >procs.output

    coproc:run-immediately proc_a eval 'echo a >> procs.output'
    coproc:run-immediately proc_b eval 'echo b >> procs.output'

    coproc:wait "$proc_b" &
    coproc:wait "$proc_a" &

    wait
    wait

    if [ "$(head -n1 procs.output)" = "b" ]; then
        break
    fi
done
