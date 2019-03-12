#!/bin/bash
# Convert multiple audiofiles files to .m4a
# B. Nelissen
# Winter 2012-2013

# Concatenate to 1 big file:
# create a list of files to concatenate
# for f in ./*.mp3; do echo "file '$f'" >> mylist.txt; done
# start to concatenate them and convert them at once
# ffmpeg -f concat -i mylist.txt -strict experimental -loglevel info -ab 96k -ac 2 concatenatedaudio.mp3
# break file in 4 hour parts
# ffmpeg -i concatenatedaudio.mp3 -acodec copy -t 04:00:00 -ss 00:00:00 part1.mp3
# ffmpeg -i concatenatedaudio.mp3 -acodec copy -t 04:00:00 -ss 04:00:00 part2.mp3
# ffmpeg -i concatenatedaudio.mp3 -acodec copy -t 04:00:00 -ss 08:00:00 part3.mp3
# ffmpeg -i concatenatedaudio.mp3 -acodec copy -t 04:00:00 -ss 12:00:00 part4.mp3
# ffmpeg -i concatenatedaudio.mp3 -acodec copy -t 04:00:00 -ss 16:00:00 part5.mp3
# ffmpeg -i concatenatedaudio.mp3 -acodec copy -t 05:00:00 -ss 20:00:00 part6.mp3

# Convert multiple audiofiles files to .m4a
OUTPUTEXTENSION=".m4b"

if [ -f "$1" ] && [ -n "${1}" ] ; then
	# set variables
	FILE=$1
	filenameext=$(basename "$FILE")
	extension="${filenameext##*.}"
	filename="${FILE%.*}" # full path without extension
	# create folder and move file into that folder
  
  # actual command
  echo "Spoken audio quality (96k aac stereo) ($filename)"
  ffmpeg -i "$FILE" -c:a libfdk_aac -b:a 96k "$filename$OUTPUTEXTENSION"
  # ffmpeg -strict experimental -loglevel info -i "$1" -ab 96k -ac 2 "$filename$OUTPUTEXTENSION" # audiobook
  # ffmpeg -c:a libvo_aacenc -loglevel info -i "$FILE" -ab 256k -ac 2 -ar 48000 "$OUTPUTFILE" # high quality
else
	echo "No such file: $FILE"
fi
