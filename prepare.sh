# extract frames from video
video_path=../UniAnimate-DiT/data/videos/source_video.mp4
root_path=inference/3
mv $root_path/*.png $root_path/reference.png
mkdir -p $root_path/frames
frame_folder_path=$root_path/frames
ffmpeg -i $video_path -q:v 1 -start_number 0 $frame_folder_path/frame_%d.png

# extract poses from frames
ref_image_path=$root_path/reference.png
poses_folder_path=$root_path/poses
python DWPose/skeleton_extraction.py --target_image_folder_path $frame_folder_path --ref_image_path $ref_image_path --poses_folder_path $poses_folder_path

# extract face masks from frames
python face_mask_extraction.py --image_folder="$root_path/"
mv $root_path/faces/reference.png $root_path/reference_mask.png
rm -rf $root_path/faces
python face_mask_extraction.py --image_folder="$root_path/frames"