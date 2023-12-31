#!/bin/zsh

source $HOME/.config/.scripts/lib/handlers.zsh

function install_go() {
  if exists go ; then
    return 0 ;
  fi
	local backups_folder="$HOME/.backups"
	local go_backup_folder="$backups_folder/go"
	local export_local_string='export PATH=$PATH:/usr/local/go/bin'
	local export_home_string='PATH=$PATH:$HOME/go/bin'

 	local BACKUP="$pwd/current_go_backup"
	local latest_go_version=$(eval "curl 'https://go.dev/VERSION?m=text' | head -n 1")
	exit_if_failed "Failed to get latest go version"

	local download_file_name="$latest_go_version.linux-amd64.tar.gz"

	wget "https://go.dev/dl/$download_file_name"
	exit_if_failed "Failed to download file: $download_file_name"

	sudo tar --directory /usr/local -xzf $download_file_name
	exit_if_failed "Failed to unzip go download file into /usr/share"

	rm $download_file_name
 	exit_if_failed "Failed to cleanup downloaded file: $download_file_name"

 	if grep -q "$export_local_string" ~/.zshrc ;
 	then
 		echo "Go local path export found, not adding export"
 	else
 		concat $export_local_string ~/.zshrc ;
 		exit_if_failed "Failed to add local go path, downlaoded, but not in path"
 	fi

 	if grep -q "$export_home_string" ~/.zshrc ;
 	then
 		echo "Go local path export found, not adding export"
 	else
 		concat $export_home_string ~/.zshrc ;
 		exit_if_failed "Failed to add home go path, downlaoded, but not in path"
 	fi

  source ~/.zshrc
  exit_if_failed "Unable to source zshrc, failed, go not in current path"
}

fucntion install_gopls() {
	if exists gopls ; then
    return 0
	fi
		
  go install golang.org/x/tools/gopls@latest
}

install_go
exit_if_failed "Failed to install go"

install_gopls
exit_if_failed "Failed to install gopls"
