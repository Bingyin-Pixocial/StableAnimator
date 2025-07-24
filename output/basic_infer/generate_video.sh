cd animated_images
ffmpeg -framerate 29 -i frame_%d.png -c:v libx264 -crf 10 -pix_fmt yuv420p ../animation.mp4
