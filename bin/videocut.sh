#!/bin/sh

name=$1

echo -n "start time hh mm ss: ";
read  hh mm ss

echo -n "stop time hh mm ss: ";
read  hhs mms sss

echo -n "name of output file: ";
read  output

ffmpeg -i "$name" -ss "$hh:$mm:$ss" -to "$hhs:$mms:$sss" -c copy "$output"
