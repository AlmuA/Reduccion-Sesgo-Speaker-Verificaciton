import sys
import os
import numpy as np
import pandas as pd
import csv
from collections import OrderedDict
import matplotlib.pyplot as plt
import random
from sklearn.model_selection import train_test_split 

def Vox2Fair_train(meta, fout, Lan):
    df_meta = pd.read_csv(meta)
    with open(fout, 'w', newline='') as f_out:
        for _, row in df_meta.iterrows():
            id, audio = row.audio.split('/')
            linea = id + ' ' + Lan+'/'+row.audio
            f_out.write(linea)
            f_out.write('\n')

def Vox2Fair_test(meta, fout, Lan):
    df_meta = pd.read_csv(meta)
    with open(fout, 'w', newline='') as f_out:
        for _, row in df_meta.iterrows():
            linea = str(row.label) + ' ' + Lan+'/'+row.audio_1 + ' ' + Lan+'/'+row.audio_2
            f_out.write(linea)
            f_out.write('\n')  



def split_listas(meta):
    df_meta = pd.read_csv(meta)
    gender_filter_male = df_meta['gender']=='male'
    tmp_m = df_meta[gender_filter_male]
    gender_filter_female =  df_meta['gender']=='female'
    tmp_f = df_meta[gender_filter_female]

    p_test = 0.30
    tmp_f_train, tmp_f_test = train_test_split(tmp_f, test_size=p_test, random_state=42)
    tmp_m_train, tmp_m_test = train_test_split(tmp_m, test_size=p_test, random_state=42)

    return tmp_f_train, tmp_m_train, tmp_f_test, tmp_m_test

#id_user,hash_user,language_l1,language_l2,gender,age,accent,n_sensitive,n_sample
def generate_train(tmp_f_train, tmp_m_train, file):
    n_muetsras = 5
    with open(file, 'w', newline='') as f_out:
        for _, row in tmp_f_train.iterrows():
            for indx in range(n_muetsras):
                if indx < row.n_sample:
                    n=0
                    while True:
                        n+=1
                        num = '0' * n + str(indx)
                        if len(num)==5:
                            break
                    linea = row.language_l1+'/'+row.id_user + ' ' + row.language_l1+'/'+row.id_user + '/' + 'audio'+ num + '.wav'
                    f_out.write(linea)
                    f_out.write('\n')
                else:
                    break
        
        for _, row in tmp_m_train.iterrows():
            for indx in range(n_muetsras):
                if indx < row.n_sample:
                    n=0
                    while True:
                        n+=1
                        num = '0' * n + str(indx)
                        if len(num)==5:
                            break
                    linea = row.language_l1+'/'+row.id_user + ' ' + row.language_l1+'/'+row.id_user + '/' + 'audio'+ num + '.wav'
                    f_out.write(linea)
                    f_out.write('\n')
                else:
                    break


def generate_test(tmp_f_test, tmp_m_test, file):
    n_muetsras=5

    df_meta = pd.read_csv(tmp_m_test)
    lan_filter = df_meta['language_l1']=='English' 
    tmp_m_Eng = df_meta[lan_filter]

    df_meta = pd.read_csv(tmp_m_test)
    lan_filter = df_meta['language_l1']=='Spanish' 
    tmp_m_Spa = df_meta[lan_filter]

    df_meta = pd.read_csv(tmp_f_test)
    lan_filter = df_meta['language_l1']=='English' 
    tmp_f_Eng = df_meta[lan_filter]

    df_meta = pd.read_csv(tmp_f_test)
    lan_filter = df_meta['language_l1']=='Spanish' 
    tmp_f_Spa = df_meta[lan_filter]

    fout = open(file, 'w', newline='')

    for _, row in tmp_m_Eng:
        for index in range(n_muetsras):
            if index < row.n_sample:
                n=0
                while True:
                    n+=1
                    num = '0' * n + str(index)
                    if len(num)==5:
                        break
                aux=0
                while aux <=9:
                    random_id = np.random.choice(tmp_m_Eng.id_user)
                    if random_id != row.id_user:
                        linea = '0' + ' ' + row.language_l1+'/'+row.id_user + '/' + 'audio'+ num + '.wav' + ' ' + row.language_l1+'/'+random_id + '/' + 'audio'+ num + '.wav' + '\n'
                        fout.write(linea)
                        aux+=1

                linea = '1' + ' ' + row.language_l1+'/'+row.id_user + '/' + 'audio'+ num + '.wav' + ' ' + row.language_l1+'/'+row.id_user + '/' + 'audio'+ num + '.wav' + '\n'
                fout.write(linea)
            else: 
                break

    for _, row in tmp_f_Eng:
        for index in range(n_muetsras):
            if index < row.n_sample:
                n=0
                while True:
                    n+=1
                    num = '0' * n + str(index)
                    if len(num)==5:
                        break
                aux=0
                while aux <=9:
                    random_id = np.random.choice(tmp_f_Eng.id_user)
                    if random_id != row.id_user:
                        linea = '0' + ' ' + row.language_l1+'/'+row.id_user + '/' + 'audio'+ num + '.wav' + ' ' + row.language_l1+'/'+random_id + '/' + 'audio'+ num + '.wav' + '\n'
                        fout.write(linea)
                        aux+=1

                linea = '1' + ' ' + row.language_l1+'/'+row.id_user + '/' + 'audio'+ num + '.wav' + ' ' + row.language_l1+'/'+row.id_user + '/' + 'audio'+ num + '.wav' + '\n'
                fout.write(linea)
            else: 
                break

    for _, row in tmp_m_Spa:
        for index in range(n_muetsras):
            if index < row.n_sample:
                n=0
                while True:
                    n+=1
                    num = '0' * n + str(index)
                    if len(num)==5:
                        break
                aux=0
                while aux <=9:
                    random_id = np.random.choice(tmp_m_Spa.id_user)
                    if random_id != row.id_user:
                        linea = '0' + ' ' + row.language_l1+'/'+row.id_user + '/' + 'audio'+ num + '.wav' + ' ' + row.language_l1+'/'+random_id + '/' + 'audio'+ num + '.wav' + '\n'
                        fout.write(linea)
                        aux+=1

                linea = '1' + ' ' + row.language_l1+'/'+row.id_user + '/' + 'audio'+ num + '.wav' + ' ' + row.language_l1+'/'+row.id_user + '/' + 'audio'+ num + '.wav' + '\n'
                fout.write(linea)
            else: 
                break

    for _, row in tmp_f_Spa:
        for index in range(n_muetsras):
            if index < row.n_sample:
                n=0
                while True:
                    n+=1
                    num = '0' * n + str(index)
                    if len(num)==5:
                        break
                aux=0
                while aux <=9:
                    random_id = np.random.choice(tmp_f_Spa.id_user)
                    if random_id != row.id_user:
                        linea = '0' + ' ' + row.language_l1+'/'+row.id_user + '/' + 'audio'+ num + '.wav' + ' ' + row.language_l1+'/'+random_id + '/' + 'audio'+ num + '.wav' + '\n'
                        fout.write(linea)
                        aux+=1

                linea = '1' + ' ' + row.language_l1+'/'+row.id_user + '/' + 'audio'+ num + '.wav' + ' ' + row.language_l1+'/'+row.id_user + '/' + 'audio'+ num + '.wav' + '\n'
                fout.write(linea)
            else: 
                break


def gender_list_FV(filecsvTest, fout_f, fout_m):
    fFemale = open(fout_f, 'w')
    fMale = open(fout_m, 'w')
    #['audio_1', 'audio_2', 'age_1', 'age_2', 'gender_1', 'gender_2', 'label']
    with open(filecsvTest, newline='') as File1:
        reader1 = csv.reader(File1, delimiter=',')
        for line1 in reader1:
            if N>=0:
                if (line1[4]=='' or line1[4]=='female'):
                    if (line1[5]=='' or line1[5]=='female'):
                        fFemale.write(line1[6] + ' ' + line1[0] + ' ' + line1[1] + '\n')
            N=N+1

    with open(filecsvTest, newline='') as File2:
        reader2 = csv.reader(File2, delimiter=',')
        for line2 in reader2:
            if M>=0:
                if (line2[4]=='' or line2[4]=='male'):
                    if (line2[5]=='' or line2[5]=='male'):
                        fMale.write(line2[6] + ' ' + line2[0] + ' ' + line2[1] + '\n')
            M=M+1


#Para los CSV generados con FairVoice para cada idioma 
def gender_lits_FV(filecsvTest, fout_j, fout_s, fout_jm, fout_sm, fout_jf, fout_sf):
    fold = open(fout_s, 'w')
    fyoung = open(fout_j, 'w')
    fom = open(fout_sm, 'w')
    fym = open(fout_jm, 'w') 
    fof = open(fout_sf, 'w')
    fyf = open(fout_jf, 'w')


    #['audio_1', 'audio_2', 'age_1', 'age_2', 'gender_1', 'gender_2', 'label']
    df_meta = pd.read_csv(filecsvTest)
    gender_filter_male = df_meta['gender']=='male'
    tmp_m = df_meta[gender_filter_male]
    gender_filter_female =  df_meta['gender']=='female'
    tmp_f = df_meta[gender_filter_female]
    
    N=0
    with open(filecsvTest, newline='') as File1:
        reader1 = csv.reader(File1, delimiter=',')
        for line1 in reader1:
            if N>=0:
                if line1[2]=='' or line1[2] =='old': 
                    if line1[3]=='' or line1[3] =='old': 
                        fold.write(line1[6] + ' ' + line1[0] + ' ' + line1[1] + '\n')
                elif (line1[2]=='' or line1[2]=='young'):
                    if (line1[3]=='' or line1[3]=='young'):
                        fyoung.write(line1[6] + ' ' + line1[0] + ' ' + line1[1] + '\n')
            N=N+1
    

    N=0
    with open(tmp_m, newline='') as File1:
        reader1 = csv.reader(File1, delimiter=',')
        for line1 in reader1:
            if N>=0:
                if line1[2]=='' or line1[2] =='old': 
                    if line1[3]=='' or line1[3] =='old': 
                        fom.write(line1[6] + ' ' + line1[0] + ' ' + line1[1] + '\n')
                elif (line1[2]=='' or line1[2]=='young'):
                    if (line1[3]=='' or line1[3]=='young'):
                        fym.write(line1[6] + ' ' + line1[0] + ' ' + line1[1] + '\n')
            N=N+1

    N=0
    with open(tmp_f, newline='') as File1:
        reader1 = csv.reader(File1, delimiter=',')
        for line1 in reader1:
            if N>=0:
                if line1[2]=='' or line1[2] =='old': 
                    if line1[3]=='' or line1[3] =='old': 
                        fof.write(line1[6] + ' ' + line1[0] + ' ' + line1[1] + '\n')
                elif (line1[2]=='' or line1[2]=='young'):
                    if (line1[3]=='' or line1[3]=='young'):
                        fyf.write(line1[6] + ' ' + line1[0] + ' ' + line1[1] + '\n')
            N=N+1



# def combinar_Idiomas_train(lista_spa, lista_eng, lista_fin):
#     fout = open(lista_fin, 'w')
#     with open(lista_spa, 'r') as archivo:
#     # Leer el archivo línea por línea
#         for linea in archivo:


