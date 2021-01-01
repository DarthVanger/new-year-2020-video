# add images
#convert images/bezviz.jpg -resize 480x270 output/bezviz.jpg
convert images/bandera.jpg -resize 480x270 output/bandera.jpg
convert images/ussr.jpg -resize 480x270 output/ussr.jpg
#ffmpeg -y -i images/grad.mp4 -vf "scale=470:270" output/grad.mp4

ffmpeg -y -i  output/video.mp4 -i output/bezviz.jpg \
    -filter_complex "[0:v][1:v] overlay=0:0:enable='between(t,104,104.25)'" \
     output/temp2.mp4

ffmpeg -y -i output/temp2.mp4 -i output/grad.mp4 \
    -filter_complex "[0:v][1:v] overlay=0:0:enable='between(t,114.5,114.75)'" \
     output/temp3.mp4

ffmpeg -y -i output/temp3.mp4 -i output/ussr.jpg \
    -filter_complex "[0:v][1:v] overlay=0:0:enable='between(t,120,120.25)'" \
     output/temp4.mp4

ffmpeg -y -i output/temp4.mp4 -i output/bandera.jpg \
    -filter_complex "[0:v][1:v] overlay=0:0:enable='between(t,124,124.25)'" \
     output/video_t.mp4

#    -filter_complex "[0:v][1:v] overlay=0:0:enable='between(t,104,104.5)'" \
