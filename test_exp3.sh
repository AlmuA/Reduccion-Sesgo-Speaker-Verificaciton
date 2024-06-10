model=ResNetSE34L
initial_model=exp/exp3_Fairvoice/model/model000000400.model
encoder_type=SAP
trainfunc=amsoftmax
save_path=exps/exp3_Fairvoice
train_path=/mnt/audias_data/data/FairVoice/FairVoice/FairVoice/
train_list=./EngEsp_ListBalanceada/list_generales/EspEng_train.txt
save_path_cal_scores=exps/exp3_Fairvoice/scores
save_path_cal_emb1=exps/exp3_Fairvoice/labels

test_path=/mnt/audias_data/data/FairVoice/FairVoice/FairVoice/
test_list=./EngEsp_ListBalanceada/list_generales/EspEng_test.txt
nameSesgos=general
python ./trainSpeakerNet.py --eval --model $model --log_input True \
                         --initial_model $initial_model --encoder_type $encoder_type \
                         --eval_frames 400 \
                         --save_path $save_path --trainfunc $trainfunc \
                         --train_path $train_path --test_path $test_path \
                         --train_list $train_list --test_list $test_list \
                         --nPerSpeaker 5 --sesgo $nameSesgos \
                         --save_path_cal_scores $save_path_cal_scores \
                         --save_path_cal_emb1 $save_path_cal_emb1  \
                         --nClasses 960 \
                         --eval_frames 100

test_list=./EngEsp_ListBalanceada/list_generales/list_female.txt
nameSesgos=female
python ./trainSpeakerNet.py --eval --model $model --log_input True \
                         --initial_model $initial_model --encoder_type $encoder_type \
                         --eval_frames 400 \
                         --save_path $save_path --trainfunc $trainfunc \
                         --train_path $train_path --test_path $test_path \
                         --train_list $train_list --test_list $test_list \
                         --nPerSpeaker 5 --sesgo $nameSesgos \
                         --save_path_cal_scores $save_path_cal_scores \
                         --save_path_cal_emb1 $save_path_cal_emb1  \
                         --nClasses 960 \
                         --eval_frames 100


test_list=./EngEsp_ListBalanceada/list_generales/list_junior.txt
nameSesgos=junior
python ./trainSpeakerNet.py --eval --model $model --log_input True \
                         --initial_model $initial_model --encoder_type $encoder_type \
                         --save_path $save_path --trainfunc $trainfunc \
                         --train_path $train_path --test_path $test_path \
                         --train_list $train_list --test_list $test_list \
                         --nPerSpeaker 5 --sesgo $nameSesgos \
                         --save_path_cal_scores $save_path_cal_scores \
                         --save_path_cal_emb1 $save_path_cal_emb1  \
                         --nClasses 960 \
                         --eval_frames 100

test_list=./EngEsp_ListBalanceada/list_generales/list_juniorfemale.txt
nameSesgos=juniorFemale
python ./trainSpeakerNet.py --eval --model $model --log_input True \
                         --initial_model $initial_model --encoder_type $encoder_type \
                         --save_path $save_path --trainfunc $trainfunc \
                         --train_path $train_path --test_path $test_path \
                         --train_list $train_list --test_list $test_list \
                         --nPerSpeaker 5 --sesgo $nameSesgos \
                         --save_path_cal_scores $save_path_cal_scores \
                         --save_path_cal_emb1 $save_path_cal_emb1  \
                         --nClasses 960 \
                         --eval_frames 100

test_list=./EngEsp_ListBalanceada/list_generales/list_juniormale.txt
nameSesgos=juniorMale
python ./trainSpeakerNet.py --eval --model $model --log_input True \
                         --initial_model $initial_model --encoder_type $encoder_type \
                         --save_path $save_path --trainfunc $trainfunc \
                         --train_path $train_path --test_path $test_path \
                         --train_list $train_list --test_list $test_list \
                         --nPerSpeaker 5 --sesgo $nameSesgos \
                         --save_path_cal_scores $save_path_cal_scores \
                         --save_path_cal_emb1 $save_path_cal_emb1  \
                         --nClasses 960 \
                         --eval_frames 100

test_list=./EngEsp_ListBalanceada/list_generales/list_male.txt
nameSesgos=male
python ./trainSpeakerNet.py --eval --model $model --log_input True \
                         --initial_model $initial_model --encoder_type $encoder_type \
                         --save_path $save_path --trainfunc $trainfunc \
                         --train_path $train_path --test_path $test_path \
                         --train_list $train_list --test_list $test_list \
                         --nPerSpeaker 5 --sesgo $nameSesgos \
                         --save_path_cal_scores $save_path_cal_scores \
                         --save_path_cal_emb1 $save_path_cal_emb1  \
                         --nClasses 960 \
                         --eval_frames 100

test_list=./EngEsp_ListBalanceada/list_generales/list_senior.txt
nameSesgos=senior
python ./trainSpeakerNet.py --eval --model $model --log_input True \
                         --initial_model $initial_model --encoder_type $encoder_type \
                         --save_path $save_path --trainfunc $trainfunc \
                         --train_path $train_path --test_path $test_path \
                         --train_list $train_list --test_list $test_list \
                         --nPerSpeaker 5 --sesgo $nameSesgos \
                         --save_path_cal_scores $save_path_cal_scores \
                         --save_path_cal_emb1 $save_path_cal_emb1  \
                         --nClasses 960 \
                         --eval_frames 100

test_list=./EngEsp_ListBalanceada/list_generales/list_seniorfemale.txt
nameSesgos=seniorFemale
python ./trainSpeakerNet.py --eval --model $model --log_input True \
                         --initial_model $initial_model --encoder_type $encoder_type \
                         --save_path $save_path --trainfunc $trainfunc \
                         --train_path $train_path --test_path $test_path \
                         --train_list $train_list --test_list $test_list \
                         --nPerSpeaker 5 --sesgo $nameSesgos \
                         --save_path_cal_scores $save_path_cal_scores \
                         --save_path_cal_emb1 $save_path_cal_emb1  \
                         --nClasses 960 \
                         --eval_frames 100

test_list=./EngEsp_ListBalanceada/list_generales/list_seniormale.txt
nameSesgos=seniorMale
python ./trainSpeakerNet.py --eval --model $model --log_input True \
                         --initial_model $initial_model --encoder_type $encoder_type \
                         --save_path $save_path --trainfunc $trainfunc \
                         --train_path $train_path --test_path $test_path \
                         --train_list $train_list --test_list $test_list \
                         --nPerSpeaker 5 --sesgo $nameSesgos \
                         --save_path_cal_scores $save_path_cal_scores \
                         --save_path_cal_emb1 $save_path_cal_emb1  \
                         --nClasses 960 \
                         --eval_frames 100

## ACENTOS
test_list=EngEsp_ListBalanceada/list_accentos/list_australia.txt
nameSesgos=australia
python ./trainSpeakerNet.py --eval --model $model --log_input True \
                         --initial_model $initial_model --encoder_type $encoder_type \
                         --save_path $save_path --trainfunc $trainfunc \
                         --train_path $train_path --test_path $test_path \
                         --train_list $train_list --test_list $test_list \
                         --nPerSpeaker 5 --sesgo $nameSesgos \
                         --save_path_cal_scores $save_path_cal_scores \
                         --save_path_cal_emb1 $save_path_cal_emb1  \
                         --nClasses 960 \
                         --eval_frames 100

test_list=EngEsp_ListBalanceada/list_accentos/list_ca_balearic.txt
nameSesgos=CaBalearic
python ./trainSpeakerNet.py --eval --model $model --log_input True \
                         --initial_model $initial_model --encoder_type $encoder_type \
                         --save_path $save_path --trainfunc $trainfunc \
                         --train_path $train_path --test_path $test_path \
                         --train_list $train_list --test_list $test_list \
                         --nPerSpeaker 5 --sesgo $nameSesgos \
                         --save_path_cal_scores $save_path_cal_scores \
                         --save_path_cal_emb1 $save_path_cal_emb1  \
                         --nClasses 960 \
                         --eval_frames 100
                         

test_list=EngEsp_ListBalanceada/list_accentos/list_ca_central.txt
nameSesgos=caCentral
python ./trainSpeakerNet.py --eval --model $model --log_input True \
                         --initial_model $initial_model --encoder_type $encoder_type \
                         --save_path $save_path --trainfunc $trainfunc \
                         --train_path $train_path --test_path $test_path \
                         --train_list $train_list --test_list $test_list \
                         --nPerSpeaker 5 --sesgo $nameSesgos \
                         --save_path_cal_scores $save_path_cal_scores \
                         --save_path_cal_emb1 $save_path_cal_emb1  \
                         --nClasses 960 \
                         --eval_frames 100
                         

test_list=EngEsp_ListBalanceada/list_accentos/list_ca_northwestern.txt
nameSesgos=CaNortwestern
python ./trainSpeakerNet.py --eval --model $model --log_input True \
                         --initial_model $initial_model --encoder_type $encoder_type \
                         --save_path $save_path --trainfunc $trainfunc \
                         --train_path $train_path --test_path $test_path \
                         --train_list $train_list --test_list $test_list \
                         --nPerSpeaker 5 --sesgo $nameSesgos \
                         --save_path_cal_scores $save_path_cal_scores \
                         --save_path_cal_emb1 $save_path_cal_emb1  \
                         --nClasses 960 \
                         --eval_frames 100
                         
test_list=EngEsp_ListBalanceada/list_accentos/list_ca_other.txt
nameSesgos=CaOther
python ./trainSpeakerNet.py --eval --model $model --log_input True \
                         --initial_model $initial_model --encoder_type $encoder_type \
                         --save_path $save_path --trainfunc $trainfunc \
                         --train_path $train_path --test_path $test_path \
                         --train_list $train_list --test_list $test_list \
                         --nPerSpeaker 5 --sesgo $nameSesgos \
                         --save_path_cal_scores $save_path_cal_scores \
                         --save_path_cal_emb1 $save_path_cal_emb1  \
                         --nClasses 960 \
                         --eval_frames 100
                         

test_list=EngEsp_ListBalanceada/list_accentos/list_ca_valencian.txt
nameSesgos=CaValencian
python ./trainSpeakerNet.py --eval --model $model --log_input True \
                         --initial_model $initial_model --encoder_type $encoder_type \
                         --save_path $save_path --trainfunc $trainfunc \
                         --train_path $train_path --test_path $test_path \
                         --train_list $train_list --test_list $test_list \
                         --nPerSpeaker 5 --sesgo $nameSesgos \
                         --save_path_cal_scores $save_path_cal_scores \
                         --save_path_cal_emb1 $save_path_cal_emb1  \
                         --nClasses 960 \
                         --eval_frames 100
                         

test_list=EngEsp_ListBalanceada/list_accentos/list_canada.txt
nameSesgos=canada
python ./trainSpeakerNet.py --eval --model $model --log_input True \
                         --initial_model $initial_model --encoder_type $encoder_type \
                         --save_path $save_path --trainfunc $trainfunc \
                         --train_path $train_path --test_path $test_path \
                         --train_list $train_list --test_list $test_list \
                         --nPerSpeaker 5 --sesgo $nameSesgos \
                         --save_path_cal_scores $save_path_cal_scores \
                         --save_path_cal_emb1 $save_path_cal_emb1  \
                         --nClasses 960 \
                         --eval_frames 100
                         

test_list=EngEsp_ListBalanceada/list_accentos/list_england.txt
nameSesgos=england
python ./trainSpeakerNet.py --eval --model $model --log_input True \
                         --initial_model $initial_model --encoder_type $encoder_type \
                         --save_path $save_path --trainfunc $trainfunc \
                         --train_path $train_path --test_path $test_path \
                         --train_list $train_list --test_list $test_list \
                         --nPerSpeaker 5 --sesgo $nameSesgos \
                         --save_path_cal_scores $save_path_cal_scores \
                         --save_path_cal_emb1 $save_path_cal_emb1  \
                         --nClasses 960 \
                         --eval_frames 100
                         

test_list=EngEsp_ListBalanceada/list_accentos/list_es_nortepeninsular.txt
nameSesgos=esNortepeninsular
python ./trainSpeakerNet.py --eval --model $model --log_input True \
                         --initial_model $initial_model --encoder_type $encoder_type \
                         --save_path $save_path --trainfunc $trainfunc \
                         --train_path $train_path --test_path $test_path \
                         --train_list $train_list --test_list $test_list \
                         --nPerSpeaker 5 --sesgo $nameSesgos \
                         --save_path_cal_scores $save_path_cal_scores \
                         --save_path_cal_emb1 $save_path_cal_emb1  \
                         --nClasses 960 \
                         --eval_frames 100
                         
test_list=EngEsp_ListBalanceada/list_accentos/list_indian.txt
nameSesgos=indian
python ./trainSpeakerNet.py --eval --model $model --log_input True \
                         --initial_model $initial_model --encoder_type $encoder_type \
                         --save_path $save_path --trainfunc $trainfunc \
                         --train_path $train_path --test_path $test_path \
                         --train_list $train_list --test_list $test_list \
                         --nPerSpeaker 5 --sesgo $nameSesgos \
                         --save_path_cal_scores $save_path_cal_scores \
                         --save_path_cal_emb1 $save_path_cal_emb1  \
                         --nClasses 960 \
                         --eval_frames 100
                         

test_list=EngEsp_ListBalanceada/list_accentos/list_us.txt
nameSesgos=us
python ./trainSpeakerNet.py --eval --model $model --log_input True \
                         --initial_model $initial_model --encoder_type $encoder_type \
                         --save_path $save_path --trainfunc $trainfunc \
                         --train_path $train_path --test_path $test_path \
                         --train_list $train_list --test_list $test_list \
                         --nPerSpeaker 5 --sesgo $nameSesgos \
                         --save_path_cal_scores $save_path_cal_scores \
                         --save_path_cal_emb1 $save_path_cal_emb1  \
                         --nClasses 960 \
                         --eval_frames 100
                         


# Listas Idiomas 

test_path=/mnt/audias_data/data/FairVoice/FairVoice/FairVoice/English/
test_list=EngEsp_ListBalanceada/others/eng_juniorfemale.txt
nameSesgos=engJuniorFemale
python ./trainSpeakerNet.py --eval --model $model --log_input True \
                         --initial_model $initial_model --encoder_type $encoder_type \
                         --save_path $save_path --trainfunc $trainfunc \
                         --train_path $train_path --test_path $test_path \
                         --train_list $train_list --test_list $test_list \
                         --nPerSpeaker 5 --sesgo $nameSesgos \
                         --save_path_cal_scores $save_path_cal_scores \
                         --save_path_cal_emb1 $save_path_cal_emb1  \
                         --nClasses 960 \
                         --eval_frames 100
                         

test_list=EngEsp_ListBalanceada/others/eng_juniormale.txt
nameSesgos=engJuniorMale
python ./trainSpeakerNet.py --eval --model $model --log_input True \
                         --initial_model $initial_model --encoder_type $encoder_type \
                         --save_path $save_path --trainfunc $trainfunc \
                         --train_path $train_path --test_path $test_path \
                         --train_list $train_list --test_list $test_list \
                         --nPerSpeaker 5 --sesgo $nameSesgos \
                         --save_path_cal_scores $save_path_cal_scores \
                         --save_path_cal_emb1 $save_path_cal_emb1  \
                         --nClasses 960 \
                         --eval_frames 100
                         

test_list=EngEsp_ListBalanceada/others/eng_seniorfemale.txt
nameSesgos=engSeniorFemale
python ./trainSpeakerNet.py --eval --model $model --log_input True \
                         --initial_model $initial_model --encoder_type $encoder_type \
                         --save_path $save_path --trainfunc $trainfunc \
                         --train_path $train_path --test_path $test_path \
                         --train_list $train_list --test_list $test_list \
                         --nPerSpeaker 5 --sesgo $nameSesgos \
                         --save_path_cal_scores $save_path_cal_scores \
                         --save_path_cal_emb1 $save_path_cal_emb1  \
                         --nClasses 960 \
                         --eval_frames 100
                         
test_list=EngEsp_ListBalanceada/others/eng_seniormale.txt
nameSesgos=engSeniorMale
python ./trainSpeakerNet.py --eval --model $model --log_input True \
                         --initial_model $initial_model --encoder_type $encoder_type \
                         --save_path $save_path --trainfunc $trainfunc \
                         --train_path $train_path --test_path $test_path \
                         --train_list $train_list --test_list $test_list \
                         --nPerSpeaker 5 --sesgo $nameSesgos \
                         --save_path_cal_scores $save_path_cal_scores \
                         --save_path_cal_emb1 $save_path_cal_emb1  \
                         --nClasses 960 \
                         --eval_frames 100
                         

test_list=EngEsp_ListBalanceada/others/English_test_female.txt
nameSesgos=engFemale
python ./trainSpeakerNet.py --eval --model $model --log_input True \
                         --initial_model $initial_model --encoder_type $encoder_type \
                         --save_path $save_path --trainfunc $trainfunc \
                         --train_path $train_path --test_path $test_path \
                         --train_list $train_list --test_list $test_list \
                         --nPerSpeaker 5 --sesgo $nameSesgos \
                         --save_path_cal_scores $save_path_cal_scores \
                         --save_path_cal_emb1 $save_path_cal_emb1  \
                         --nClasses 960 \
                         --eval_frames 100
                         

test_list=EngEsp_ListBalanceada/others/English_test_male.txt
nameSesgos=engMale
python ./trainSpeakerNet.py --eval --model $model --log_input True \
                         --initial_model $initial_model --encoder_type $encoder_type \
                         --save_path $save_path --trainfunc $trainfunc \
                         --train_path $train_path --test_path $test_path \
                         --train_list $train_list --test_list $test_list \
                         --nPerSpeaker 5 --sesgo $nameSesgos \
                         --save_path_cal_scores $save_path_cal_scores \
                         --save_path_cal_emb1 $save_path_cal_emb1  \
                         --nClasses 960 \
                         --eval_frames 100
                         

test_list=EngEsp_ListBalanceada/others/English_test_old.txt
nameSesgos=engSenior
python ./trainSpeakerNet.py --eval --model $model --log_input True \
                         --initial_model $initial_model --encoder_type $encoder_type \
                         --save_path $save_path --trainfunc $trainfunc \
                         --train_path $train_path --test_path $test_path \
                         --train_list $train_list --test_list $test_list \
                         --nPerSpeaker 5 --sesgo $nameSesgos \
                         --save_path_cal_scores $save_path_cal_scores \
                         --save_path_cal_emb1 $save_path_cal_emb1  \
                         --nClasses 960 \
                         --eval_frames 100
                         

test_list=EngEsp_ListBalanceada/others/English_test_young.txt
nameSesgos=engJunior
python ./trainSpeakerNet.py --eval --model $model --log_input True \
                         --initial_model $initial_model --encoder_type $encoder_type \
                         --save_path $save_path --trainfunc $trainfunc \
                         --train_path $train_path --test_path $test_path \
                         --train_list $train_list --test_list $test_list \
                         --nPerSpeaker 5 --sesgo $nameSesgos \
                         --save_path_cal_scores $save_path_cal_scores \
                         --save_path_cal_emb1 $save_path_cal_emb1  \
                         --nClasses 960 \
                         --eval_frames 100
                         



test_path=/mnt/audias_data/data/FairVoice/FairVoice/FairVoice/Spanish/
test_list=EngEsp_ListBalanceada/others/esp_juniorfemale.txt
nameSesgos=espJuniorFemale
python ./trainSpeakerNet.py --eval --model $model --log_input True \
                         --initial_model $initial_model --encoder_type $encoder_type \
                         --save_path $save_path --trainfunc $trainfunc \
                         --train_path $train_path --test_path $test_path \
                         --train_list $train_list --test_list $test_list \
                         --nPerSpeaker 5 --sesgo $nameSesgos \
                         --save_path_cal_scores $save_path_cal_scores \
                         --save_path_cal_emb1 $save_path_cal_emb1  \
                         --nClasses 960 \
                         --eval_frames 100
                         
test_list=EngEsp_ListBalanceada/others/esp_juniormale.txt
nameSesgos=espJuniorMale
python ./trainSpeakerNet.py --eval --model $model --log_input True \
                         --initial_model $initial_model --encoder_type $encoder_type \
                         --save_path $save_path --trainfunc $trainfunc \
                         --train_path $train_path --test_path $test_path \
                         --train_list $train_list --test_list $test_list \
                         --nPerSpeaker 5 --sesgo $nameSesgos \
                         --save_path_cal_scores $save_path_cal_scores \
                         --save_path_cal_emb1 $save_path_cal_emb1  \
                         --nClasses 960 \
                         --eval_frames 100
                         

test_list=EngEsp_ListBalanceada/others/esp_seniorfemale.txt
nameSesgos=espSeniorFemale
python ./trainSpeakerNet.py --eval --model $model --log_input True \
                         --initial_model $initial_model --encoder_type $encoder_type \
                         --save_path $save_path --trainfunc $trainfunc \
                         --train_path $train_path --test_path $test_path \
                         --train_list $train_list --test_list $test_list \
                         --nPerSpeaker 5 --sesgo $nameSesgos \
                         --save_path_cal_scores $save_path_cal_scores \
                         --save_path_cal_emb1 $save_path_cal_emb1  \
                         --nClasses 960 \
                         --eval_frames 100
                         

test_list=EngEsp_ListBalanceada/others/esp_seniormale.txt
nameSesgos=espSeniorMale
python ./trainSpeakerNet.py --eval --model $model --log_input True \
                         --initial_model $initial_model --encoder_type $encoder_type \
                         --save_path $save_path --trainfunc $trainfunc \
                         --train_path $train_path --test_path $test_path \
                         --train_list $train_list --test_list $test_list \
                         --nPerSpeaker 5 --sesgo $nameSesgos \
                         --save_path_cal_scores $save_path_cal_scores \
                         --save_path_cal_emb1 $save_path_cal_emb1  \
                         --nClasses 960 \
                         --eval_frames 100
                         

test_list=EngEsp_ListBalanceada/others/Spanish_test_female.txt
nameSesgos=espFemale
python ./trainSpeakerNet.py --eval --model $model --log_input True \
                         --initial_model $initial_model --encoder_type $encoder_type \
                         --save_path $save_path --trainfunc $trainfunc \
                         --train_path $train_path --test_path $test_path \
                         --train_list $train_list --test_list $test_list \
                         --nPerSpeaker 5 --sesgo $nameSesgos \
                         --save_path_cal_scores $save_path_cal_scores \
                         --save_path_cal_emb1 $save_path_cal_emb1  \
                         --nClasses 960 \
                         --eval_frames 100
                         

test_list=EngEsp_ListBalanceada/others/Spanish_test_male.txt
nameSesgos=espMale
python ./trainSpeakerNet.py --eval --model $model --log_input True \
                         --initial_model $initial_model --encoder_type $encoder_type \
                         --save_path $save_path --trainfunc $trainfunc \
                         --train_path $train_path --test_path $test_path \
                         --train_list $train_list --test_list $test_list \
                         --nPerSpeaker 5 --sesgo $nameSesgos \
                         --save_path_cal_scores $save_path_cal_scores \
                         --save_path_cal_emb1 $save_path_cal_emb1  \
                         --nClasses 960 \
                         --eval_frames 100
                         

test_list=EngEsp_ListBalanceada/others/Spanish_test_old.txt
nameSesgos=espSenior
python ./trainSpeakerNet.py --eval --model $model --log_input True \
                         --initial_model $initial_model --encoder_type $encoder_type \
                         --save_path $save_path --trainfunc $trainfunc \
                         --train_path $train_path --test_path $test_path \
                         --train_list $train_list --test_list $test_list \
                         --nPerSpeaker 5 --sesgo $nameSesgos \
                         --save_path_cal_scores $save_path_cal_scores \
                         --save_path_cal_emb1 $save_path_cal_emb1  \
                         --nClasses 960 \
                         --eval_frames 100
                         

test_list=EngEsp_ListBalanceada/others/Spanish_test_young.txt
nameSesgos=espJunior
python ./trainSpeakerNet.py --eval --model $model --log_input True \
                         --initial_model $initial_model --encoder_type $encoder_type \
                         --save_path $save_path --trainfunc $trainfunc \
                         --train_path $train_path --test_path $test_path \
                         --train_list $train_list --test_list $test_list \
                         --nPerSpeaker 5 --sesgo $nameSesgos \
                         --save_path_cal_scores $save_path_cal_scores \
                         --save_path_cal_emb1 $save_path_cal_emb1  \
                         --nClasses 960 \
                         --eval_frames 100
                         
