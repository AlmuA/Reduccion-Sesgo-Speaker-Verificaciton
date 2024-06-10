import argparse
from dca_plda import calibration
from dca_plda import scores as dscores
import numpy as np
import os
import random
import torch
import torch.backends.cudnn as cudnn
import torch.optim as optim
import re
import argparse
from dca_plda.scores import Scores, compute_performance, compute_performance_with_confidence_intervals
import argparse
import os
import random
import torch
import torch.backends.cudnn as cudnn
import torch.optim as optim

from dca_plda.data import LabelledDataset
from dca_plda.utils_for_scripts import np_to_torch, load_model, setup_torch_and_cuda_vars
from dca_plda.utils import  save_checkpoint, load_configs, get_class_to_cluster_map_from_config
from dca_plda.scores import *
from dca_plda.utils import load_configs, get_class_to_cluster_map_from_config
from dca_plda.utils_for_scripts import setup_torch_and_cuda_vars, print_graph, train, mkdirp
from dca_plda.data import LabelledDataset
from dca_plda.modules import DCA_PLDA_Backend, Hierarchical_DCA_PLDA_Backend
from dca_plda.utils_for_scripts import np_to_torch, evaluate, load_model
from dca_plda.scores import IdMap, compute_performance

import argparse
import os
import random
import torch
import torch.backends.cudnn as cudnn
import torch.optim as optim

from dca_plda.data import LabelledDataset
from dca_plda.utils_for_scripts import np_to_torch, load_model, compute_sideinfo

def print_perf(pos, neg, name, ptars):

    det           = dscores.Det(pos, neg, pav=True)
    min_dcfs      = det.min_dcf(ptars)
    act_dcfs      = det.act_dcf(ptars)
    act_cllrs     = det.act_cllr(ptars)
    min_cllrs     = det.min_cllr(ptars)
    min_cllrs_pav = det.min_cllr(ptars, with_pav=True)
    eer           = det.eer(from_rocch=True)

    print("%-22s |  %6d  %6d |  %6.2f  |  %7.4f  %7.4f  %7.4f  |  %7.4f  %7.4f  %7.4f  | %7.4f %7.4f | %7.4f %7.4f "%
          (name,
           len(det.tar),
           len(det.non),
           eer*100,
           act_cllrs[0], min_cllrs[0], min_cllrs_pav[0],
           act_cllrs[1], min_cllrs[1], min_cllrs_pav[1],
           act_dcfs[0], min_dcfs[0],
           act_dcfs[1], min_dcfs[1]))
    
def scores_neg_pos(scores, labels):
    scores = np.load(scores)
    labels = np.load(labels)
    
    aux = labels.files
    labels = labels['arr_0']
    
    labels = np.array(labels)
    scores = np.array(scores)
    tar = scores[labels == 1]
    non = scores[labels == 0]

    return tar, non 

def train_posthoc(scores, labels, ptar, model):
    tar, non = scores_neg_pos(scores, labels)
    a, b = calibration.logregCal(tar, non, return_params=True, Ptar=ptar)
    
    np.savez(model, a=a, b=b)
    print("Trained linear calibration model with %d positive and %d negative samples."%(len(tar), len(non)))
    print("Alpha = %.4f"%a); print("Beta  = %.4f"%b)
    return a, b

def test_posthoc(scores, labels, ptr, model, outscores):
    tar, non = scores_neg_pos(scores, labels)
    
    model = np.load(model)
    a, b = model['a'], model['b']
    raw_pos = tar; raw_neg = non
    
    cal_pos = a * raw_pos + b
    cal_neg = a * raw_neg + b
    has_key = True
    
    np.savez("%s.npz"%outscores, pos=cal_pos, neg=cal_neg)
    if has_key:
        print("Results before and after calibration on test %d positive and %d negative samples"%(len(raw_pos), len(raw_neg)))
        ptars = [ptr, 0.5]
        print("%-22s                              |         Ptar=%4.2f           |         Ptar=%4.2f           |    Ptar=%4.2f    |   Ptar=%4.2f  "%(" ",ptars[0], ptars[1], ptars[0], ptars[1]))
        print("%-22s |   #TGT   #IMP   |    EER   |   ACLLR MCLLR_LIN MCLLR_PAV |   ACLLR MCLLR_LIN MCLLR_PAV |  ADCF    MDCF   |   ADCF   MDCF  "%"Key")   
        print_perf(raw_pos, raw_neg, "before calibration", ptars)
        print_perf(cal_pos, cal_neg, "after calibration",  ptars)
        
