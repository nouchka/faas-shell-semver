#!/bin/bash

set -- "${1:-$(</dev/stdin)}" "${@:2}"

[ ! -f "/usr/bin/semver-increment-func" ] || /usr/bin/semver-increment-func $1 $2
[ ! -f "./increment_version.sh" ] || ./increment_version.sh $1 $2

