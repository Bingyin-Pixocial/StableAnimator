export PYTORCH_CUDA_ALLOC_CONF=expandable_segments:True
python -c "import torch; torch.cuda.empty_cache()"

CUDA_VISIBLE_DEVICES=0,1,5,6 python inference_op.py \
 --pretrained_model_name_or_path="./checkpoints/stable-video-diffusion-img2vid-xt" \
 --output_dir="./output/op_infer" \
 --validation_control_folder="./inference/2/poses" \
 --validation_image="./inference/2/reference.png" \
 --validation_image_mask="./inference/2/reference_mask.png" \
 --validation_control_mask_folder="./inference/2/faces" \
 --width=512 \
 --height=512 \
 --guidance_scale=3.0 \
 --num_inference_steps=25 \
 --posenet_model_name_or_path="./checkpoints/Animation/pose_net.pth" \
 --face_encoder_model_name_or_path="./checkpoints/Animation/face_encoder.pth" \
 --unet_model_name_or_path="./checkpoints/Animation/unet.pth" \
 --face_embedding_extractor_weight_path="./checkpoints/Animation/glintr100_torch.pth" \
 --num_optimization_iter=3 \
 --start_refine_step=0 \
 --end_refine_step=20 \
 --max_frame_num=16 \
 --batch_frames=16 \
 --overlap=4 \
 --noise_aug_strength=0.02 \
 --frames_overlap=4 \
 --gradient_checkpointing