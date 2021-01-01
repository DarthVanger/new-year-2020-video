#ffmpeg -y  -i output/video.mp4  -t 98 output/01.mp4
#ffmpeg -y -ss 98 -i output/video.mp4  output/02.mp4
#ffmpeg -y -ss 4 -i source_video/shedryk.mp4  output/shedryk.mp4

ffmpeg -y -i output/02.mp4 -i output/shedryk.mp4 \
    -filter_complex "[0:v][1:v] blend=all_mode='overlay'" \
    output/blend-1.mp4

ffmpeg -y -i output/blend-1.mp4 -i output/shedryk.mp4 \
    -filter_complex "[0:v] format=rgba [a]; [1:v] format=rgba [b]; [a][b] blend=all_expr='A*if(gte(X,440/2.66), 1, 0)*if(lte(X,840/2.66), 1, 0) + B*if(gte(X,440/2.66), 0, 1) + B*if(lte(X,840/2.66), 0, 1)'" \
    output/blend.mp4

ffmpeg -y -i output/01.mp4 -i output/blend.mp4 \
    -filter_complex "[0:v][0:a][1:v][1:a] concat=n=2:v=1:a=1 [v] [a]" \
    -map "[v]" -map "[a]" output/video_t.mp4

#blend=all_expr='A*if(gte(X,440), 1, 0)+B'
    #-filter_complex "[0:v][1:v] blend=all_mode='multiply'" \
