# path to Kinetics400 train set and val set
TRAIN_DATA_PATH='~/workspace/mmaction2/data/kinetics400/kinetics400_train_list_rawframes.txt'
VAL_DATA_PATH='~/workspace/mmaction2/data/kinetics400/kinetics400_val_list_rawframes.txt'
# path to root directory
ROOT_DIR='.'
# path to pretrain weights
PRETRAIN_WEIGHTS='./vit_base_patch16_224.pth'

python model_pretrain.py \
	-lr 0.005 -epoch 30 -batch_size 8 -num_workers 4 -num_frames 16 -frame_interval 16 -num_class 400 \
	-arch 'vivit' -attention_type 'fact_encoder' -optim_type 'sgd' -lr_schedule 'cosine' \
	-objective 'supervised' -root_dir $ROOT_DIR -train_data_path $TRAIN_DATA_PATH \
	-val_data_path $VAL_DATA_PATH -pretrain_pth $PRETRAIN_WEIGHTS -weights_from 'imagenet'