import sys
import os
import numpy as np
import pandas as pd
import csv
from collections import OrderedDict
import matplotlib.pyplot as plt
import random
from sklearn.model_selection import train_test_split 

def metadata_noFV(meta, path, lan):
    df_meta = pd.read_csv(meta)
    lan_filter = df_meta['language_l1']==lan 
    df_filtered = df_meta[lan_filter]

    female_filter = df_filtered['gender']=='female'
    f_meta = df_filtered[female_filter]
    male_filter = df_filtered['gender']=='male'
    m_meta = df_filtered[male_filter]

    p_test = 0.30
    f_train, f_test = train_test_split(f_meta, test_size=p_test, random_state=42)
    m_train, m_test = train_test_split(m_meta, test_size=p_test, random_state=42)


    cols = ['','id_user', 'hash_user', 'language_l1', 'language_l2', 'gender','age', 'accent', 'n_sensitive', 'n_sample', 'label']
    train_meta = path+'male_train.csv'
    with open(train_meta, 'w', newline='') as t:
        writer = csv.writer(t)
        writer.writerows(cols)
        for _, row in m_train.iterrows(): writer.writerow(row)   
    
    train_meta = path+'female_train.csv'
    with open(train_meta, 'w', newline='') as t:
        writer = csv.writer(t)
        writer.writerows(cols)
        for _, row in f_train.iterrows(): writer.writerow(row)

    test_meta = path+'male_test.csv'
    with open(test_meta, 'w', newline='') as t:
        writer = csv.writer(t)
        writer.writerows(cols)
        for _, row in m_test.iterrows(): writer.writerow(row)
    
    test_meta = path+'female_test.csv'
    with open(test_meta, 'w', newline='') as t:
        writer = csv.writer(t)
        writer.writerows(cols)
        for _, row in f_test.iterrows(): writer.writerow(row)

    return f_train, f_test, m_train, m_test

def train_list_noFV(df_male_train, df_female_train, path, lan):
    df_male_train = pd.read_csv(df_male_train)
    df_female_train = pd.read_csv(df_female_train)
    muestras=5
    with open(path+'list_train.txt', 'w', newline='') as f:
        for _, row in df_male_train.iterrows():
            if row.n_sample >=muestras:
                for index in range(muestras):
                    n=0
                    while True:
                        num = '0' * n + str(index)
                        if len(num)==5: break
                        n+=1
                    id_audio = lan+'/'+row.id_user + '/' + 'audio'+ num + '.wav'
                    linea = lan+'_'+row.id_user + ' ' + id_audio + '\n'
                    f.write(linea)

        for _, row in df_female_train.iterrows():
            if row.n_sample >=muestras:
                for index in range(muestras):
                    n=0
                    while True:
                        num = '0' * n + str(index)
                        if len(num)==5: break
                        n+=1
                    id_audio = lan+'/'+row.id_user + '/' + 'audio'+ num + '.wav'
                    linea = lan+'_'+row.id_user + ' ' + id_audio + '\n'
                    f.write(linea)

def test_list_noFV(df_male_test, df_female_test, path, lan):
    df_male_test = pd.read_csv(df_male_test)
    df_female_test = pd.read_csv(df_female_test)
    muestras=5
    with open(path+'list_test.txt', 'w', newline='') as f:
        for _, row in df_male_test.iterrows():
            if row.n_sample >= muestras:
                for index in range(muestras):
                    n=0
                    while True:
                        num = '0' * n + str(index)
                        if len(num)==5:
                            break
                        n+=1
                    
                    id_audio1 = lan+'/'+row.id_user + '/' + 'audio'+ num + '.wav'
                    nAudio = random.randint(1, int(row.n_sample-1))
                    j=0
                    while True:
                        num = '0'*j+str(nAudio)
                        if len(num)==5:
                            break
                        j=j+1
                    randomAudio2 = lan+'/'+row.id_user + '/' + 'audio'+ num + '.wav'
                    linea = '1' + ' ' + id_audio1 + ' ' + randomAudio2 + '\n'
                    f.write(linea)
                    
                    while True:
                        randomID = np.random.choice(df_male_test.id_user)
                        if row.id_user != randomID:
                            randomUser = df_male_test['id_user']==randomID
                            randomUser = df_male_test[randomUser]
                            nAudio = random.randint(1, int(randomUser.n_sample-1))
                            j=0
                            while True:
                                num = '0'*j +str(nAudio)
                                if len(num)==5: break 
                                j=j+1
                            randomAudio1 = lan+'/'+randomID + '/'+'audio'+num+'.wav'
                            linea = '0' + ' ' + id_audio1 + ' ' + randomAudio1 + '\n'
                            f.write(linea)
                            break
                             
        for _, row in df_female_test.iterrows():
            if row.n_sample >= muestras:
                for index in range(muestras):
                    n=0
                    while True:
                        num = '0' * n + str(index)
                        if len(num)==5:
                            break
                        n+=1
                    
                    id_audio1 = lan+'/'+row.id_user + '/' + 'audio'+ num + '.wav'
                    nAudio = random.randint(1, int(row.n_sample-1))
                    j=0
                    while True:
                        num = '0'*j+str(nAudio)
                        if len(num)==5:
                            break
                        j=j+1
                    randomAudio2 = lan+'/'+row.id_user + '/' + 'audio'+ num + '.wav'
                    linea = '1' + ' ' + id_audio1 + ' ' + randomAudio2 + '\n'
                    f.write(linea)
                    
                    while True:
                        randomID = np.random.choice(df_female_test.id_user)
                        if row.id_user != randomID:
                            randomUser = df_female_test['id_user']==randomID
                            randomUser = df_female_test[randomUser]
                            nAudio = random.randint(1, int(randomUser.n_sample-1))
                            j=0
                            while True:
                                num = '0'*j +str(nAudio)
                                if len(num)==5: break 
                                j=j+1
                            randomAudio1 = lan+'/'+randomID + '/'+'audio'+num+'.wav'
                            linea = '0' + ' ' + id_audio1 + ' ' + randomAudio1 + '\n'
                            f.write(linea)
                            break
                             
def gender_lits(df_male_test, df_female_test, path, lan):
    df_male_test = pd.read_csv(df_male_test)
    df_female_test = pd.read_csv(df_female_test)
    muestras=5
    with open(path+'list_male.txt', 'w', newline='') as f:
        for _, row in df_male_test.iterrows():
            if row.n_sample >= muestras:
                for index in range(muestras):
                    n=0
                    while True:
                        num = '0' * n + str(index)
                        if len(num)==5:
                            break
                        n+=1
                    
                    id_audio1 = lan+'/'+row.id_user + '/' + 'audio'+ num + '.wav'
                    nAudio = random.randint(1, int(row.n_sample-1))
                    j=0
                    while True:
                        num = '0'*j+str(nAudio)
                        if len(num)==5:
                            break
                        j=j+1
                    randomAudio2 = lan+'/'+row.id_user + '/' + 'audio'+ num + '.wav'
                    linea = '1' + ' ' + id_audio1 + ' ' + randomAudio2 + '\n'
                    f.write(linea)
                    
                    while True:
                        randomID = np.random.choice(df_male_test.id_user)
                        if row.id_user != randomID:
                            randomUser = df_male_test['id_user']==randomID
                            randomUser = df_male_test[randomUser]
                            nAudio = random.randint(1, int(randomUser.n_sample-1))
                            j=0
                            while True:
                                num = '0'*j +str(nAudio)
                                if len(num)==5: break 
                                j=j+1
                            randomAudio1 = lan+'/'+randomID + '/'+'audio'+num+'.wav'
                            linea = '0' + ' ' + id_audio1 + ' ' + randomAudio1 + '\n'
                            f.write(linea)
                            break
                             
            

    with open(path+'list_female.txt', 'w', newline='') as f:
        for _, row in df_female_test.iterrows():
            if row.n_sample >= muestras:
                for index in range(muestras):
                    n=0
                    while True:
                        num = '0' * n + str(index)
                        if len(num)==5:
                            break
                        n+=1
                    
                    id_audio1 = lan+'/'+row.id_user + '/' + 'audio'+ num + '.wav'
                    nAudio = random.randint(1, int(row.n_sample-1))
                    j=0
                    while True:
                        num = '0'*j+str(nAudio)
                        if len(num)==5:
                            break
                        j=j+1
                    randomAudio2 = lan+'/'+row.id_user + '/' + 'audio'+ num + '.wav'
                    linea = '1' + ' ' + id_audio1 + ' ' + randomAudio2 + '\n'
                    f.write(linea)
                    
                    while True:
                        randomID = np.random.choice(df_female_test.id_user)
                        if row.id_user != randomID:
                            randomUser = df_female_test['id_user']==randomID
                            randomUser = df_female_test[randomUser]
                            nAudio = random.randint(1, int(randomUser.n_sample-1))
                            j=0
                            while True:
                                num = '0'*j +str(nAudio)
                                if len(num)==5: break 
                                j=j+1
                            randomAudio1 = lan+'/'+randomID + '/'+'audio'+num+'.wav'
                            linea = '0' + ' ' + id_audio1 + ' ' + randomAudio1 + '\n'
                            f.write(linea)
                            break
                             
def age_list(df_male_test, df_female_test, path, lan):
    df_male_test = pd.read_csv(df_male_test)
    df_female_test = pd.read_csv(df_female_test)

    #['','id_user', 'hash_user', 'language_l1', 'language_l2', 'gender','age', 'accent', 'n_sensitive', 'n_sample', 'label']
    muestras=5
    senior_l = open(path+'list_senior.txt', 'w', newline='')
    senior_male = open(path+'list_senior_male.txt', 'w', newline='')
    senior_female =open(path+'list_senior_female.txt', 'w', newline='')
    junior_l = open(path+'list_junior.txt', 'w', newline='')
    junior_male = open(path+'list_junior_male.txt', 'w', newline='')
    junior_female = open(path+'list_junior_senior.txt', 'w', newline='')

    junior = ['twenties', 'thirties', 'teens']
    for _, row in df_male_test.iterrows():
        if row.n_sample >= muestras:
            for index in range(muestras):
                n=0
                while True:
                    num = '0' * n + str(index)
                    if len(num)==5:
                        break
                    n+=1
                
                id_audio1 = lan+'/'+row.id_user + '/' + 'audio'+ num + '.wav'
                nAudio = random.randint(1, int(row.n_sample-1))
                j=0
                while True:
                    num = '0'*j+str(nAudio)
                    if len(num)==5:
                        break
                    j=j+1
                randomAudio2 = lan+'/'+row.id_user + '/' + 'audio'+ num + '.wav'
                linea = '1' + ' ' + id_audio1 + ' ' + randomAudio2 + '\n'
                if row.age in junior:
                    junior_l.write(linea)
                    junior_male.write(linea)
                else:
                    senior_l.write(linea)
                    senior_male.write(linea)
                
                while True:
                    randomID = np.random.choice(df_male_test.id_user)
                    if row.id_user != randomID:
                        randomUser = df_male_test['id_user']==randomID
                        randomUser = df_male_test[randomUser]
                        nAudio = random.randint(1, int(randomUser.n_sample-1))
                        j=0
                        while True:
                            num = '0'*j +str(nAudio)
                            if len(num)==5: break 
                            j=j+1
                        randomAudio1 = lan+'/'+randomID + '/'+'audio'+num+'.wav'
                        linea = '0' + ' ' + id_audio1 + ' ' + randomAudio1 + '\n'
                        if row.age in junior:
                            junior_l.write(linea)
                            junior_male.write(linea)
                        else:
                            senior_l.write(linea)
                            senior_male.write(linea)
                        break
                            
    for _, row in df_female_test.iterrows():
        if row.n_sample >= muestras:
            for index in range(muestras):
                n=0
                while True:
                    num = '0' * n + str(index)
                    if len(num)==5:
                        break
                    n+=1
                
                id_audio1 = lan+'/'+row.id_user + '/' + 'audio'+ num + '.wav'
                nAudio = random.randint(1, int(row.n_sample-1))
                j=0
                while True:
                    num = '0'*j+str(nAudio)
                    if len(num)==5:
                        break
                    j=j+1
                randomAudio2 = lan+'/'+row.id_user + '/' + 'audio'+ num + '.wav'
                linea = '1' + ' ' + id_audio1 + ' ' + randomAudio2 + '\n'
                if row.age in junior:
                    junior_l.write(linea)
                    junior_female.write(linea)
                else:
                    senior_l.write(linea)
                    senior_female.write(linea)
                
                while True:
                    randomID = np.random.choice(df_female_test.id_user)
                    if row.id_user != randomID:
                        randomUser = df_female_test['id_user']==randomID
                        randomUser = df_female_test[randomUser]
                        nAudio = random.randint(1, int(randomUser.n_sample-1))
                        j=0
                        while True:
                            num = '0'*j +str(nAudio)
                            if len(num)==5: break 
                            j=j+1
                        randomAudio1 = lan+'/'+randomID + '/'+'audio'+num+'.wav'
                        linea = '0' + ' ' + id_audio1 + ' ' + randomAudio1 + '\n'
                        if row.age in junior:
                            junior_l.write(linea)
                            junior_female.write(linea)
                        else:
                            senior_l.write(linea)
                            senior_female.write(linea)
                        break
                            
def FairVoice_Accent_nfv(path, testfile, meta_male, meta_female):
    df_meta_male=pd.read_csv(meta_male)
    df_meta_female=pd.read_csv(meta_female)

    lAccent=[]
    for _, row in df_meta_male.iterrows():
        lAccent.append(row['accent'])

    for _, row in df_meta_female.iterrows():
        if row['accent'] not in lAccent:
            lAccent.append(row['accent'])
    
    for aux in lAccent:
        archivo_out1 = open(path+ 'list_' + str(aux) +'.txt', 'w')
        for _, row in df_meta_male.iterrows():
            if row['accent']==aux:
                with open(testfile, 'r') as archivo:
                    lineas = archivo.readlines()
                    for linea in lineas:
                        flag, audio1, audio2 = linea.split(' ')
                        lan, id1, audio1 = audio1.split('/')

                        if id1 in row['id_user']:
                            archivo_out1.write(linea)


