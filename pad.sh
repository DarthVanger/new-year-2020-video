ffmpeg -y -i source_video/2.mp4 -vf scale="400x720" output/temp_pad.mp4
ffmpeg -y -i output/temp_pad.mp4 -filter_complex "[0]pad=w=1280:x=440:color=black" source_video/2pad.mp4

ffmpeg -y -i source_video/3.mp4 -vf scale="400x720" output/temp_pad.mp4
ffmpeg -y -i output/temp_pad.mp4 -filter_complex "[0]pad=w=1280:x=440:color=black" source_video/3pad.mp4

ffmpeg -y -i source_video/4.mp4 -vf scale="400x720" output/temp_pad.mp4
ffmpeg -y -i output/temp_pad.mp4 -filter_complex "[0]pad=w=1280:x=440:color=black" source_video/4pad.mp4

ffmpeg -y -i source_video/5.mp4 -vf scale="400x720" output/temp_pad.mp4
ffmpeg -y -i output/temp_pad.mp4 -filter_complex "[0]pad=w=1280:x=440:color=black" source_video/5pad.mp4
