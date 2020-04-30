#!/bin/bash
# Simple script to create bytecode files from Python source
set -e
if [[ $# == 0 ]]; then
    print 2>&1 "Need to pass a python file to compile"
fi
PYENV_VERSIONS="3.3.7 2.7.18"
for file in $*; do
    for version in $PYENV_VERSIONS; do
	pyenv local $version
	python ./compile-file.py "$1"
    done
    rm -v .pyenv_version *~ || /bin/true
    short=$(basename $file .py)
    git add -f ${short}*
done