* [coproc:run()](#coprocrun)
* [coproc:get-pid()](#coprocget-pid)
* [coproc:wait()](#coprocwait)
* [coproc:get-stdout-fd()](#coprocget-stdout-fd)
* [coproc:get-stderr-fd()](#coprocget-stderr-fd)
* [coproc:get-stdout-only()](#coprocget-stdout-only)
* [coproc:get-stderr-only()](#coprocget-stderr-only)
* [coproc:close-fd()](#coprocclose-fd)
* [coproc:set-signal-stop()](#coprocset-signal-stop)
* [coproc:stop()](#coprocstop)
* [coproc:get-killed-code()](#coprocget-killed-code)

## coproc:run()

Schedules specified job to execution.

**NOTE**: job will not execute until stdout and stderr output descriptors
will be opened for reading.

### Example

```bash
coproc:run echo_proc echo 1
coproc:get-stdout-only "$echo_proc"  # will output 1
```

### Example

```bash
coproc:run echo_proc echo 2
coproc:get-stdout-fd stdout
cat <&$stdout
```

### Arguments

* **$1** (var): Variable name to store new coprocess ID.
* **...** (any): Command to start as a coprocess.

## coproc:get-pid()

Gets top-level PID of specified running coprocess.

### Arguments

* **$1** (id): Coprocesss ID.
* **$2** (var): Variable name to store PID.

## coproc:wait()

Waits specified coprocess to finish.

**NOTE**: that function will implicitly drop all output and unblock job.

### Arguments

* **$1** (id): Coprocesss ID.

## coproc:get-stdout-fd()

Gets stdout FD linked to stdout of running coprocess.

### Arguments

* **$1** (id): Coprocess ID.
* **$2** (var): Variable name to store FD.

## coproc:get-stderr-fd()

Gets stderr FD linked to stderr of running coprocess.

### Arguments

* **$1** (id): Coprocess ID.
* **$2** (var): Variable name to store FD.

## coproc:get-stdout-only()

Gets only stdout of corresponding coprocess. Standard error
stream will be silently dropped.

### Arguments

* **$1** (id): Coprocess ID.

### Output on stdout

* Standard output stream of coprocess.

## coproc:get-stderr-only()

Gets only stderr of corresponding coprocess. Standard output
stream will be silently dropped.

### Arguments

* **$1** (id): Coprocess ID.

## coproc:close-fd()

Closes specified FD, previously opened by
`coproc:get-stdout-fd()` or `coproc:get-stderr-fd()` functions.

Descriptor must be closed to prevent leaking.

### Arguments

* **$1** (fd): FD to close.

## coproc:set-signal-stop()

Set type of linux process signal that will be used for stopping
coprocess. By default it will be SIGTERM. See also: coproc:stop()

### Arguments

* **$1** (id): Coprocess ID.
* **$2** (signal): Signal

## coproc:stop()

Stops specified coprocess with SIGTERM. If coprocess is still
alive after 0.1 second, kill it with SIGKILL. If coprocess requires root
privileges, kill it with sudo.

### Arguments

* **$1** (id): Coprocess ID.

## coproc:get-killed-code()

Returns error code which will be returned by `coproc:wait()` if
specified coprocess is killed or errored.

_Function has no arguments._

### Output on stdout

* Kill error code.

