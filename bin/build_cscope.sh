#!/bin/bash
TARGET=${1:-~/work/www/src}
cd $TARGET && find `pwd`/ -type f -name "*.php" -exec echo '"'{}'"' \; > "${TARGET}/cscope.files"
cscope -bkq
