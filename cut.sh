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

ffmpeg -y -ss 00:00:00 -i "${source_folder}/1.mp4"  -t 94 "${output_folder}/01.mp4"
ffmpeg -y -ss 00:02:51 -i "${source_folder}/1.mp4"  -t 4 "${output_folder}/02.mp4"
ffmpeg -y -ss 00:00:02.5 -i "${source_folder}/2pad.mp4"  -t 7 "${output_folder}/03.mp4"
ffmpeg -y -ss 00:00:21 -i "${source_folder}/2pad.mp4"  -t 10.5 "${output_folder}/04.mp4"
ffmpeg -y -ss 00:00:02.5 -i "${source_folder}/3pad.mp4"  -t 7 "${output_folder}/05.mp4"
ffmpeg -y -ss 00:00:22 -i "${source_folder}/3pad.mp4"  "${output_folder}/06.mp4"
ffmpeg -y -ss 00:00:00 -i "${source_folder}/4pad.mp4"  -t 4 "${output_folder}/07.mp4"
ffmpeg -y -ss 00:00:50 -i "${source_folder}/4pad.mp4"  -t 11 "${output_folder}/08.mp4"
ffmpeg -y -ss 00:00:00 -i "${source_folder}/5pad.mp4"  -t 21.2 "${output_folder}/09.mp4"
