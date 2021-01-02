source ~/.bash_profile

sh cut.sh --preview
sh merge.sh
sh blend.sh --preview
#vlc output/video.mp4
vlc output/video_t.mp4
