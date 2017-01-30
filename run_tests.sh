#!/bin/bash

set -euo pipefail

_base_dir="$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"
source $_base_dir/vendor/github.com/reconquest/import.bash/import.bash

import:use github.com/reconquest/test-runner.bash

test-runner:run "${@}"
