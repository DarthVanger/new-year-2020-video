# add images
mv output/video.mp4 output/temp1.mp4
convert images/bezviz.jpg -resize 480x270 output/bezviz.jpg

ffmpeg -y -i  output/temp1.mp4 -i output/bezviz.jpg \
    -filter_complex "[0:v][1:v] overlay=0:0:enable='between(t,115,115.5)'" \
     output/video.mp4

#    -filter_complex "[0:v][1:v] overlay=0:0:enable='between(t,104,104.5)'" \
