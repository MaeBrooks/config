#!/bin/zsh

source $HOME/.zshrc

function exists() {
  type $1 > /dev/null
  return $?;
}
export exists

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

function is_installed() {
  local code="{2:=0}"

  if exists dpkg ; then
    if dpkg -S "$1" >> /dev/null ; then
      return $code
    fi

    return 1
  fi

  echo "is_installed not supported for this package mangaer / system, please update it to do so"
  exit 1
}
export is_installed

function is_not_installed() {
  local code="${2:=0}"
    
  if is_installed "$1" ; then
    return 1
  fi

  return $code
}
export is_not_installed

function exit_if_installed() {
  local code="${2:=0}"
  
  if is_installed "$1" ; then
   exit $code
  fi
}
export exit_if_installed

function exit_if_not_installed() {
  local code="${2:=0}"
  if is_not_installed "$1" ; then
    if [ -n "$3" ] ; then
      echo $3
    fi
    
    exit $code
  fi
}
export exit_if_not_installed

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
