from matplotlib import pyplot as plt
import matplotlib
import numpy as np

def printra_det(fpr, fnr, name, numero_subplots):
    if numero_subplots==1:
        fpr = np.load(fpr); fpr=fpr*100
        fnr = np.load(fnr); fnr = fnr*100

        axis_min = min(fpr[0],fnr[-1])
        12
        ax1.plot(fpr*100,fnr*100, 'b'); 
        ax1.set_yscale('log'); ax1.set_ylabel('Tasa de Falsos Negativos (%)')
        ax1.set_xscale('log'); ax1.set_xlabel('Tasa de Falasos Positivos(%)')
        ticks_to_use = [0.001,0.002,0.005,0.01,0.02,0.05,0.1,0.2,0.5,1,2,5,10,20,50]
        ax1.get_xaxis().set_major_formatter(matplotlib.ticker.ScalarFormatter())
        ax1.get_yaxis().set_major_formatter(matplotlib.ticker.ScalarFormatter())
        ax1.set_xticks(ticks_to_use)
        ax1.set_yticks(ticks_to_use)
        ax1.axis([0.001,50,0.001,50])
        ax1.legend((name))
        ax1.grid(linestyle="--")
        ax1.set_title('Curva DET modelo entreando baseline_v2')
    
    else:
        for i in range(len(name)):
            