#!/bin/bash

ffmpeg \
  -y \
  -r 60 \
  -i capture.mkv \
  -ss 3 \
  -vf subtitles=captions.srt \
  -r 30 \
  -plays 0 \
  tcs.apng
