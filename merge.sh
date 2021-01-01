#!/bin/bash

########
# Concat all *.mp4 videos in output/pieces/* folder
# Write merged video to ./merged.mp4
########

source_folder="output/pieces"
output_folder="output"

for filename in "${source_folder}"/*.mp4; do
  echo "file $filename" >> concat-list.txt
done

ffmpeg -y -f concat -i concat-list.txt "${output_folder}"/temp.mp4

## mix in the music
ffmpeg -y -i "${output_folder}"/temp.mp4 -vn -acodec copy "${output_folder}"/video_sound.aac

ffmpeg -y -f lavfi -i anullsrc=channel_layout=5.1:sample_rate=44100 -t 93 output/silence.mp3
ffmpeg -y -i concat:"output/silence.mp3|music/shedryk.mp3" -codec copy "${output_folder}"/music_temp.mp3
ffmpeg -y -i "${output_folder}"/music_temp.mp3 -filter:a "volume=0.3"  "${output_folder}"/music.mp3

ffmpeg -y \
  -i  "${output_folder}"/music.mp3 \
  -i "${output_folder}"/video_sound.aac \
  -filter_complex amix=inputs=2:duration=longest "${output_folder}"/audio.mp3

ffmpeg -i "${output_folder}"/temp.mp4 -i "${output_folder}"/audio.mp3 -c:v copy -c:a aac -map 0:v:0 -map 1:a:0  "${output_folder}"/merged.mp4

mv output/merged.mp4 output/video.mp4

echo "Concatenated videos list:"
cat concat-list.txt
rm concat-list.txt
