ffmpeg -y  -i output/video.mp4 -t 120 output/01.mp4
ffmpeg -y -ss 120 -i output/video.mp4 -t 5 output/04.mp4
ffmpeg -y -ss 125 -i output/video.mp4 -t 5 output/05.mp4
ffmpeg -y -ss 130 -i output/video.mp4 -t 5 output/06.mp4
ffmpeg -y -ss 135 -i output/video.mp4 -t 5 output/07.mp4
ffmpeg -y -ss 140 -i output/video.mp4 -t 10 output/08.mp4
ffmpeg -y -ss 150 -i output/video.mp4 output/09.mp4

ffmpeg -y -ss 10 -i source_video/shedryk.mp4 -t 8 output/shedryk.mp4
ffmpeg -y -i output/preview/grad.mp4 -t 5 output/grad.mp4
ffmpeg -y -i output/preview/berlin-cut.mp4 -t 5 -vf 'fade=t=in:st=0:d=10' output/berlin.mp4
ffmpeg -y -i output/preview/red-army-cut.mp4 -t 5 output/red-army.mp4
ffmpeg -y -ss 67 -i output/preview/weed.mp4 -t 5 output/weed.mp4
ffmpeg -y -ss 22 -i output/preview/berlin.mp4 -t 5 output/berlin2.mp4
#ffmpeg -y -ss 349 -i output/preview/maidan.mp4 -t 10 output/maidan.mp4
ffmpeg -y -ss 121 -i output/preview/maidan.mp4 -t 10 output/maidan.mp4
ffmpeg -y -ss 57 -i source_video/shedryk.mp4 -t 22 output/shedryk2.mp4

ffmpeg -y -i output/04.mp4 -i output/berlin.mp4 \
    -filter_complex "[0:v] format=rgba [a]; [1:v] format=rgba [b]; [a][b] blend=all_expr='A*if(gte(X,440/2.66), 1, 0)*if(lte(X,840/2.66), 1, 0) + B*if(gte(X,440/2.66), 0, 1) + B*if(lte(X,840/2.66), 0, 1)'" \
    output/b03.mp4

ffmpeg -y -i output/05.mp4 -i output/red-army.mp4 \
    -filter_complex "[0:v] format=rgba [a]; [1:v] format=rgba [b]; [a][b] blend=all_expr='A*if(gte(X,440/2.66), 1, 0)*if(lte(X,840/2.66), 1, 0) + B*if(gte(X,440/2.66), 0, 1) + B*if(lte(X,840/2.66), 0, 1)'" \
    output/b04.mp4

ffmpeg -y -i output/06.mp4 -i output/grad.mp4 \
    -filter_complex "[0:v][1:v] blend=all_mode='overlay':all_opacity=0.5" \
    output/b05-1.mp4

ffmpeg -y -i output/b05-1.mp4 -i output/grad.mp4 \
    -filter_complex "[0:v] format=rgba [a]; [1:v] format=rgba [b]; [a][b] blend=all_expr='A*if(gte(X,440/2.66), 1, 0)*if(lte(X,840/2.66), 1, 0) + B*if(gte(X,440/2.66), 0, 1) + B*if(lte(X,840/2.66), 0, 1)'" \
    output/b05.mp4

ffmpeg -y -i output/07.mp4 -i output/berlin2.mp4 \
    -filter_complex "[0:v] format=rgba [a]; [1:v] format=rgba [b]; [a][b] blend=all_expr='A*if(gte(X,440/2.66), 1, 0)*if(lte(X,840/2.66), 1, 0) + B*if(gte(X,440/2.66), 0, 1) + B*if(lte(X,840/2.66), 0, 1)'" \
    output/b06.mp4

ffmpeg -y -i output/08.mp4 -i output/maidan.mp4 \
    -filter_complex "[0:v] format=rgba [a]; [1:v] format=rgba [b]; [a][b] blend=all_expr='A*if(gte(X,440/2.66), 1, 0)*if(lte(X,840/2.66), 1, 0) + B*if(gte(X,440/2.66), 0, 1) + B*if(lte(X,840/2.66), 0, 1)'" \
    output/b07.mp4

ffmpeg -y -i output/09.mp4 -i output/shedryk2.mp4 \
    -filter_complex "[0:v] format=rgba [a]; [1:v] format=rgba [b]; [a][b] blend=all_expr='A*if(gte(X,440/2.66), 1, 0)*if(lte(X,840/2.66), 1, 0) + B*if(gte(X,440/2.66), 0, 1) + B*if(lte(X,840/2.66), 0, 1)'" \
    output/b08.mp4


ffmpeg -y -f concat -i blend-concat.txt output/video_t.mp4
