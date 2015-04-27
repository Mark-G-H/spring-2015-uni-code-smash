#!/usr/bin/env bash

source /home/vagrant/.rvm/scripts/rvm

rvm use --install --create $1@$2

shift 2

if (( $# ))
then gem install $@
fi
