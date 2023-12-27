#! /usr/bin/env bash

DIR_SRC=$(dirname "$1")
echo $DIR_SRC
FILENAME=${1##*/}
FILENAME=${FILENAME%%.*}
echo $FILENAME
EXTENSION=${1##*.}
echo $FILENAME $EXTENSION

FILE_FINAL="$DIR_SRC/$FILENAME.mov"

if [ -e $FILE_FINAL ]; then
    FILE_FINAL="$DIR_SRC/$FILENAME.mp4"
fi

ffmpeg -vcodec h264 -i $1 -crf 24 -an "$FILE_FINAL"
echo "OUTPUT: $FILE_FINAL"
