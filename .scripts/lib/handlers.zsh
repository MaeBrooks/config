#!/bin/zsh

source ~/.zshrc

function install() {
  if exists apt ;
  then
    sudo apt install -y $@
    return $?
  fi

  echo "Cannot install '@a' no package manager found"
  return 1
}
export install

function exists() {
  type $1 > /dev/null
  return $?;
}
export exists

function exit_if_exists() {
  local code="${2:=0}"
  if exists $1 ;
  then
    if [ -n "$3" ] ; then
      echo $3
    fi

    exit $code
  fi
}
export exit_if_exists

function exit_if_not_exists() {
  local code="${2:=0}"
  exists $1
  if [ $? -ne 0 ] ;
  then
    if [ -n "$3" ] ; then
      echo $3
    fi

    exit $code
  fi
}
export exit_if_not_exists

function fail() {
  local reason="${1:=Failure, reason not passed}"
  local code="${2:=1}"
  echo $reason ;
  exit $code ;
}
export fail

function exit_if_failed() {
  if [ $? -eq 0 ] ;
  then
    printf '';
  else
    fail "$1" $2
  fi
}
export exit_if_failed

function exit_if_success() {
  if [ $? -eq 0 ] ;
  then
    exit 0
    printf '';
  else
    fail "$1" $2
  fi
}
export exit_if_success

function concat() {
  local str=$1
  local file=$2
  echo $str >> $file
  return $?
}
export concat
