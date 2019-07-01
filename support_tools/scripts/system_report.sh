#!/bin/bash

OS_VER="$(lsb_release -d -s)"
KERNEL_VER="$(uname -r)"
SCRIPT_LOC="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
AUTOWARE_ROOT="$( cd ${SCRIPT_LOC}/../../../../../ && pwd )"

echo OS: ${OS_VER}
echo Kernel: ${KERNEL_VER}
echo Script Location: ${SCRIPT_LOC}
echo ""
echo ------- REPO STATUS -------

for repo in "$( cd ${AUTOWARE_ROOT}/src && find . -type d )"; do
  REPO_LOC="${AUTOWARE_ROOT}/src/$repo"
  GIT_STATUS="$( cd ${REPO_LOC} && git rev-parse --short HEAD)"
  GIT_DESC_STATUS_CODE=$( cd ${REPO_LOC} && git describe --exact-match HEAD > /dev/null 2>&1; echo $? )
  GIT_ON_TAG=$([ "${GIT_DESC_STATUS_CODE}"  == 0 ] && echo "Yes" || echo "No")
  echo $repo Repo Commit: ${GIT_STATUS}
  echo $repo Repo on Tagged Release? ${GIT_ON_TAG}

  if [ "${GIT_DESC_STATUS_CODE}" == 0 ]; then
    echo $repo Tagged Release: $( cd ${REPO_LOC} && git describe --exact-match HEAD )
  fi
  echo ""
done
