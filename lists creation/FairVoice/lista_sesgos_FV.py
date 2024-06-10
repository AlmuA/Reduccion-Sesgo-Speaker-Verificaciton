#Listas Sesgos FairVoice Balanceado 
import sys
import os
import numpy as np
import pandas as pd
import csv
from collections import OrderedDict
import matplotlib.pyplot as plt
import random
from sklearn.model_selection import train_test_split 


def train_list(metaSp, metaEn, fout):
    df_meta_sp = pd.read_csv(metaSp)
    df_meta_en = pd.read_csv(metaEn)
    with open(fout, 'w', newline='') as f_out:
        for _, row in df_meta_sp.iterrows(): 
            id, audio2 = row.audio.split('/')
            linea = 'Spanish_'+id + ' ' +'Spanish/'+row.audio + '\n'
            f_out.write(linea)
        
        for _, row in df_meta_en.iterrows(): 
            id, audio2 = row.audio.split('/')
            linea = 'English_'+id + ' ' +'English/'+row.audio + '\n'
            f_out.write(linea)


def test_list(metaSp, metaEn, fout):
    #audio_1,audio_2,age_1,age_2,gender_1,gender_2,label
    df_meta_sp = pd.read_csv(metaSp)
    df_meta_en = pd.read_csv(metaEn)

    with open(fout, 'w', newline='') as f_out:
        for _, row in df_meta_sp.iterrows():
            linea = str(row.label) + ' ' + 'Spanish/'+row.audio_1 + ' ' + 'Spanish/'+row.audio_2 + '\n'
            f_out.write(linea)
        for _, row in df_meta_en.iterrows(): 
            linea = str(row.label) + ' ' + 'English/'+row.audio_1 + ' ' + 'English/'+row.audio_2 + '\n'
            f_out.write(linea)

         
def mix_listas(lista_Eng, Lista_Spa, lista):
    fout = open(lista, 'w')
    fin1 = open(lista_Eng, 'r')
    fin2 = open(Lista_Spa, 'r')
    
    #1 id02492/audio00000.wav id02492/audio00004.wav
    lineas1 = fin1.readlines()
    for line in lineas1:
        lan = 'English/'
        flag, audio1, audio2 = line.split(' ')
        audio1=lan+audio1
        audio2=lan+audio2
        
        fout.write(flag + ' ' + audio1 + ' '+ audio2)
        
    lineas2 = fin2.readlines()
    for line in lineas2:
        lan = 'Spanish/'
        flag, audio1, audio2 = line.split(' ')
        audio1=lan+audio1
        audio2=lan+audio2
        
        fout.write(flag + ' ' + audio1 + ' '+ audio2)   
        

def age_list_geneder(list_gender, list_age, lista):
    fout = open(lista, 'w')
    fin1 = open(list_gender, 'r')
    fin2 = open(list_age, 'r')
    
    lineas1 = fin1.readlines()
    lineas2 = fin2.readlines()
    for line in lineas1:
        flag, audio1, audio2 = line.split(' ')
        for line2 in lineas2:
            flag2, audio21, audio22 = line.split(' ')
            
            if audio1 == audio21:
                fout.write(line)
                

def gender_list(meta, lan):
    df_meta = pd.read_csv(meta)
    fem = open(f'{lan}_list_female.txt', 'w')
    men = open(f'{lan}_list_male.txt', 'w')

    #audio_1,audio_2,age_1,age_2,gender_1,gender_2,label
    for _, row in df_meta.iterrows():
        if row.gender_1 == 'female':
            linea = str(row.label) + ' ' + lan + '/'+row.audio_1 + ' ' + lan + '/'+row.audio_2 + '\n'
            fem.write(linea)
        elif row.gender_1 == 'male':
            linea = str(row.label) + ' ' + lan + '/'+row.audio_1 + ' ' + lan + '/'+row.audio_2 + '\n'
            men.write(linea)
 

def age_list(meta, lan):
    df_meta = pd.read_csv(meta)
    sen =  open(f'{lan}_list_senior.txt', 'w')
    jun = open(f'{lan}_list_junior.txt', 'w')
    
    #audio_1,audio_2,age_1,age_2,gender_1,gender_2,label
    for _, row in df_meta.iterrows():
        if row.age_1=='old':
            linea = str(row.label) + ' ' + lan + '/'+row.audio_1 + ' ' + lan + '/'+row.audio_2 + '\n'
            sen.write(linea)
        elif row.age_1=='young':
            linea = str(row.label) + ' ' + lan + '/'+row.audio_1 + ' ' + lan + '/'+row.audio_2 + '\n'
            jun.write(linea)
            

def list_acentos(listaIn, metadata):
    finIn = open(listaIn, 'r')
    lines = finIn.readlines()
    df_meta = pd.read_csv(metadata)
    acentos_spa=[]
    acentos_eng=[]
#   id_user,hash_user,language_l1,language_l2,gender,age,accent,n_sensitive,n_sample
    for _, row in df_meta.iterrows():
        if row.language_l1 == 'Spanish': 
            if row.accent not in acentos_spa: acentos_spa.append(row.accent)
        elif row.language_l1 == 'English': 
            if row.accent not in acentos_eng: acentos_eng.append(row.accent)
            
    for aux in acentos_spa:
        archivo1 = open('list_accentos/list_' + str(aux) +'.txt', 'w')
        for _, row1 in df_meta.iterrows():
            if row1.accent == aux:
                for line in lines:
                    flag, audio1, audio2 = line.split(' ')
                    if 'Spanish' in audio1:
                        if row1.id_user in audio1: archivo1.write(line)
    
        archivo1.close()
    
    for aux in acentos_eng:
        archivo1 = open('list_accentos/list_' + str(aux) +'.txt', 'w')
        for _, row1 in df_meta.iterrows():
            if row1.accent == aux:
                for line in lines:
                    flag, audio1, audio2 = line.split(' ')
                    if 'English' in audio1:
                        if row1.id_user in audio1: archivo1.write(line)
        archivo1.close()
    
    