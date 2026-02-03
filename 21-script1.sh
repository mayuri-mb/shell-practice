#!/bin/bash

country=INDIA

echo " I am in $country"
echo "pid of script1 : $$"

#sh 22-script2.sh  --> 1st way to call one script from another script

source 22-script2.sh