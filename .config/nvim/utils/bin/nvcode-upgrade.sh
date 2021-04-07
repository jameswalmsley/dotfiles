#!/bin/bash

source nvcode-env.sh

PARAMS=""
while (( "$#" )); do
  case "$1" in
    -g|--global)
      GLOBAL=1
      shift
      ;;
    -i|--info)
      INFO=1
      shift
      ;;
    -*|--*=) # unsupported flags
      echo "Error: Unsupported flag $1" >&2
      exit 1
      ;;
    *) # preserve positional arguments
      PARAMS="$PARAMS $1"
      shift
      ;;
  esac
done
# set positional arguments in their proper place
eval set -- "$PARAMS"

if [[ -v INFO ]]; then
  echo "NVCODE_BASE: ${NVCODE_BASE}"
  echo "NVCODE_USER: ${NVCODE_USER}"
  echo "NVCODE_USER_CONFIG: ${NVCODE_USER_CONFIG}"
  exit 1
fi

cloneconfig() {
  echo "Cloning NVCode configuration"
  sudo mkdir -p ${NVCODE_BASE}
  sudo git clone https://github.com/jameswalmsley/nvcode.git -b global-install ${NVCODE_BASE}/nvim
  sudo rm /usr/local/bin/nv
  sudo ln -s ${NVCODE_BASE}/nvim/utils/bin/nv /usr/local/bin/nv
  sudo touch ${NVCODE_BASE}/.packer_sync
}

upgrade_nvcode() {
  echo upgrading
  cd ${NVCODE_BASE}/nvim && sudo git fetch && sudo git reset --hard origin/global-install
  sudo rm /usr/local/bin/nv
  sudo ln -s ${NVCODE_BASE}/nvim/utils/bin/nv /usr/local/bin/nv
  sudo touch ${NVCODE_BASE}/.packer_sync
}

install_nvcode() {
  echo installing
  cloneconfig
}
echo ${NVCODE_BASE}
[ -d "${NVCODE_BASE}" ] && upgrade_nvcode || install_nvcode

