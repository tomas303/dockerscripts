#!/bin/bash

################################################################################
# shell functions library for building fpc and lazarus                         #
################################################################################

# checkout from svn repository
# $1 - svn source path
# $2 - target directory(will be created)
function lib_svncheckout () {
	mkdir -p $2
	svn checkout --non-interactive --trust-server-cert $1 $2
}

# print variable's content for debug purpose
# $1 - variable name(exclamation does the trick of indirect reference)
function lib_printvar
{
  vname=$1
  echo $1=${!vname}
}

# call make action in directory
# $1 - directory to switch to
# $2 - make action to be called
function lib_make
(
  pushd $1
  lib_printvar pwd
  make $2
  local mstatus=$?
  popd
  return $mstatus
)

# check status passed as parameter and if not zero it will log it
# $1 - status to check
# $2 - command what cased given status
function lib_checkstatus
{
  local mstatus=$1
  if [ $mstatus -ne 0 ]; then
    echo "======================================================================"
    echo "error get status $mstatus when run $2"
    echo "======================================================================"
  fi
  return $mstatus
}

# will run given command with arguments, log command and log status
# exit batch when status is not zero
# parameters are command and it's arguments
function lib_run
{
  echo "======================================================================"
  echo "running:"
  echo "$*"
  echo "======================================================================"
  $*
  local mstatus=$?
  lib_checkstatus $mstatus "$*"
  if [ $mstatus -ne 0 ]; then exit $mstatus; fi
}

