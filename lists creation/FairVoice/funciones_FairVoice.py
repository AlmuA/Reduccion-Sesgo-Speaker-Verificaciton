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
            linea = Lan+'_'+id + ' ' + Lan+'/'+row.audio + '\n'
            f_out.write(linea)

def Vox2Fair_test(meta, fout, Lan):
    df_meta = pd.read_csv(meta)
    with open(fout, 'w', newline='') as f_out:
        for _, row in df_meta.iterrows():
            linea = str(row.label) + ' ' + Lan+'/'+row.audio_1 + ' ' + Lan+'/'+row.audio_2 + '\n'
            f_out.write(linea)

def gender_list_FV(filecsvTest, path):
    fFemale = open(path+'list_female.txt', 'w')
    fMale = open(path+'list_male.txt', 'w')
    #['audio_1', 'audio_2', 'age_1', 'age_2', 'gender_1', 'gender_2', 'label']
    N=0
    with open(filecsvTest, newline='') as File1:
        reader1 = csv.reader(File1, delimiter=',')
        for line1 in reader1:
            if N>=0:
                if (line1[4]=='' or line1[4]=='female'):
                    if (line1[5]=='' or line1[5]=='female'): 
                        fFemale.write(line1[6] + ' ' + line1[0] + ' ' + line1[1] + '\n')
            N=N+1
    
    M=0
    with open(filecsvTest, newline='') as File2:
        reader2 = csv.reader(File2, delimiter=',')
        for line2 in reader2:
            if M>=0:
                if (line2[4]=='' or line2[4]=='male'):
                    if (line2[5]=='' or line2[5]=='male'): fMale.write(line2[6] + ' ' + line2[0] + ' ' + line2[1] + '\n')
            M=M+1

def age_lits_FV(filecsvTest, path):
    fold = open(path+'list_senior.txt', 'w')
    fyoung = open(path+'list_junior.txt', 'w')
    fom = open(path+'list_seniorMale.txt', 'w')
    fym = open(path+'list_juniorMale.txt', 'w')
    fof = open(path+'list_seniorFemale.txt', 'w')
    fyf = open(path+'list_juniorFemale.txt', 'w')
   
    N=0
    with open(filecsvTest, newline='') as File1:
        reader1 = csv.reader(File1, delimiter=',')
        for line1 in reader1:
            if N>=0:
                if line1[2]=='' or line1[2] =='old': 
                    if line1[3]=='' or line1[3] =='old': fold.write(line1[6] + ' ' + line1[0] + ' ' + line1[1] + '\n')
                elif (line1[2]=='' or line1[2]=='young'):
                    if (line1[3]=='' or line1[3]=='young'): fyoung.write(line1[6] + ' ' + line1[0] + ' ' + line1[1] + '\n')
            N=N+1
    
    N=0
    with open(filecsvTest, newline='') as File1:
        reader1 = csv.reader(File1, delimiter=',')
        for line1 in reader1:
            if N>=0:
                if (line1[4]=='' or line1[4]=='male'):
                    if (line1[5]=='' or line1[5]=='male'):
                        if line1[2]=='' or line1[2] =='old': 
                            if line1[3]=='' or line1[3] =='old': fom.write(line1[6] + ' ' + line1[0] + ' ' + line1[1] + '\n')
                        elif (line1[2]=='' or line1[2]=='young'):
                            if (line1[3]=='' or line1[3]=='young'): fym.write(line1[6] + ' ' + line1[0] + ' ' + line1[1] + '\n')
            N=N+1

    N=0
    with open(filecsvTest, newline='') as File1:
        reader1 = csv.reader(File1, delimiter=',')
        for line1 in reader1:
            if N>=0:
                if (line1[4]=='' or line1[4]=='female'):
                    if (line1[5]=='' or line1[5]=='female'):
                        if line1[2]=='' or line1[2] =='old': 
                            if line1[3]=='' or line1[3] =='old': fof.write(line1[6] + ' ' + line1[0] + ' ' + line1[1] + '\n')
                        elif (line1[2]=='' or line1[2]=='young'):
                            if (line1[3]=='' or line1[3]=='young'): fyf.write(line1[6] + ' ' + line1[0] + ' ' + line1[1] + '\n')
            N=N+1      
    
def FairVoice_Accent_fv(metada, path, meta_lan, lan):
    def_test = pd.read_csv(metada)
    lAccent=[]
    for _, row in def_test.iterrows():
        lAccent.append(row['accent'])
        
    for aux in lAccent:
        archivo_out1 = open(path + '/' + 'list_' + str(aux) +'.txt', 'w')
        for _, row in def_test.iterrows():
            if row['accent']==aux:
                with open(meta_lan) as data:
                    n=0
                    for fila in csv.reader(data):
                        # audio_1,audio_2,age_1,age_2,gender_1,gender_2,label
                        if n>0:
                            audio_1 = fila[0]
                            id, audio = audio_1.split('/')
                            if row['id_user']==id:
                                archivo_out1.write(fila[6] + ' ' + lan+'/'+fila[0] + ' ' + lan+'/'+fila[1] + '\n')
                        n+=1

