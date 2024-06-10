#Generar Listas Sesgos Voxceleb 

import sys
import os
import numpy as np
import pandas as pd
import csv
from collections import OrderedDict
import matplotlib.pyplot as plt


def extract_info(meta):
    Genero=[]
    Nacionaldiad=[]
    n=0
    with open(meta) as data:
        for fila in csv.reader(data):
            for index, elemento in enumerate(fila):
                if n>0:
                    VoxCeleb1_ID, VGGFace1_ID, Gender, Nationality, Set = elemento.split('\t')
                    if Gender not in Genero: Genero.append(Gender)
                    if Nationality not in Nacionaldiad: Nacionaldiad.append(Nationality)
                n+=1
    
    return Nacionaldiad, Genero 

def Lista_genero(meta, Genero, fileTest, path):
    n=0
    fileIn =  open(fileTest, 'r')
    lines = fileIn.readlines()
    for aux in Genero:
        archivo_out1 = open(path+'/list_' + str(aux) +'.txt', 'w')
        with open(meta) as data:
            for fila in csv.reader(data):
                for index, elemento in enumerate(fila):
                    if n>0:
                        VoxCeleb1_ID, VGGFace1_ID, Gender, Nationality, Set = elemento.split('\t')
                        if Gender == aux:
                            for line in lines: 
                                flag, audio1, adui2 = line.split(' ')
                                if VoxCeleb1_ID in audio1: archivo_out1.write(line)
                    n+=1

def Listas_acentos(Nacionalidad, meta, fileTest,path):
    n=0
    fileIn =  open(fileTest, 'r')
    lines = fileIn.readlines()
    for aux in Nacionalidad:
        archivo_out1 = open(path+'/list_' + str(aux) +'.txt', 'w')
        with open(meta) as data:
            for fila in csv.reader(data):
                for index, elemento in enumerate(fila):
                    if n>0:
                        VoxCeleb1_ID, VGGFace1_ID, Gender, Nationality, Set = elemento.split('\t')
                        if Nationality == aux:
                            for line in lines: 
                                flag, audio1, adui2 = line.split(' ')
                                if VoxCeleb1_ID in audio1: archivo_out1.write(line)
                    n+=1

Nacionaldiad, Genero =extract_info('metadata-Voxceleb1/vox1_meta.csv')

file=open('nat.txt', 'w')
for Nat in Nacionaldiad:
    file.write(Nat+'\n')
print(Nacionaldiad)
Lista_genero('metadata-Voxceleb1/vox1_meta.csv', Genero, 'veri_test.txt', path='veri')
Listas_acentos(Nacionaldiad, 'metadata-Voxceleb1/vox1_meta.csv', 'veri_test.txt', path='veri')             


