#!/bin/bash

# Colors definitions
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color
BOLD=$(tput bold)
NORMAL=$(tput sgr0)

# Check if necessary applications are installed
if ! [ -x "$(command -v wget)" ]; then
  printf "\n${RED}wget not found in path. Please install it to continue!${NC}\n"
  exit
fi

if ! [ -x "$(command -v curl)" ]; then
  printf "\n${RED}curl not found in path. Please install it to continue!${NC}\n"
  exit
fi

if ! [ -x "$(command -v xmllint)" ]; then
  printf "\n${RED}xmllint not found in path. Please install it to continue!${NC}\n"
  exit
fi

if ! [ -x "$(command -v datediff)" ]; then
  printf "\n${RED}dateutils not found in path. Please install it to continue!${NC}\n"
  exit
fi

# Get newest Neovim Nightly info
wget https://github.com/neovim/neovim/releases/tag/nightly -q -O - > /tmp/nvim28dce75c-4317-4006-a103-8069d573e2b2
RESPONSE=$(wget https://github.com/neovim/neovim/releases/tag/nightly --save-headers -O - 2>&1)

if [[ "$RESPONSE" =~ 404\ Not\ Found ]]; then
  printf "${RED}Couldn't fetch newest Neovim Nighly info. Aborting...${NC}\n"
  exit
fi

# Variables
SHOW_PROMPT=0
CURR_NVIM_VER=$(nvim --version | head -n 1)
NEW_NVIM_VER=$(xmllint --html --xpath "//pre//code/node()" /tmp/nvim28dce75c-4317-4006-a103-8069d573e2b2 2>/dev/null | grep NVIM)
CURR_DATETIME_ISO=$(date --iso-8601=ns)
NEW_NVIM_VER_RELEASE_DATETIME_ISO=$(xmllint --html --xpath "string(//relative-time/@datetime)" /tmp/nvim28dce75c-4317-4006-a103-8069d573e2b2 2>/dev/null)
LAST_RELEASE_DATETIME_DIFF=$(datediff ${NEW_NVIM_VER_RELEASE_DATETIME_ISO} ${CURR_DATETIME_ISO} -f "%H hours %M minutes ago")

# Check if Neovim Nightly exists in repo
if [[ "$NEW_NVIM_VER" == "" ]]; then
  printf "\n${RED}Couldn't fetch latest Neovim Nightly version from github repo! Check if it exists. Aborting...${NC}\n"
  exit
fi

# Check if the current neovim version is the latest
if [[ "$CURR_NVIM_VER" == "$NEW_NVIM_VER" ]]; then
  printf "\n${RED}No new version of ${BOLD}Neovim Nightly${NORMAL}${RED} found!\n${NC}Last release: ${LAST_RELEASE_DATETIME_DIFF}\nAborting...\n"
  exit
fi

# If a newer version of Neovim Nightly found show prompt
if [[ CURR_NVIM_VER != NEW_NVIM_VER ]]; then
  printf "\n${GREEN}New ${BOLD}Neovim Nightly${NORMAL}${GREEN} version found!${NC}\n${CURR_NVIM_VER} -> ${BOLD}${NEW_NVIM_VER}${NORMAL}\nReleased: ${LAST_RELEASE_DATETIME_DIFF}\n\n"
  SHOW_PROMPT=1
fi

# Update function
update_neovim() {
  printf "${RED}Updating Neovim Nightly...${NC}\n"
  HTTPS_URL="https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage"
  CURL_CMD="curl -L -w http_code=%{http_code}"
  CURL_OUTPUT=`${CURL_CMD} ${HTTPS_URL} -o /tmp/nvim`
  HTTP_CODE=$(echo "${CURL_OUTPUT}" | sed -e 's/.*\http_code=//')
  ERROR_MESSAGE=$(echo "${CURL_OUTPUT}" | sed -e 's/http_code.*//')

  if [[ ${HTTP_CODE} == 200 ]]; then
    chmod +x /tmp/nvim;
    sudo cp /tmp/nvim /usr/local/bin;
    sudo mv /tmp/nvim /usr/bin;
    printf "${GREEN}Neovim Nightly has been updated successfully!${NC}\n"
  else
    printf "${RED}Neovim Nightly has NOT been updated! ERROR: ${ERROR_MESSAGE}${NC}\n"
  fi
}

rm /tmp/nvim28dce75c-4317-4006-a103-8069d573e2b2

while [ $SHOW_PROMPT -gt 0 ]; do
    read -p "Do you wish to update neovim? [yes/no] " yn
    case $yn in
        [Yy]* ) update_neovim; break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
