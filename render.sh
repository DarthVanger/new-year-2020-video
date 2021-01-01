source ~/.bash_profile

sh cut.sh --preview
sh merge.sh
sh images.sh
vlc output/video.mp4
