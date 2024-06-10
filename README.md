## Reduccion-Sesgo-Speaker-Verificaciton
Este repositorio contiene el main framework en el que se basa el trabajo Modelado de embeddings para la reducción de sesgo en sistemas de reconocimiento de locutor.

El repositorio se basa en dos trabajos previos a los que referenciaremos:

    * training speaker recognition models, descritos en el paper '_In defence of metric learning for speaker recognition_' and '_Pushing the limits of raw waveform speaker recognition_'. El repositorio original es 
    VoxCeleb trainer y se ecnuentra el el siguiente elnace:  https://github.com/clovaai/voxceleb_trainer/tree/master 
    
    * DCA-PLDA, repositprio que implementa Discriminative Condition-Aware Backend, tal y como se describe en el 
    el paper de L. Ferrer, M. McLaren, & N. Brümmer "A Speaker Verification Backend with Robust Performance across Conditions" (https://arxiv.org/pdf/2102.01760)



# VoxCeleb trainer

This repository contains the framework for training speaker recognition models described in the paper '_In defence of metric learning for speaker recognition_' and '_Pushing the limits of raw waveform speaker recognition_'.

### Dependencies
```
pip install -r requirements.txt
```

### Data preparation

The following script can be used to download and prepare the VoxCeleb dataset for training.

```
python ./dataprep.py --save_path data --download --user USERNAME --password PASSWORD 
python ./dataprep.py --save_path data --extract
python ./dataprep.py --save_path data --convert
```
In order to use data augmentation, also run:

```
python ./dataprep.py --save_path data --augment
```

In addition to the Python dependencies, `wget` and `ffmpeg` must be installed on the system.

### Training examples

- ResNetSE34L with AM-Softmax:
```
python ./trainSpeakerNet.py --config ./configs/ResNetSE34L_AM.yaml
```

- RawNet3 with AAM-Softmax
```
python ./trainSpeakerNet.py --config ./configs/RawNet3_AAM.yaml
```

- ResNetSE34L with Angular prototypical:
```
python ./trainSpeakerNet.py --config ./configs/ResNetSE34L_AP.yaml
```

You can pass individual arguments that are defined in trainSpeakerNet.py by `--{ARG_NAME} {VALUE}`.
Note that the configuration file overrides the arguments passed via command line.

### Pretrained models

A pretrained model, described in [1], can be downloaded from [here](http://www.robots.ox.ac.uk/~joon/data/baseline_lite_ap.model).

You can check that the following script returns: `EER 2.1792`. You will be given an option to save the scores.

```
python ./trainSpeakerNet.py --eval --model ResNetSE34L --log_input True --trainfunc angleproto --save_path exps/test --eval_frames 400 --initial_model baseline_lite_ap.model
```

A larger model trained with online data augmentation, described in [2], can be downloaded from [here](http://www.robots.ox.ac.uk/~joon/data/baseline_v2_smproto.model). 

The following script should return: `EER 1.0180`.

```
python ./trainSpeakerNet.py --eval --model ResNetSE34V2 --log_input True --encoder_type ASP --n_mels 64 --trainfunc softmaxproto --save_path exps/test --eval_frames 400  --initial_model baseline_v2_smproto.model
```

Pretrained RawNet3, described in [3], can be downloaded via `git submodule update --init --recursive`.

The following script should return `EER 0.8932`.

```
python ./trainSpeakerNet.py --eval --config ./configs/RawNet3_AAM.yaml --initial_model models/weights/RawNet3/model.pt
```



### Implemented loss functions
```
Softmax (softmax)
AM-Softmax (amsoftmax)
AAM-Softmax (aamsoftmax)
GE2E (ge2e)
Prototypical (proto)
Triplet (triplet)
Angular Prototypical (angleproto)
```

### Implemented models and encoders
```
ResNetSE34L (SAP, ASP)
ResNetSE34V2 (SAP, ASP)
VGGVox40 (SAP, TAP, MAX)
```

### Data augmentation

`--augment True` enables online data augmentation, described in [2].

### Adding new models and loss functions

You can add new models and loss functions to `models` and `loss` directories respectively. See the existing definitions for examples.

### Accelerating training

- Use `--mixedprec` flag to enable mixed precision training. This is recommended for Tesla V100, GeForce RTX 20 series or later models.

- Use `--distributed` flag to enable distributed training.

  - GPU indices should be set before training using the command `export CUDA_VISIBLE_DEVICES=0,1,2,3`.

  - If you are running more than one distributed training session, you need to change the `--port` argument.

### Data

The [VoxCeleb](http://www.robots.ox.ac.uk/~vgg/data/voxceleb/) datasets are used for these experiments.

The train list should contain the identity and the file path, one line per utterance, as follows:
```
id00000 id00000/youtube_key/12345.wav
id00012 id00012/21Uxsk56VDQ/00001.wav
```

The train list for VoxCeleb2 can be download from [here](http://www.robots.ox.ac.uk/~vgg/data/voxceleb/meta/train_list.txt). The
test lists for VoxCeleb1 can be downloaded from [here](https://mm.kaist.ac.kr/datasets/voxceleb/index.html#testlist). 

### Replicating the results from the paper

1. Model definitions
  - `VGG-M-40` in [1] is `VGGVox` in the repository.
  - `Thin ResNet-34` in [1] is `ResNetSE34` in the repository.
  - `Fast ResNet-34` in [1] is `ResNetSE34L` in the repository.
  - `H / ASP` in [2] is `ResNetSE34V2` in the repository.

2. For metric learning objectives, the batch size in the paper is `nPerSpeaker` multiplied by `batch_size` in the code. For the batch size of 800 in the paper, use `--nPerSpeaker 2 --batch_size 400`, `--nPerSpeaker 3 --batch_size 266`, etc.

3. The models have been trained with `--max_frames 200` and evaluated with `--max_frames 400`.

4. You can get a good balance between speed and performance using the configuration below.

```
python ./trainSpeakerNet.py --model ResNetSE34L --trainfunc angleproto --batch_size 400 --nPerSpeaker 2 
```

### Citation

Please cite [1] if you make use of the code. Please see [here](References.md) for the full list of methods used in this trainer.

[1] _In defence of metric learning for speaker recognition_
```
@inproceedings{chung2020in,
  title={In defence of metric learning for speaker recognition},
  author={Chung, Joon Son and Huh, Jaesung and Mun, Seongkyu and Lee, Minjae and Heo, Hee Soo and Choe, Soyeon and Ham, Chiheon and Jung, Sunghwan and Lee, Bong-Jin and Han, Icksang},
  booktitle={Proc. Interspeech},
  year={2020}
}
```

[2] _The ins and outs of speaker recognition: lessons from VoxSRC 2020_
```
@inproceedings{kwon2021ins,
  title={The ins and outs of speaker recognition: lessons from {VoxSRC} 2020},
  author={Kwon, Yoohwan and Heo, Hee Soo and Lee, Bong-Jin and Chung, Joon Son},
  booktitle={Proc. ICASSP},
  year={2021}
}
```

[3] _Pushing the limits of raw waveform speaker recognition_
```
@inproceedings{jung2022pushing,
  title={Pushing the limits of raw waveform speaker recognition},
  author={Jung, Jee-weon and Kim, You Jin and Heo, Hee-Soo and Lee, Bong-Jin and Kwon, Youngki and Chung, Joon Son},
  booktitle={Proc. Interspeech},
  year={2022}
}
```

### License
```
Copyright (c) 2020-present NAVER Corp.

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
```




# DCA-PLDA

This repository implements the Discriminative Condition-Aware Backend described in the paper:

*L. Ferrer, M. McLaren, and N. Brümmer, ["A Speaker Verification Backend with Robust Performance across Conditions"](https://arxiv.org/pdf/2102.01760), in Computer Speech and Language, volume 71, 2021*

This backend has the same functional form as the usual probabilistic discriminant analysis (PLDA) backend which is commonly used for speaker verification, including the preprocessing stages. It also integrates the calibration stage as part of the backend, where the calibration parameters depend on an estimated condition for the signal. The condition is internally represented by a very low dimensional vector. See the paper for more details on the mathematical formulation of the backend.

We have found this system to provide great out-of-the-box performance across a very wide range of conditions, when training the backend with a variety of data including Voxceleb, SRE (from the NIST speaker recognition evaluations), Switchboard, Mixer 6, RATS and FVC Australian datasets, as described in the above paper. 

The code can also be used to train and evaluate a standard PLDA pipeline. Basically, the initial model before any training epochs is identical to a PLDA system, with an option for weighting the samples during training to compensate for imbalance across training domains.

Further, the current version of the code can also be used to do language detection. In this case, we have not yet explored the use of condition-awereness, but rather focused on a novel hierachical approach, which is described in the following paper:

*L. Ferrer, D. Castan, M. McLaren, and A. Lawson, ["A Hierarchical Model for Spoken Language Recognition"](https://arxiv.org/abs/2201.01364), arXiv:2201.01364, 2021*

Example scripts and configuration files to do both speaker verification and language detection are provided in the examples directory.

This code was written by Luciana Ferrer. We thank Niko Brummer for his help with the calibration code in the calibration.py file and for providing the code to do heavy-tail PLDA. The pre-computed embeddings provided to run the example were computed using SRI's software and infrastructure.

We will appreciate any feedback about the code or the approaches. Also, please let us know if you find bugs.


## How to install

1. Clone this repository:  

   ```git clone https://github.com/luferrer/DCA-PLDA.git```

2. Install the requirements:  
   
   ```pip install -r requirements.txt```

3. If you want to run the example code, download the pre-computed embeddings for the task you want to run from:  

   [```https://sftp.speech.sri.com/forms/DCA-DPLDA```](https://sftp.speech.sri.com/forms/DCA-DPLDA)
   
   Untar the file and move (or link) the resulting data/ dir inside the example dir for the task you want to run. 

4. You can then run the run_all script which runs several experiments using different configuration files and training sets. You can edit it to just try a single configuration, if you want. Please, see the top of that script for an explanation on what is run and where the output results end up. The run_all scripts will take a few hours to run (on a GPU) if all configurations are run. A RESULTS file is also provided for comparison. The run_all script should generate similar numbers to those in that file if all goes well.

## About the examples

The example dir contains two example recipes, one for speaker verification and one for language detection.

### Speaker Verification

The example provided with the repository includes the Voxceleb and FVC Australian subsets of the training data used in the paper, since the other datasets are not freely available. As such, the resulting system will only work well on conditions similar to those present in that data. For this reason, we test the resulting model on SITW and Voxceleb2 test dataset, which are very similar in nature to the Voxceleb data used for training. We also test on a set of FVC speakers which are held-out from training.

### Language Detection

The example uses the Voxlingua107 dataset which contains a large number of languages. 

## How to change the examples to use your own data and embeddings

The example scripts run using embeddings for each task extracted at **SRI International** using standard x-vector architectures. See the papers cited above for a description of the characteristics of the corresponding embedding extractors. Unfortunately, we are unable to release the embedding extractors, but you should be able to replace these embeddings with any type of speaker or language embeddings (eg, those that can be extracted with Kaldi).

The audio files corresponding to the databases used in the speaker verification example above can be obtained for free:

* Voxceleb1 and Voxceleb2 data can be obtained from http://www.robots.ox.ac.uk/~vgg/data/voxceleb/
* FVC Australian dataset can be requested in http://databases.forensic-voice-comparison.net/
* The SITW database can be requested at sitw_poc@speech.sri.com

For the language detection example, the Voxlingua107 audio samples can be obtained from http://bark.phon.ioc.ee/voxlingua107/.

Once you have extracted embeddings for all that data using your own procedure, you can set up all the lists and embeddings in the same way and with the same format (hdf5 or npz in the case of embeddings) as in the example data dir for your task of interest and use the run_all script. 


## Note on scoring multi-sample enrollment models

For now, for speaker verification, the DCA-PLDA model only knows how to calibrate trials that are given by a comparison of two individual speech waveforms since that is the way we create trials during training. The code in this repo can still score trials with multi-file enrollment models, but it does it in a hacky way. Basically, it scores each enrollment sample against the test sample for the trial and then averages the scores. This works reasonably well but it is not ideal. A generalization to scoring multi-sample enrollment trials within the model is left as future work. 
