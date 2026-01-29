#!/bin/bash

NUM1=100
NUM2=200

SUM=$(($NUM1+$NUM2))
echo "sum is $SUM"

fruits=("apple" "banana" "pomo")
echo "fruits are: ${fruits[@]}"
echo "first fruit is: ${fruits[0]}"

