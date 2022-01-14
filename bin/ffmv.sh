#!/bin/bash

# using default settings
# ffmpeg -i test.mov -q:v 0 test.mp4

ls *mov|while read id;do (ffmpeg -i  "$id" -vcodec libx264 -preset fast -crf 20 -y -vf "scale=1920:-1" "${id%%.*}.mp4"  );done
