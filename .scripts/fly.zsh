#!/bin/zsh

source $HOME/.config/.scripts/lib/handlers.zsh

exit_if_exists fly

local fly_version="7.10.0"
local tar_file="fly-$fly_version-linux-amd64.tgz"

wget "https://github.com/concourse/concourse/releases/download/v$fly_version/$tar_file"
exit_if_failed "Failed to grab tar file for fly"

tar -xzvf $tar_file
exit_if_failed "Failed to grab tar folder"

rm $tar_file
exit_if_failed "Failed to remove fly tar file"

if [ ! -f "./fly" ] ; then
  echo "expected unzip of $tar_file to result in fly executable, ./fly not found"
  exit 1
fi

sudo mv ./fly /usr/bin/fly
exit_if_failed "Failed to move ./fly to /usr/bin/fly"
