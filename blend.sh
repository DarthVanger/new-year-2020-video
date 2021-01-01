ffmpeg -y  -i output/video.mp4  -t 98 output/01.mp4
ffmpeg -y -ss 98 -i output/video.mp4  -t 17 output/02.mp4
ffmpeg -y -ss 115 -i output/video.mp4 -t 5 output/03.mp4
ffmpeg -y -ss 120 -i output/video.mp4 -t 5 output/04.mp4
ffmpeg -y -ss 125 -i output/video.mp4 -t 5 output/05.mp4
ffmpeg -y -ss 130 -i output/video.mp4 -t 5 output/06.mp4
ffmpeg -y -ss 135 -i output/video.mp4 -t 5 output/07.mp4
ffmpeg -y -ss 140 -i output/video.mp4 output/08.mp4

ffmpeg -y -ss 6 -i source_video/shedryk.mp4 -t 17 output/shedryk.mp4
ffmpeg -y  -i output/preview/grad.mp4 -t 5 output/grad.mp4
ffmpeg -y  -i output/preview/berlin-cut.mp4 -t 5 output/berlin.mp4
ffmpeg -y  -i output/preview/red-army-cut.mp4 -t 5 output/red-army.mp4
ffmpeg -y  -ss 90 -i output/preview/church.mp4 -t 5 output/church.mp4
ffmpeg -y  -ss 22 -i output/preview/berlin.mp4 -t 5 output/berlin2.mp4
ffmpeg -y  -ss 349 -i output/preview/maidan.mp4 -t 10 output/maidan.mp4

ffmpeg -y -i output/02.mp4 -i output/shedryk.mp4 \
    -filter_complex "[0:v][1:v] blend=all_mode='overlay'" \
    output/b01-1.mp4

ffmpeg -y -i output/b01-1.mp4 -i output/shedryk.mp4 \
    -filter_complex "[0:v] format=rgba [a]; [1:v] format=rgba [b]; [a][b] blend=all_expr='A*if(gte(X,440/2.66), 1, 0)*if(lte(X,840/2.66), 1, 0) + B*if(gte(X,440/2.66), 0, 1) + B*if(lte(X,840/2.66), 0, 1)'" \
    output/b01.mp4

ffmpeg -y -i output/03.mp4 -i output/grad.mp4 \
    -filter_complex "[0:v][1:v] blend=all_mode='overlay'" \
    -shortest \
    output/b02-1.mp4

ffmpeg -y -i output/b02-1.mp4 -i output/grad.mp4 \
    -filter_complex "[0:v] format=rgba [a]; [1:v] format=rgba [b]; [a][b] blend=all_expr='A*if(gte(X,440/2.66), 1, 0)*if(lte(X,840/2.66), 1, 0) + B*if(gte(X,440/2.66), 0, 1) + B*if(lte(X,840/2.66), 0, 1)'" \
    -shortest \
    output/b02.mp4


ffmpeg -y -i output/04.mp4 -i output/berlin.mp4 \
    -filter_complex "[0:v][1:v] blend=all_mode='overlay'" \
    output/b03-1.mp4

ffmpeg -y -i output/b03-1.mp4 -i output/berlin.mp4 \
    -filter_complex "[0:v] format=rgba [a]; [1:v] format=rgba [b]; [a][b] blend=all_expr='A*if(gte(X,440/2.66), 1, 0)*if(lte(X,840/2.66), 1, 0) + B*if(gte(X,440/2.66), 0, 1) + B*if(lte(X,840/2.66), 0, 1)'" \
    output/b03.mp4


ffmpeg -y -i output/05.mp4 -i output/red-army.mp4 \
    -filter_complex "[0:v][1:v] blend=all_mode='overlay'" \
    output/b04-1.mp4

ffmpeg -y -i output/b04-1.mp4 -i output/red-army.mp4 \
    -filter_complex "[0:v] format=rgba [a]; [1:v] format=rgba [b]; [a][b] blend=all_expr='A*if(gte(X,440/2.66), 1, 0)*if(lte(X,840/2.66), 1, 0) + B*if(gte(X,440/2.66), 0, 1) + B*if(lte(X,840/2.66), 0, 1)'" \
    output/b04.mp4


ffmpeg -y -i output/06.mp4 -i output/church.mp4 \
    -filter_complex "[0:v][1:v] blend=all_mode='overlay'" \
    output/b05-1.mp4

ffmpeg -y -i output/b05-1.mp4 -i output/church.mp4 \
    -filter_complex "[0:v] format=rgba [a]; [1:v] format=rgba [b]; [a][b] blend=all_expr='A*if(gte(X,440/2.66), 1, 0)*if(lte(X,840/2.66), 1, 0) + B*if(gte(X,440/2.66), 0, 1) + B*if(lte(X,840/2.66), 0, 1)'" \
    output/b05.mp4


ffmpeg -y -i output/07.mp4 -i output/berlin2.mp4 \
    -filter_complex "[0:v][1:v] blend=all_mode='overlay'" \
    output/b06-1.mp4

ffmpeg -y -i output/b06-1.mp4 -i output/berlin2.mp4 \
    -filter_complex "[0:v] format=rgba [a]; [1:v] format=rgba [b]; [a][b] blend=all_expr='A*if(gte(X,440/2.66), 1, 0)*if(lte(X,840/2.66), 1, 0) + B*if(gte(X,440/2.66), 0, 1) + B*if(lte(X,840/2.66), 0, 1)'" \
    output/b06.mp4


ffmpeg -y -i output/08.mp4 -i output/maidan.mp4 \
    -filter_complex "[0:v][1:v] blend=all_mode='overlay'" \
    output/b07-1.mp4

ffmpeg -y -i output/b07-1.mp4 -i output/maidan.mp4 \
    -filter_complex "[0:v] format=rgba [a]; [1:v] format=rgba [b]; [a][b] blend=all_expr='A*if(gte(X,440/2.66), 1, 0)*if(lte(X,840/2.66), 1, 0) + B*if(gte(X,440/2.66), 0, 1) + B*if(lte(X,840/2.66), 0, 1)'" \
    output/b07.mp4

ffmpeg -y -f concat -safe 0 -i blend-concat.txt -c copy output/video_t.mp4
