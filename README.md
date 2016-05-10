Go-routines in bash.

![demo.gif](https://cloud.githubusercontent.com/assets/674812/15157631/4f665222-170e-11e6-8c26-ee71d6e30c5f.gif)


# Importing

## Using [import.bash](https://github.com/reconquest/import.bash)

```bash
import github.com/reconquest/coproc
```

# Usage

## Creating coprocess

```bash
coproc:run bc_proc "bc"
```

## Communicating with coprocess

### Setting up file descriptors

```bash
coproc:get-stdin-fd "$bc_proc" stdin

coproc:get-stdout-fd "$bc_proc" stdout
coproc:get-stderr-fd "$bc_proc" stderr
```

### Send line

```bash
echo "1+1" >&$stdin
```

### Receive line

```bash
read -u $stdout result
```

### Sending initial stdin

Also, stdin can be passed on creating coprocess:

```bash
coproc:run bc_proc "bc" <<< "1+4"

coproc:get-stdout-only "$bc_proc"  # will output 5
```
