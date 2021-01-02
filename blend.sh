case "$1" in
   --preview) source_folder="output/preview" ;;
           *) source_folder="source_video" ;;
     esac

ffmpeg -y  -i output/video.mp4 -t 120 output/01.mp4
ffmpeg -y -ss 120 -i output/video.mp4 -t 10 output/04.mp4
ffmpeg -y -ss 130 -i output/video.mp4 -t 5 output/05.mp4
ffmpeg -y -ss 135 -i output/video.mp4 -t 5 output/07.mp4
ffmpeg -y -ss 140 -i output/video.mp4 -t 10 output/08.mp4
ffmpeg -y -ss 150 -i output/video.mp4 output/09.mp4

ffmpeg -y -ss 10 -i $source_folder/shedryk.mp4 -t 8 output/shedryk.mp4
ffmpeg -y -i $source_folder/berlin-cut.mp4 -t 10 -vf 'fade=t=in:st=0:d=10' output/berlin.mp4
ffmpeg -y -i $source_folder/red-army-cut.mp4 -t 5 output/red-army.mp4
ffmpeg -y -ss 67 -i $source_folder/weed.mp4 -t 5 output/weed.mp4
ffmpeg -y -ss 22 -i $source_folder/berlin.mp4 -t 5 output/berlin2.mp4
ffmpeg -y -ss 121 -i $source_folder/maidan.mp4 -t 10 output/maidan.mp4
ffmpeg -y -ss 65 -i $source_folder/shedryk.mp4 -t 14 output/shedryk2.mp4

scale=1
# for preview
# scale=2.66

blend_expr="A*if(gte(X,440/$scale), 1, 0)*if(lte(X,840/$scale), 1, 0) + B*if(gte(X,440/$scale), 0, 1) + B*if(lte(X,840/$scale), 0, 1)"
filter_complex="[0:v][1:v]blend=all_expr='$blend_expr'"

ffmpeg -y -i output/04.mp4 -i output/berlin.mp4 \
    -filter_complex "$filter_complex" \
    output/b03.mp4

ffmpeg -y -i output/05.mp4 -i output/red-army.mp4 \
    -filter_complex "$filter_complex" \
    output/b04.mp4

ffmpeg -y -i output/07.mp4 -i output/berlin2.mp4 \
    -filter_complex "$filter_complex" \
    output/b06.mp4

ffmpeg -y -i output/08.mp4 -i output/maidan.mp4 \
    -filter_complex "$filter_complex" \
    output/b07.mp4

ffmpeg -y -i output/09.mp4 -i output/shedryk2.mp4 \
    -filter_complex "$filter_complex" \
    output/b08-1.mp4

# fade out
ffmpeg -y -i output/b08-1.mp4 -i output/shedryk2.mp4 -filter_complex "[0]settb=AVTB[v0];[1]settb=AVTB[v1]; [v0][v1]xfade=transition=fade:duration=10:offset=10" output/b08.mp4


ffmpeg -y -f concat -i blend-concat.txt output/video_t.mp4
