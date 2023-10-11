#!/bin/bash

if [ -z "$HOME" ] ; then
  echo "variable: $$HOME not set, please set it"
  exit 1
fi

if [ ! -d "$HOME" ] ; then
  echo "\$HOME is $HOME which is not marked as a directory"
  exit 1
fi

if [ "$HOME" == "/root" ] ; then
  echo '$HOME needs to be not /root, please run with a overrided $HOME var'
  echo "example:"
  echo "  HOME=/home/foo ..."
  exit 1
fi
