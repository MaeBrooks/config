#!/bin/zsh

source $HOME/.config/.scripts/lib/handlers.zsh

exit_if_exists terraform

function get_key_ring() {
  if [ -f /etc/apt/sources/list.d/hashicorp.list ] ; then
    exit 0
  fi

  wget -o- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor > /usr/share/keyrings/hashicorp-archive-keyring.gpg && \
  sudo gpg --no-default-keyring --keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg --fingerprint  && \
  sudo echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" > /etc/apt/sources.list.d/hashicorp.list

  return $?
}

function get_hashicorp_repos() {
  echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
  https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
  sudo tee /etc/apt/sources.list.d/hashicorp.list

  return $?
}

if exists apt ; then
  install gnupg
  install software-properties-common
elif 0 ; then
  printf ''
else
  echo "Terraform script not setup for your package manger, please update the script yourself"
  exit 1
fi
exit_if_failed "Failed to get pre reqs"

get_key_ring ;
exit_if_failed "Failed to get terraform key ring"

get_hashicorp_repos ;
exit_if_failed "Failed to get hashicorp repos"

if exists apt ; then
  sudo apt update -y
elif 0 ; then
  printf ''
else
  echo "Unable to update local package repos"
  exit 1
fi
exit_if_failed "Failed to update repos"

install terraform
exit_if_failed "Failed to install terraform"
