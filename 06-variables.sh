#!/bin/bash

start_time=$(date +%s)
echo "script executed at $start_time"
sleep 10
end_time=$(date +%s)
total_time=$(($end_time-$start_time))
echo "script ended in:: $total_timeS