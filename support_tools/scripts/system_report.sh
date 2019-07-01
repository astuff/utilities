#!/bin/bash

OS_VER="$(lsb_release -d -s)"
KERNEL_VER="$(uname -r)"
SCRIPT_LOC="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

echo "OS: ${OS_VER}"
echo "Kernel: ${KERNEL_VER}"
echo "Script Location: ${SCRIPT_LOC}"
