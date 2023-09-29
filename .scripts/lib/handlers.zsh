#!/bin/zsh

function exists() {
  whatis $1 > /dev/null
  return $?;
}
export exists

function exit_if_exists() {
  local code="${2:=0}"
  if exists $1 ;
  then
    exit $code
  fi
}
export exit_if_exists

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

function try() {
  if $1 ;
  then
    printf ''
  else
    fail $2
  fi
}
export try
