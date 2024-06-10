# source ~/.bashrc
# source /home/voz/anaconda3/etc/profile.d/conda.sh
# conda activate /export/anaconda3/envs/aaguilera_voxcal
# /mnt/audias_data/users/aaguilera/voxceleb_trainer/

#  /mnt/audias_data/data/FairVoice/FairVoice/FairVoice/Spanish
#  /mnt/audias_data/data/FairVoice/FairVoice/FairVoice/English


model=ResNetSE34L
initial_model=exp/exp2_FairVoice/model/model000000400.model
encoder_type=SAP
trainfunc=angleproto
save_path=exps/exp2_FairVoice
train_path=/mnt/audias_data/data/FairVoice/FairVoice/FairVoice/
train_list=./EspEng_List/noBalance/list_train.txt

test_path=/mnt/audias_data/data/FairVoice/FairVoice/FairVoice/
test_list=./EspEng_List/noBalance/list_test.txt
save_path_cal_scores=exps/exp2_FairVoice/scores
save_path_cal_emb1=exps/exp2_FairVoice/labels
nameSesgos=general
python ./trainSpeakerNet.py --eval --model $model --log_input True \
                         --initial_model $initial_model --encoder_type $encoder_type \
                         --eval_frames 400 \
                         --save_path $save_path --trainfunc $trainfunc \
                         --train_path $train_path --test_path $test_path \
                         --train_list $train_list --test_list $test_list \
                         --nPerSpeaker 5 --sesgo $nameSesgos \
                         --save_path_cal_scores $save_path_cal_scores \
                         --save_path_cal_emb1 $save_path_cal_emb1 \

test_list=./EspEng_List/noBalance/list_female.txt
nameSesgos=female
python ./trainSpeakerNet.py --eval --model $model --log_input True \
                         --initial_model $initial_model --encoder_type $encoder_type \
                         --eval_frames 400 \
                         --save_path $save_path --trainfunc $trainfunc \
                         --train_path $train_path --test_path $test_path \
                         --train_list $train_list --test_list $test_list \
                         --nPerSpeaker 5 --sesgo $nameSesgos \
                         --save_path_cal_scores $save_path_cal_scores \
                         --save_path_cal_emb1 $save_path_cal_emb1 \

test_list=./EspEng_List/noBalance/list_junior_female.txt
nameSesgos=femalejunior
python ./trainSpeakerNet.py --eval --model $model --log_input True \
                         --initial_model $initial_model --encoder_type $encoder_type \
                         --eval_frames 400 \
                         --save_path $save_path --trainfunc $trainfunc \
                         --train_path $train_path --test_path $test_path \
                         --train_list $train_list --test_list $test_list \
                         --nPerSpeaker 5 --sesgo $nameSesgos \
                         --save_path_cal_scores $save_path_cal_scores \
                         --save_path_cal_emb1 $save_path_cal_emb1 \

test_list=./EspEng_List/noBalance/list_junior_male.txt
nameSesgos=malejunior
python ./trainSpeakerNet.py --eval --model $model --log_input True \
                         --initial_model $initial_model --encoder_type $encoder_type \
                         --eval_frames 400 \
                         --save_path $save_path --trainfunc $trainfunc \
                         --train_path $train_path --test_path $test_path \
                         --train_list $train_list --test_list $test_list \
                         --nPerSpeaker 5 --sesgo $nameSesgos \
                         --save_path_cal_scores $save_path_cal_scores \
                         --save_path_cal_emb1 $save_path_cal_emb1 \

test_list=./EspEng_List/noBalance/list_junior.txt
nameSesgos=junior
python ./trainSpeakerNet.py --eval --model $model --log_input True \
                         --initial_model $initial_model --encoder_type $encoder_type \
                         --eval_frames 400 \
                         --save_path $save_path --trainfunc $trainfunc \
                         --train_path $train_path --test_path $test_path \
                         --train_list $train_list --test_list $test_list \
                         --nPerSpeaker 5 --sesgo $nameSesgos \
                         --save_path_cal_scores $save_path_cal_scores \
                         --save_path_cal_emb1 $save_path_cal_emb1 \

test_list=./EspEng_List/noBalance/list_senior.txt
nameSesgos=senior
python ./trainSpeakerNet.py --eval --model $model --log_input True \
                         --initial_model $initial_model --encoder_type $encoder_type \
                         --eval_frames 400 \
                         --save_path $save_path --trainfunc $trainfunc \
                         --train_path $train_path --test_path $test_path \
                         --train_list $train_list --test_list $test_list \
                         --nPerSpeaker 5 --sesgo $nameSesgos \
                         --save_path_cal_scores $save_path_cal_scores \
                         --save_path_cal_emb1 $save_path_cal_emb1 \

test_list=./EspEng_List/noBalance/list_male.txt
nameSesgos=male
python ./trainSpeakerNet.py --eval --model $model --log_input True \
                         --initial_model $initial_model --encoder_type $encoder_type \
                         --eval_frames 400 \
                         --save_path $save_path --trainfunc $trainfunc \
                         --train_path $train_path --test_path $test_path \
                         --train_list $train_list --test_list $test_list \
                         --nPerSpeaker 5 --sesgo $nameSesgos \
                         --save_path_cal_scores $save_path_cal_scores \
                         --save_path_cal_emb1 $save_path_cal_emb1 \

test_list=./EspEng_List/noBalance/list_senior_female.txt
nameSesgos=femalesenior
python ./trainSpeakerNet.py --eval --model $model --log_input True \
                         --initial_model $initial_model --encoder_type $encoder_type \
                         --eval_frames 400 \
                         --save_path $save_path --trainfunc $trainfunc \
                         --train_path $train_path --test_path $test_path \
                         --train_list $train_list --test_list $test_list \
                         --nPerSpeaker 5 --sesgo $nameSesgos \
                         --save_path_cal_scores $save_path_cal_scores \
                         --save_path_cal_emb1 $save_path_cal_emb1 \

test_list=./EspEng_List/noBalance/list_senior_male.txt
nameSesgos=seniorMale
python ./trainSpeakerNet.py --eval --model $model --log_input True \
                         --initial_model $initial_model --encoder_type $encoder_type \
                         --eval_frames 400 \
                         --save_path $save_path --trainfunc $trainfunc \
                         --train_path $train_path --test_path $test_path \
                         --train_list $train_list --test_list $test_list \
                         --nPerSpeaker 5 --sesgo $nameSesgos \
                         --save_path_cal_scores $save_path_cal_scores \
                         --save_path_cal_emb1 $save_path_cal_emb1 \


Acentos Ingles 
test_path=/mnt/audias_data/data/FairVoice/FairVoice/FairVoice/English/
test_list=./EspEng_List/noBalance/listas_acentos/list_african.txt
nameSesgos=african
python ./trainSpeakerNet.py --eval --model $model --log_input True \
                         --initial_model $initial_model --encoder_type $encoder_type \
                         --eval_frames 400 \
                         --save_path $save_path --trainfunc $trainfunc \
                         --train_path $train_path --test_path $test_path \
                         --train_list $train_list --test_list $test_list \
                         --nPerSpeaker 5 --sesgo $nameSesgos \
                         --save_path_cal_scores $save_path_cal_scores \
                         --save_path_cal_emb1 $save_path_cal_emb1 \

test_list=./EspEng_List/noBalance/listas_acentos/list_australia.txt
nameSesgos=australia
python ./trainSpeakerNet.py --eval --model $model --log_input True \
                         --initial_model $initial_model --encoder_type $encoder_type \
                         --eval_frames 400 \
                         --save_path $save_path --trainfunc $trainfunc \
                         --train_path $train_path --test_path $test_path \
                         --train_list $train_list --test_list $test_list \
                         --nPerSpeaker 5 --sesgo $nameSesgos \
                         --save_path_cal_scores $save_path_cal_scores \
                         --save_path_cal_emb1 $save_path_cal_emb1 \

test_list=./EspEng_List/noBalance/listas_acentos/list_canada.txt
nameSesgos=canada
python ./trainSpeakerNet.py --eval --model $model --log_input True \
                         --initial_model $initial_model --encoder_type $encoder_type \
                         --eval_frames 400 \
                         --save_path $save_path --trainfunc $trainfunc \
                         --train_path $train_path --test_path $test_path \
                         --train_list $train_list --test_list $test_list \
                         --nPerSpeaker 5 --sesgo $nameSesgos \
                         --save_path_cal_scores $save_path_cal_scores \
                         --save_path_cal_emb1 $save_path_cal_emb1 \

test_list=./EspEng_List/noBalance/listas_acentos/list_england.txt
nameSesgos=england
python ./trainSpeakerNet.py --eval --model $model --log_input True \
                         --initial_model $initial_model --encoder_type $encoder_type \
                         --eval_frames 400 \
                         --save_path $save_path --trainfunc $trainfunc \
                         --train_path $train_path --test_path $test_path \
                         --train_list $train_list --test_list $test_list \
                         --nPerSpeaker 5 --sesgo $nameSesgos \
                         --save_path_cal_scores $save_path_cal_scores \
                         --save_path_cal_emb1 $save_path_cal_emb1 \


test_list=./EspEng_List/noBalance/listas_acentos/list_inidan.txt
nameSesgos=inidan
python ./trainSpeakerNet.py --eval --model $model --log_input True \
                         --initial_model $initial_model --encoder_type $encoder_type \
                         --eval_frames 400 \
                         --save_path $save_path --trainfunc $trainfunc \
                         --train_path $train_path --test_path $test_path \
                         --train_list $train_list --test_list $test_list \
                         --nPerSpeaker 5 --sesgo $nameSesgos \
                         --save_path_cal_scores $save_path_cal_scores \
                         --save_path_cal_emb1 $save_path_cal_emb1 \

test_list=./EspEng_List/noBalance/listas_acentos/list_ireland.txt
nameSesgos=ireland
python ./trainSpeakerNet.py --eval --model $model --log_input True \
                         --initial_model $initial_model --encoder_type $encoder_type \
                         --eval_frames 400 \
                         --save_path $save_path --trainfunc $trainfunc \
                         --train_path $train_path --test_path $test_path \
                         --train_list $train_list --test_list $test_list \
                         --nPerSpeaker 5 --sesgo $nameSesgos \
                         --save_path_cal_scores $save_path_cal_scores \
                         --save_path_cal_emb1 $save_path_cal_emb1 \

test_list=./EspEng_List/noBalance/listas_acentos/list_newzealand.txt
nameSesgos=newzealand
python ./trainSpeakerNet.py --eval --model $model --log_input True \
                         --initial_model $initial_model --encoder_type $encoder_type \
                         --eval_frames 400 \
                         --save_path $save_path --trainfunc $trainfunc \
                         --train_path $train_path --test_path $test_path \
                         --train_list $train_list --test_list $test_list \
                         --nPerSpeaker 5 --sesgo $nameSesgos \
                         --save_path_cal_scores $save_path_cal_scores \
                         --save_path_cal_emb1 $save_path_cal_emb1 \

test_list=./EspEng_List/noBalance/listas_acentos/list_us.txt
nameSesgos=us
python ./trainSpeakerNet.py --eval --model $model --log_input True \
                         --initial_model $initial_model --encoder_type $encoder_type \
                         --eval_frames 400 \
                         --save_path $save_path --trainfunc $trainfunc \
                         --train_path $train_path --test_path $test_path \
                         --train_list $train_list --test_list $test_list \
                         --nPerSpeaker 5 --sesgo $nameSesgos \
                         --save_path_cal_scores $save_path_cal_scores \
                         --save_path_cal_emb1 $save_path_cal_emb1 \


## Acentos Español 
test_path=/mnt/audias_data/data/FairVoice/FairVoice/FairVoice/Spanish/
test_list=./EspEng_List/noBalance/listas_acentos/list_ba_erdialdekoa_nafarra.txt
nameSesgos=baerdialdekoanafarra
python ./trainSpeakerNet.py --eval --model $model --log_input True \
                         --initial_model $initial_model --encoder_type $encoder_type \
                         --eval_frames 400 \
                         --save_path $save_path --trainfunc $trainfunc \
                         --train_path $train_path --test_path $test_path \
                         --train_list $train_list --test_list $test_list \
                         --nPerSpeaker 5 --sesgo $nameSesgos \
                         --save_path_cal_scores $save_path_cal_scores \
                         --save_path_cal_emb1 $save_path_cal_emb1 \

test_list=./EspEng_List/noBalance/listas_acentos/list_ba_mendebalekoa.txt
nameSesgos=bamendebalekoa
python ./trainSpeakerNet.py --eval --model $model --log_input True \
                         --initial_model $initial_model --encoder_type $encoder_type \
                         --eval_frames 400 \
                         --save_path $save_path --trainfunc $trainfunc \
                         --train_path $train_path --test_path $test_path \
                         --train_list $train_list --test_list $test_list \
                         --nPerSpeaker 5 --sesgo $nameSesgos \
                         --save_path_cal_scores $save_path_cal_scores \
                         --save_path_cal_emb1 $save_path_cal_emb1 \

test_list=./EspEng_List/noBalance/listas_acentos/list_ca_central.txt
nameSesgos=cacentral
python ./trainSpeakerNet.py --eval --model $model --log_input True \
                         --initial_model $initial_model --encoder_type $encoder_type \
                         --eval_frames 400 \
                         --save_path $save_path --trainfunc $trainfunc \
                         --train_path $train_path --test_path $test_path \
                         --train_list $train_list --test_list $test_list \
                         --nPerSpeaker 5 --sesgo $nameSesgos \
                         --save_path_cal_scores $save_path_cal_scores \
                         --save_path_cal_emb1 $save_path_cal_emb1 \

test_list=./EspEng_List/noBalance/listas_acentos/list_ca_northwestern.txt
nameSesgos=canorthwestern
python ./trainSpeakerNet.py --eval --model $model --log_input True \
                         --initial_model $initial_model --encoder_type $encoder_type \
                         --eval_frames 400 \
                         --save_path $save_path --trainfunc $trainfunc \
                         --train_path $train_path --test_path $test_path \
                         --train_list $train_list --test_list $test_list \
                         --nPerSpeaker 5 --sesgo $nameSesgos \
                         --save_path_cal_scores $save_path_cal_scores \
                         --save_path_cal_emb1 $save_path_cal_emb1 \


test_list=./EspEng_List/noBalance/listas_acentos/list_ca_other.txt
nameSesgos=caother
python ./trainSpeakerNet.py --eval --model $model --log_input True \
                         --initial_model $initial_model --encoder_type $encoder_type \
                         --eval_frames 400 \
                         --save_path $save_path --trainfunc $trainfunc \
                         --train_path $train_path --test_path $test_path \
                         --train_list $train_list --test_list $test_list \
                         --nPerSpeaker 5 --sesgo $nameSesgos \
                         --save_path_cal_scores $save_path_cal_scores \
                         --save_path_cal_emb1 $save_path_cal_emb1 \

test_list=./EspEng_List/noBalance/listas_acentos/list_es_andino.txt
nameSesgos=esandino
python ./trainSpeakerNet.py --eval --model $model --log_input True \
                         --initial_model $initial_model --encoder_type $encoder_type \
                         --eval_frames 400 \
                         --save_path $save_path --trainfunc $trainfunc \
                         --train_path $train_path --test_path $test_path \
                         --train_list $train_list --test_list $test_list \
                         --nPerSpeaker 5 --sesgo $nameSesgos \
                         --save_path_cal_scores $save_path_cal_scores \
                         --save_path_cal_emb1 $save_path_cal_emb1 \

test_list=./EspEng_List/noBalance/listas_acentos/list_es_nortepeninsular.txt
nameSesgos=esnortepeninsular
python ./trainSpeakerNet.py --eval --model $model --log_input True \
                         --initial_model $initial_model --encoder_type $encoder_type \
                         --eval_frames 400 \
                         --save_path $save_path --trainfunc $trainfunc \
                         --train_path $train_path --test_path $test_path \
                         --train_list $train_list --test_list $test_list \
                         --nPerSpeaker 5 --sesgo $nameSesgos \
                         --save_path_cal_scores $save_path_cal_scores \
                         --save_path_cal_emb1 $save_path_cal_emb1 \

test_list=./EspEng_List/noBalance/listas_acentos/list_es_rioplatense.txt
nameSesgos=esrioplatense
python ./trainSpeakerNet.py --eval --model $model --log_input True \
                         --initial_model $initial_model --encoder_type $encoder_type \
                         --eval_frames 400 \
                         --save_path $save_path --trainfunc $trainfunc \
                         --train_path $train_path --test_path $test_path \
                         --train_list $train_list --test_list $test_list \
                         --nPerSpeaker 5 --sesgo $nameSesgos \
                         --save_path_cal_scores $save_path_cal_scores \
                         --save_path_cal_emb1 $save_path_cal_emb1 \



# Listas Idiomas 
test_path=/mnt/audias_data/data/FairVoice/FairVoice/FairVoice/
save_path_cal_scores=exps/exp1_FairVoice/labels
save_path_cal_emb1=exps/exp1_FairVoice/scores


test_list=./EspEng_List/noBalance/others/eng_female.txt
nameSesgos=engFemale
python ./trainSpeakerNet.py --eval --model $model --log_input True \
                         --initial_model $initial_model --encoder_type $encoder_type \
                         --eval_frames 400 \
                         --save_path $save_path --trainfunc $trainfunc \
                         --train_path $train_path --test_path $test_path \
                         --train_list $train_list --test_list $test_list \
                         --nPerSpeaker 5 --sesgo $nameSesgos \
                         --save_path_cal_scores $save_path_cal_scores \
                         --save_path_cal_emb1 $save_path_cal_emb1 \


test_list=./EspEng_List/noBalance/others/eng_junior_female.txt
nameSesgos=engFemaleJunior
python ./trainSpeakerNet.py --eval --model $model --log_input True \
                         --initial_model $initial_model --encoder_type $encoder_type \
                         --eval_frames 400 \
                         --save_path $save_path --trainfunc $trainfunc \
                         --train_path $train_path --test_path $test_path \
                         --train_list $train_list --test_list $test_list \
                         --nPerSpeaker 5 --sesgo $nameSesgos \
                         --save_path_cal_scores $save_path_cal_scores \
                         --save_path_cal_emb1 $save_path_cal_emb1 \


test_list=./EspEng_List/noBalance/others/eng_junior_male.txt
nameSesgos=engMaleJunior
python ./trainSpeakerNet.py --eval --model $model --log_input True \
                         --initial_model $initial_model --encoder_type $encoder_type \
                         --eval_frames 400 \
                         --save_path $save_path --trainfunc $trainfunc \
                         --train_path $train_path --test_path $test_path \
                         --train_list $train_list --test_list $test_list \
                         --nPerSpeaker 5 --sesgo $nameSesgos \
                         --save_path_cal_scores $save_path_cal_scores \
                         --save_path_cal_emb1 $save_path_cal_emb1 \


test_list=./EspEng_List/noBalance/others/eng_junior.txt
nameSesgos=engJunior
python ./trainSpeakerNet.py --eval --model $model --log_input True \
                         --initial_model $initial_model --encoder_type $encoder_type \
                         --eval_frames 400 \
                         --save_path $save_path --trainfunc $trainfunc \
                         --train_path $train_path --test_path $test_path \
                         --train_list $train_list --test_list $test_list \
                         --nPerSpeaker 5 --sesgo $nameSesgos \
                         --save_path_cal_scores $save_path_cal_scores \
                         --save_path_cal_emb1 $save_path_cal_emb1 \

test_list=./EspEng_List/noBalance/others/eng_male.txt
nameSesgos=engMale
python ./trainSpeakerNet.py --eval --model $model --log_input True \
                         --initial_model $initial_model --encoder_type $encoder_type \
                         --eval_frames 400 \
                         --save_path $save_path --trainfunc $trainfunc \
                         --train_path $train_path --test_path $test_path \
                         --train_list $train_list --test_list $test_list \
                         --nPerSpeaker 5 --sesgo $nameSesgos \
                         --save_path_cal_scores $save_path_cal_scores \
                         --save_path_cal_emb1 $save_path_cal_emb1 \

test_list=./EspEng_List/noBalance/others/eng_seniorfemale.txt
nameSesgos=engSeniorFemale
python ./trainSpeakerNet.py --eval --model $model --log_input True \
                         --initial_model $initial_model --encoder_type $encoder_type \
                         --eval_frames 400 \
                         --save_path $save_path --trainfunc $trainfunc \
                         --train_path $train_path --test_path $test_path \
                         --train_list $train_list --test_list $test_list \
                         --nPerSpeaker 5 --sesgo $nameSesgos \
                         --save_path_cal_scores $save_path_cal_scores \
                         --save_path_cal_emb1 $save_path_cal_emb1 \

test_list=./EspEng_List/noBalance/others/eng_seniormale.txt
nameSesgos=engSeniorMale
python ./trainSpeakerNet.py --eval --model $model --log_input True \
                         --initial_model $initial_model --encoder_type $encoder_type \
                         --eval_frames 400 \
                         --save_path $save_path --trainfunc $trainfunc \
                         --train_path $train_path --test_path $test_path \
                         --train_list $train_list --test_list $test_list \
                         --nPerSpeaker 5 --sesgo $nameSesgos \
                         --save_path_cal_scores $save_path_cal_scores \
                         --save_path_cal_emb1 $save_path_cal_emb1 \

test_list=./EspEng_List/noBalance/others/esp_female.txt
nameSesgos=espFemale
python ./trainSpeakerNet.py --eval --model $model --log_input True \
                         --initial_model $initial_model --encoder_type $encoder_type \
                         --eval_frames 400 \
                         --save_path $save_path --trainfunc $trainfunc \
                         --train_path $train_path --test_path $test_path \
                         --train_list $train_list --test_list $test_list \
                         --nPerSpeaker 5 --sesgo $nameSesgos \
                         --save_path_cal_scores $save_path_cal_scores \
                         --save_path_cal_emb1 $save_path_cal_emb1 \

test_list=./EspEng_List/noBalance/others/esp_junior_female.txt
nameSesgos=espFemaleJunior
python ./trainSpeakerNet.py --eval --model $model --log_input True \
                         --initial_model $initial_model --encoder_type $encoder_type \
                         --eval_frames 400 \
                         --save_path $save_path --trainfunc $trainfunc \
                         --train_path $train_path --test_path $test_path \
                         --train_list $train_list --test_list $test_list \
                         --nPerSpeaker 5 --sesgo $nameSesgos \
                         --save_path_cal_scores $save_path_cal_scores \
                         --save_path_cal_emb1 $save_path_cal_emb1 \

test_list=./EspEng_List/noBalance/others/esp_junior_male.txt
nameSesgos=espMaleJunior
python ./trainSpeakerNet.py --eval --model $model --log_input True \
                         --initial_model $initial_model --encoder_type $encoder_type \
                         --eval_frames 400 \
                         --save_path $save_path --trainfunc $trainfunc \
                         --train_path $train_path --test_path $test_path \
                         --train_list $train_list --test_list $test_list \
                         --nPerSpeaker 5 --sesgo $nameSesgos \
                         --save_path_cal_scores $save_path_cal_scores \
                         --save_path_cal_emb1 $save_path_cal_emb1 \


test_list=./EspEng_List/noBalance/others/esp_junior.txt
nameSesgos=espJunior
python ./trainSpeakerNet.py --eval --model $model --log_input True \
                         --initial_model $initial_model --encoder_type $encoder_type \
                         --eval_frames 400 \
                         --save_path $save_path --trainfunc $trainfunc \
                         --train_path $train_path --test_path $test_path \
                         --train_list $train_list --test_list $test_list \
                         --nPerSpeaker 5 --sesgo $nameSesgos \
                         --save_path_cal_scores $save_path_cal_scores \
                         --save_path_cal_emb1 $save_path_cal_emb1 \

test_list=./EspEng_List/noBalance/others/esp_male.txt
nameSesgos=espMale
python ./trainSpeakerNet.py --eval --model $model --log_input True \
                         --initial_model $initial_model --encoder_type $encoder_type \
                         --eval_frames 400 \
                         --save_path $save_path --trainfunc $trainfunc \
                         --train_path $train_path --test_path $test_path \
                         --train_list $train_list --test_list $test_list \
                         --nPerSpeaker 5 --sesgo $nameSesgos \
                         --save_path_cal_scores $save_path_cal_scores \
                         --save_path_cal_emb1 $save_path_cal_emb1 \

test_list=./EspEng_List/noBalance/others/esp_seniorfemale.txt
nameSesgos=espSeniorFemale
python ./trainSpeakerNet.py --eval --model $model --log_input True \
                         --initial_model $initial_model --encoder_type $encoder_type \
                         --eval_frames 400 \
                         --save_path $save_path --trainfunc $trainfunc \
                         --train_path $train_path --test_path $test_path \
                         --train_list $train_list --test_list $test_list \
                         --nPerSpeaker 5 --sesgo $nameSesgos \
                         --save_path_cal_scores $save_path_cal_scores \
                         --save_path_cal_emb1 $save_path_cal_emb1 \

test_list=./EspEng_List/noBalance/others/esp_seniormale.txt
nameSesgos=espSeniorMale
python ./trainSpeakerNet.py --eval --model $model --log_input True \
                         --initial_model $initial_model --encoder_type $encoder_type \
                         --eval_frames 400 \
                         --save_path $save_path --trainfunc $trainfunc \
                         --train_path $train_path --test_path $test_path \
                         --train_list $train_list --test_list $test_list \
                         --nPerSpeaker 5 --sesgo $nameSesgos \
                         --save_path_cal_scores $save_path_cal_scores \
                         --save_path_cal_emb1 $save_path_cal_emb1 \


test_list=./EspEng_List/noBalance/others/eng_senior.txt
nameSesgos=engSenior
python ./trainSpeakerNet.py --eval --model $model --log_input True \
                         --initial_model $initial_model --encoder_type $encoder_type \
                         --eval_frames 400 \
                         --save_path $save_path --trainfunc $trainfunc \
                         --train_path $train_path --test_path $test_path \
                         --train_list $train_list --test_list $test_list \
                         --nPerSpeaker 5 --sesgo $nameSesgos \
                         --save_path_cal_scores $save_path_cal_scores \
                         --save_path_cal_emb1 $save_path_cal_emb1 \


test_list=./EspEng_List/noBalance/others/esp_senior.txt
nameSesgos=espSenior
python ./trainSpeakerNet.py --eval --model $model --log_input True \
                         --initial_model $initial_model --encoder_type $encoder_type \
                         --eval_frames 400 \
                         --save_path $save_path --trainfunc $trainfunc \
                         --train_path $train_path --test_path $test_path \
                         --train_list $train_list --test_list $test_list \
                         --nPerSpeaker 5 --sesgo $nameSesgos \
                         --save_path_cal_scores $save_path_cal_scores \
                         --save_path_cal_emb1 $save_path_cal_emb1 \