#!/bin/bash 

echo OctoPrint Webcam Stream: $1
echo Stream Resolution: $2
echo Framerate $3
echo Stream URL posting to: $4

ffmpeg -re -f mjpeg -framerate $3 -i $1 -ar 44100 -ac 2 -acodec pcm_s16le -f s16le -ac 2 -i /dev/zero -acodec aac -ab 128k -strict experimental -s $2 -vcodec h264 -pix_fmt yuv420p -g 10 -vb 700k -framerate $3 -metadata:s:v:0 rotate=90 -f flv -filter:v $5 $4
