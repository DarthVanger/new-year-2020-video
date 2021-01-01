!/bin/bash

########
Cut videos into pieces.
-ss is start time of cut
-t is duration of output
########

output_folder="output/pieces"

rm -rf output/pieces/*

case "$1" in
   --preview) source_folder="output/preview" ;;
           *) source_folder="source_video" ;;
     esac

echo "Cutting files from '${source_folder}'"

ffmpeg -y -ss 00:00:00 -i "${source_folder}/1.mp4"  -t 99 "${output_folder}/01.mp4"
ffmpeg -y -ss 00:02:51 -i "${source_folder}/1.mp4"  -t 4 "${output_folder}/02.mp4"
