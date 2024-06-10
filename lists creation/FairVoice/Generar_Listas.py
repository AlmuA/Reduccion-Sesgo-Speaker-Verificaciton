import datetime
import os
import pandas as pd
import random
import argparse

from generate_test_train import *
from funciones_FairVoice import *
from funciones_noFairVoice import * 

def cambinacion_idiomas(train_Eps, train_Eng, path, name):
    fout = open(path+name, 'w')
    
    with open(train_Eps, 'r') as archivo:
        for linea in archivo:
            fout.write(linea)
    
    with open(train_Eng, 'r') as archivo:
        for linea in archivo:
            fout.write(linea)

def cvsFiles_generator():
    file_path='metadata.csv'
    lan = 'English'
    num_of_spk = 486
    min_samples = 5
    split_function(path=file_path,language=lan,num_of_spk=num_of_spk,num_sample=min_samples)

    lan = 'Spanish'
    num_of_spk = 486
    min_samples = 5
    split_function(path=file_path,language=lan,num_of_spk=num_of_spk,num_sample=min_samples)

def trn_metafile(path, lista, name):
    metafile = open(path+'/'+name, 'w')
    file_in = open(lista, 'r')
    Lines = file_in.readlines()
    
    for linea in Lines:
        #Id Spanish/id00485/audio00000.wav [1] Train
        linea = linea.split(' ')
        lan, id, audio = linea[1].split('/')
        audi, tipo = audio.split('.')
        meta = lan + '_'+ id + '_'+ audi +'\n'
        metafile.write(meta)


def main():
    
    print('FairVoice\n')

    Vox2Fair_train('18_3_2024_11_13_Spanish/Spanish_train.csv', 'EspEng_List/Balance/Esp/train_Esp.txt', 'Spanish')
    Vox2Fair_train('18_3_2024_11_13_English/English_train.csv', 'EspEng_List/Balance/Eng/train_Eng.txt', 'English')
    cambinacion_idiomas('EspEng_List/Balance/Esp/train_Esp.txt', 'EspEng_List/Balance/Eng/train_Eng.txt', 'EspEng_List/Balance/', 'list_train.txt')
    trn_metafile('EspEng_List/Balance/', 'EspEng_List/Balance/list_train.txt', 'trn_metafile.txt')

    Vox2Fair_test('18_3_2024_11_13_Spanish/Spanish_test.csv', 'EspEng_List/Balance/Esp/test_Esp.txt', 'Spanish')
    Vox2Fair_test('18_3_2024_11_13_English/English_test.csv', 'EspEng_List/Balance/Eng/test_Eng.txt', 'English')
    cambinacion_idiomas('EspEng_List/Balance/Esp/test_Esp.txt', 'EspEng_List/Balance/Eng/test_Eng.txt', 'EspEng_List/Balance/', 'list_test.txt')

    gender_list_FV('18_3_2024_11_13_Spanish/Spanish_test.csv', 'EspEng_List/Balance/Esp')
    gender_list_FV('18_3_2024_11_13_English/English_test.csv', 'EspEng_List/Balance/Eng')
    cambinacion_idiomas('EspEng_List/Balance/Esp/list_male.txt', 'EspEng_List/Balance/Eng/list_male.txt', 'EspEng_List/Balance/', 'list_male.txt')
    cambinacion_idiomas('EspEng_List/Balance/Esp/list_female.txt', 'EspEng_List/Balance/Eng/list_female.txt', 'EspEng_List/Balance/', 'list_female.txt')

    age_lits_FV('18_3_2024_11_13_Spanish/Spanish_test.csv', 'EspEng_List/Balance/Esp')
    age_lits_FV('18_3_2024_11_13_English/English_test.csv', 'EspEng_List/Balance/Eng')
    cambinacion_idiomas('./EspEng_List/Balance/Esp/list_senior.txt', './EspEng_List/Balance/Eng/list_senior.txt', './EspEng_List/Balance/', 'list_senior.txt')
    cambinacion_idiomas('./EspEng_List/Balance/Esp/list_junior.txt', './EspEng_List/Balance/Eng/list_junior.txt', './EspEng_List/Balance/', 'list_junior.txt')
    cambinacion_idiomas('./EspEng_List/Balance/Esp/list_seniorFemale.txt', './EspEng_List/Balance/Eng/list_seniorFemale.txt', './EspEng_List/Balance/', 'list_seniorFemale.txt')
    cambinacion_idiomas('./EspEng_List/Balance/Esp/list_seniorMale.txt', './EspEng_List/Balance/Eng/list_seniorMale.txt', './EspEng_List/Balance/', 'list_seniorMale.txt')
    cambinacion_idiomas('./EspEng_List/Balance/Esp/list_juniorFemale.txt', './EspEng_List/Balance/Eng/list_juniorFemale.txt', './EspEng_List/Balance/', 'list_juniorFemale.txt')
    cambinacion_idiomas('./EspEng_List/Balance/Esp/list_juniorMale.txt', './EspEng_List/Balance/Eng/list_juniorMale.txt', './EspEng_List/Balance/', 'list_juniorMale.txt')

    print('end Fairvoice\n')


    print('No FairVoice\n')
    train_list_noFV('EspEng_List/noBalance/Esp/male_train.csv', 'EspEng_List/noBalance/Esp/female_train.csv', 'EspEng_List/noBalance/Esp/', 'Spanish')
    train_list_noFV('EspEng_List/noBalance/Eng/male_train.csv', 'EspEng_List/noBalance/Eng/female_train.csv', 'EspEng_List/noBalance/Eng/', 'English')
    cambinacion_idiomas('./EspEng_List/noBalance/Esp/list_train.txt', './EspEng_List/noBalance/Eng/list_train.txt', './EspEng_List/noBalance/', 'list_train.txt')
    trn_metafile('EspEng_List/noBalance/', 'EspEng_List/noBalance/list_train.txt', 'trn_metafile.txt')


    test_list_noFV('EspEng_List/noBalance/Esp/male_test.csv', 'EspEng_List/noBalance/Esp/female_test.csv', 'EspEng_List/noBalance/Esp/', 'Spanish')
    train_list_noFV('EspEng_List/noBalance/Eng/male_test.csv', 'EspEng_List/noBalance/Eng/female_test.csv', 'EspEng_List/noBalance/Eng/', 'English')
    cambinacion_idiomas('./EspEng_List/noBalance/Esp/list_test.txt', './EspEng_List/noBalance/Eng/list_test.txt', './EspEng_List/noBalance/', 'list_test.txt')
    
    gender_lits('EspEng_List/noBalance/Esp/male_test.csv', 'EspEng_List/noBalance/Esp/female_test.csv', 'EspEng_List/noBalance/Esp/', 'Spanish')
    gender_lits('EspEng_List/noBalance/Eng/male_test.csv', 'EspEng_List/noBalance/Eng/female_test.csv', 'EspEng_List/noBalance/Eng/', 'English')
    cambinacion_idiomas('./EspEng_List/noBalance/Esp/list_female.txt', './EspEng_List/noBalance/Eng/list_female.txt', './EspEng_List/noBalance/', 'list_female.txt')
    cambinacion_idiomas('./EspEng_List/noBalance/Esp/list_male.txt', './EspEng_List/noBalance/Eng/list_male.txt', './EspEng_List/noBalance/', 'list_male.txt')
    
    age_list('EspEng_List/noBalance/Esp/male_test.csv', 'EspEng_List/noBalance/Esp/female_test.csv', 'EspEng_List/noBalance/Esp/', 'Spanish')
    age_list('EspEng_List/noBalance/Eng/male_test.csv', 'EspEng_List/noBalance/Eng/female_test.csv', 'EspEng_List/noBalance/Eng/', 'English')
    cambinacion_idiomas('./EspEng_List/noBalance/Esp/list_senior.txt', './EspEng_List/noBalance/Eng/list_senior.txt', './EspEng_List/noBalance/', 'list_senior.txt')
    cambinacion_idiomas('./EspEng_List/noBalance/Esp/list_junior.txt', './EspEng_List/noBalance/Eng/list_junior.txt', './EspEng_List/noBalance/', 'list_junior.txt')
    cambinacion_idiomas('./EspEng_List/noBalance/Esp/list_senior_female.txt', './EspEng_List/noBalance/Eng/list_senior_female.txt', './EspEng_List/noBalance/', 'list_senior_female.txt')
    cambinacion_idiomas('./EspEng_List/noBalance/Esp/list_senior_male.txt', './EspEng_List/noBalance/Eng/list_senior_male.txt', './EspEng_List/noBalance/', 'list_senior_male.txt')
    cambinacion_idiomas('./EspEng_List/noBalance/Esp/list_junior_female.txt', './EspEng_List/noBalance/Eng/list_junior_female.txt', './EspEng_List/noBalance/', 'list_junior_female.txt')
    cambinacion_idiomas('./EspEng_List/noBalance/Esp/list_junior_male.txt', './EspEng_List/noBalance/Eng/list_junior_male.txt', './EspEng_List/noBalance/', 'list_junior_male.txt')

    FairVoice_Accent_nfv('./EspEng_List/noBalance/Esp/', './EspEng_List/noBalance/Esp/list_test.txt', 'EspEng_List/noBalance/Esp/male_test.csv', 'EspEng_List/noBalance/Esp/female_test.csv')
    FairVoice_Accent_nfv('./EspEng_List/noBalance/Eng/', './EspEng_List/noBalance/Eng/list_test.txt', 'EspEng_List/noBalance/Eng/male_test.csv', 'EspEng_List/noBalance/Eng/female_test.csv')
    
    print('end No Fairvoice\n')

main()