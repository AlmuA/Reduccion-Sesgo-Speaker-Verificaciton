#!/bin/bash
#$ -S /bin/bash
#$ -V
#$ -q all.q
#$ -l gpu=2,mem_free=10G

log=${1%.*}'.log'

#$ -o /mnt/audias_data/users/aaguilera/voxceleb_trainer/qsub_exp3Outs
#$ -e /mnt/audias_data/users/aaguilera/voxceleb_trainer/qsub_exp3Error


if [ $# -eq 0 ]; then
   echo "Usage: $0 python.py"
   exit
fi


cd "/mnt/audias_data/users/aaguilera/voxceleb_trainer"
echo "$(pwd)"
source ~/.bashrc
#conda init
source /home/voz/anaconda3/etc/profile.d/conda.sh
conda activate aaguilera_voxcal

ulimit -t 2592000
ngpus=2
##############################
nvidia_smi_output=$(nvidia-smi -L)
if [ ${?} -eq 0 ]; then
    n_gpus=$(echo "${nvidia_smi_output}" | wc -l)
else
    n_gpus=0
fi

if [ ${n_gpus} -eq 0 ]; then
    # There is no GPU/CUDA on this machine.
    echo "No gpus"
    exit 0
fi

for i in $(seq 1 $n_gpus); do
    gpu_id=$((i-1))
    status=`nvidia-smi -i ${gpu_id} | grep -c "No running processes found"`
    if [ "$status" = "1" ]; then
        if [ ! -z ${free_gpus} ]; then
            free_gpus=${free_gpus},
        fi
        free_gpus=${free_gpus}${gpu_id}
    fi
done

echo $n_gpus
echo $free_gpus
export CUDA_VISIBLE_DEVICES=${free_gpus:0:$((${ngpus}*2-1))}
echo $CUDA_VISIBLE_DEVICES
################################

model=ResNetSE34L
encoder_type=SAP
trainfunc=amsoftmax
save_path=exp/exp3_Fairvoice
train_path=/mnt/audias_data/data/FairVoice/FairVoice/FairVoice/
test_path=/mnt/audias_data/data/FairVoice/FairVoice/FairVoice/
train_list=./EngEsp_List3/list_generales/EspEng_train.txt
test_list=./EngEsp_List3/list_generales/EspEng_test.txt

CUDA_VISIBLE_DEVICES=${free_gpus:0:$((${ngpus}*2-1))} python $1 --model $model \
        --log_input True \
        --trainfunc $trainfunc \
        --save_path $save_path \
        --train_list $train_list \
        --test_list $test_list \
        --max_epoch 400 \
        --train_path $train_path \
        --test_path $test_path \
        --batch_size 100 \
        --sesgo Test \
        --save_path_cal_scores $save_path\
        --save_path_cal_emb1 $save_path\ 

