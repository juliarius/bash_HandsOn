#!/bin/bash

##
## This script should print the message:
## "The script <script_name> has received the argument <argument>"
## Note the special variables $0 and $1 contain precisely this information
## Take advantage of string interpolation and the command "echo" to print the message
##
## ==================================================================================
##
## SAMPLE RUN
##
## ./usage.sh ACTG
## "The script usage.sh has received the argument ACTG"
##
## ==================================================================================
argument=$1
if [  "$argument" != "" ]; then
  echo "The script usage.sh has recieved the argument $argument"
  echo "The script usage.sh has recieved the argument $argument"
  echo "The script usage.sh has recieved the argument $argument"
  echo "The script usage.sh has recieved the argument $argument"
  echo "The script usage.sh has recieved the argument $argument"
else
  echo "No argument was provided"
fi


  
