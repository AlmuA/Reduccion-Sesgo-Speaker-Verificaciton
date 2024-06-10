# cd "/mnt/audias_data/users/aaguilera/voxceleb_trainer/"
# echo "Working directory: $(pwd)"
# source ~/.bashrc
# source /home/voz/anaconda3/etc/profile.d/conda.sh
# conda activate /export/anaconda3/envs/aaguilera_voxcal


model=ResNetSE34L
initial_model=baseline_lite_ap.model
encoder_type=SAP
trainfunc=angleproto

# model=ResNetSE34V2 
# initial_model=baseline_v2_ap.model
# encoder_type=ASP
# trainfunc=softmaxproto 

save_path=./exps/exp1_Voxceleb
test_path=/var/data/db/Voxceleb/Voxceleb1/wav/
# test_path=/mnt/db/Voxceleb/Voxceleb1/wav/ /var/data/db/Voxceleb/Voxceleb1/test/wav
train_path=/var/data/db/Voxceleb/Voxceleb2/dev/wav/
# train_path=/mnt/db/Voxceleb/Voxceleb2/dev/wav/
train_list=./veri/Train_list.txt
save_path_cal_scores=./exps/exp1_Voxceleb/scores
save_path_cal_emb1=./exps/exp1_Voxceleb/lab

test_list=./veri/veri_test.txt
python ./trainSpeakerNet.py --eval --model $model --log_input True \
                         --initial_model $initial_model --encoder_type $encoder_type \
                         --eval_frames 400 \
                         --save_path $save_path --trainfunc $trainfunc \
                         --train_path $train_path --test_path $test_path \
                         --train_list $train_list --test_list $test_list --sesgo test \
                         --save_path_cal_scores $save_path_cal_scores \
                         --save_path_cal_emb1 $save_path_cal_emb1 \
                         #--n_mels 64 
                         


test_list=./veri/list_m.txt
python ./trainSpeakerNet.py --eval --model $model --log_input True \
                         --initial_model $initial_model --encoder_type $encoder_type \
                         --eval_frames 400 \
                         --save_path $save_path --trainfunc $trainfunc \
                         --train_path $train_path --test_path $test_path \
                         --train_list $train_list --test_list $test_list --sesgo male \
                         --save_path_cal_scores $save_path_cal_scores \
                         --save_path_cal_emb1 $save_path_cal_emb1 \
                         #--n_mels 64 
                         

test_list=./veri/list_f.txt
python ./trainSpeakerNet.py --eval --model $model --log_input True \
                         --initial_model $initial_model --encoder_type $encoder_type \
                         --eval_frames 400 \
                         --save_path $save_path --trainfunc $trainfunc \
                         --train_path $train_path --test_path $test_path \
                         --train_list $train_list --test_list $test_list --sesgo female\
                         --save_path_cal_scores $save_path_cal_scores \
                         --save_path_cal_emb1 $save_path_cal_emb1 \
                         #--n_mels 64 
                         

test_list=./veri/list_USA.txt
python ./trainSpeakerNet.py --eval --model $model --log_input True \
                         --initial_model $initial_model --encoder_type $encoder_type \
                         --eval_frames 400 \
                         --save_path $save_path --trainfunc $trainfunc \
                         --train_path $train_path --test_path $test_path \
                         --train_list $train_list --test_list $test_list --sesgo usa\
                         --save_path_cal_scores $save_path_cal_scores \
                         --save_path_cal_emb1 $save_path_cal_emb1 \
                         #--n_mels 64 
                         

test_list=./veri/list_UK.txt
python ./trainSpeakerNet.py --eval --model $model --log_input True \
                         --initial_model $initial_model --encoder_type $encoder_type \
                         --eval_frames 400 \
                         --save_path $save_path --trainfunc $trainfunc \
                         --train_path $train_path --test_path $test_path \
                         --train_list $train_list --test_list $test_list --sesgo uk\
                         --save_path_cal_scores $save_path_cal_scores \
                         --save_path_cal_emb1 $save_path_cal_emb1 \
                         #--n_mels 64 

test_list=./veri/list_Canada.txt
python ./trainSpeakerNet.py --eval --model $model --log_input True \
                         --initial_model $initial_model --encoder_type $encoder_type \
                         --eval_frames 400 \
                         --save_path $save_path --trainfunc $trainfunc \
                         --train_path $train_path --test_path $test_path \
                         --train_list $train_list --test_list $test_list --sesgo canada \
                         --save_path_cal_scores $save_path_cal_scores \
                         --save_path_cal_emb1 $save_path_cal_emb1 \
                         #--n_mels 64 
                         

test_list=./veri/list_Australia.txt
python ./trainSpeakerNet.py --eval --model $model --log_input True \
                         --initial_model $initial_model --encoder_type $encoder_type \
                         --eval_frames 400 \
                         --save_path $save_path --trainfunc $trainfunc \
                         --train_path $train_path --test_path $test_path \
                         --train_list $train_list --test_list $test_list --sesgo autralia\
                         --save_path_cal_scores $save_path_cal_scores \
                         --save_path_cal_emb1 $save_path_cal_emb1 \
                         #--n_mels 64 
                         

test_list=./veri/list_Spain.txt
python ./trainSpeakerNet.py --eval --model $model --log_input True \
                         --initial_model $initial_model --encoder_type $encoder_type \
                         --eval_frames 400 \
                         --save_path $save_path --trainfunc $trainfunc \
                         --train_path $train_path --test_path $test_path \
                         --train_list $train_list --test_list $test_list --sesgo spain\
                         --save_path_cal_scores $save_path_cal_scores \
                         --save_path_cal_emb1 $save_path_cal_emb1 \
                         #--n_mels 64 
                         

test_list=./veri/list_Italy.txt
python ./trainSpeakerNet.py --eval --model $model --log_input True \
                         --initial_model $initial_model --encoder_type $encoder_type \
                         --eval_frames 400 \
                         --save_path $save_path --trainfunc $trainfunc \
                         --train_path $train_path --test_path $test_path \
                         --train_list $train_list --test_list $test_list --sesgo italy \
                         --save_path_cal_scores $save_path_cal_scores \
                         --save_path_cal_emb1 $save_path_cal_emb1 \
                         #--n_mels 64 
                         

test_list=./veri/list_India.txt
python ./trainSpeakerNet.py --eval --model $model --log_input True \
                         --initial_model $initial_model --encoder_type $encoder_type \
                         --eval_frames 400 \
                         --save_path $save_path --trainfunc $trainfunc \
                         --train_path $train_path --test_path $test_path \
                         --train_list $train_list --test_list $test_list --sesgo india\
                         --save_path_cal_scores $save_path_cal_scores \
                         --save_path_cal_emb1 $save_path_cal_emb1 \
                         #--n_mels 64 