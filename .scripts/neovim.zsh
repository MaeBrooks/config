#!/bin/zsh

source $HOME/.config/.scripts/lib/handlers.zsh

exit_if_exists nvim

local nvim_version='v0.9.2'
local tar_file='nvim-linux64.tar.gz'
local download_url="https://github.com/neovim/neovim/releases/download/$nvim_version/$tar_file"
local target_dir="$HOME/.apps/nvim"
local backups_dir="$HOME/.backups"
local backup_dir="$backups_dir/nvim"
local unziped_folder_name=$(echo $tar_file | awk -F '.tar' '{print $1}')

function defer_to_cleanup() {
  if [ $? -eq 0 ] ; then
    return 0
  fi

  echo "Failed: $1"
  mv $backup_dir $target_dir
  exit 1
}

if [ -d $target_dir ]; then
  mkdir -p $backups_dir ;
  mv $target_dir $backup_dir
fi

wget $download_url
defer_to_cleanup "Failed to download tar file"
tar -xzvf $tar_file

defer_to_cleanup "Failed to unzip tar file"

rm $tar_file
defer_to_cleanup "Failed to remove downloaded tar file"

mkdir -p ~/.apps
defer_to_cleanup "Failed to create ~/.apps dir"

mv $unziped_folder_name $target_dir
defer_to_cleanup "Failed to move '$unziped_folder_name' to '$target_dir' dir"

echo 'export PATH=$PATH:$HOME/.apps/nvim/bin' >> ~/.zshrc ;
defer_to_cleanup "Failed to export path of nvim bin folder in $target_dir"

if [ -d $backups_dir ]; then
  rm -rf $backup_dir
fi
