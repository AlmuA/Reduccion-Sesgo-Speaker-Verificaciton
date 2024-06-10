from CalibrationFunctions import *
import os



scoresTrain='/ruta/al/score/train (o) test general (son el mismo) - npy'
labelsTrain='/ruta/al/label/train (o) test general (son el mismo) - npz'
ptar=0.1
model='/ruta/al/modelo/para/guardarlos - npz'

a, b = train_posthoc(scores=scoresTrain, labels=labelsTrain, ptar=ptar, model=model)
lista_scores=os.listdir('ruta/a/los/scores/grupos/sesgaos')
lista_labels=os.listdir('ruta/a/los/labels/grupos/sesgaos')

for lab in lista_labels:
    print(lab)
    _, a = lab.split('labTest_')
    sesgo, _= a.split('.')
    print(sesgo)
    for sc in lista_scores:
        _, b = sc.split('scoresTest_')
        sesgo2, _ = b.split('.')
        if sesgo2==sesgo:
            test_posthoc(scores='ruta/a/los/scores/grupos/sesgaos/'+sc, 
                        labels='ruta/a/los/labels/grupos/sesgaos/'+lab, 
                        ptar=0.1, 
                        model=model,
                        outscores='ruta/guardar/outScores'+sesgo)