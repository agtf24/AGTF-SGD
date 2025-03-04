<<<<<<< HEAD
# AGTF-SGD
Code for Accuracy-Guided Tensor Fusion for Distributed Deep Learning.
=======
# Layer-wise sparsification of distributed deep learning
## Introduction
This repository contains the codes of the layer-wise sparsification papers appeared at *INFOCOM 2020* (Optimal Merged-Gradient Sparsification Schocastic Gradident Descent (OMGS-SGD)) and *ECAI 2020* (this version targets at theorectical study). OMGS-SGD is a communication-efficient distributed training algorithm for deep learning on low-bandwidth networks. This implementation is built atop [Horovod](https://github.com/horovod/horovod). The key idea of OMGS-SGD is to merge some possible neaby tensors and sparsify their merged gradients so that computations (including top-k sparsification and backpropagation) and communications can be pipelined. For more details about the algorithm, please refer to our papers (with optimality and convergence proofs).

## Installation
### Prerequisites
- Python3
- PyTorch-0.4.+
- [OpenMPI-3.1.+](https://www.open-mpi.org/software/ompi/v3.1/)
- [Horovod-0.14.+](https://github.com/horovod/horovod)

### Quick Start
```
git clone https://github.com/HKBU-HPML/OMGS-SGD.git
cd OMGS-SGD 
pip install -r requirements.txt
dnn=resnet20 nworkers=4 ./horovod_mpi.sh
```
Assume that you have 4 GPUs on a single node and everything works well, you will see that there are 4 workers running at a single node training the ResNet-20 model with the Cifar-10 data set using the OMGS-SGD algorithm.
## Papers
- Shaohuai Shi, Qiang Wang, Xiaowen Chu, Bo Li, Yang Qin, Ruihao Liu, and Xinxiao Zhao, “Communication-Efficient Distributed Deep Learning with Merged Gradient Sparsification on GPUs,” *IEEE INFOCOM 2020*, Toronto, Canada, July 2020.
- Shaohuai Shi, Zhenheng Tang, Qiang Wang, Kaiyong Zhao, and Xiaowen Chu, “Layer-wise Adaptive Gradient Sparsification for Distributed Deep Learning with Convergence Guarantees,” *The 24th European Conference on Artificial Intelligence (ECAI)*, Santiago de Compostela, Spain, August 2020.
## Referred Models
- Deep speech: [https://github.com/SeanNaren/deepspeech.pytorch](https://github.com/SeanNaren/deepspeech.pytorch)
- PyTorch examples: [https://github.com/pytorch/examples](https://github.com/pytorch/examples)

# Accuracy-Guided Tensor Fusion for Distributed Deep Learning
## Introduction
We implement a prototype of SNA-MGS-SGD on Pytorch based on OMGS-SGD shared publicly available（*INFOCOM 2020* (Optimal Merged-Gradient Sparsification Schocastic Gradident Descent (OMGS-SGD)). On this basis, we implement layer-wise gradients sparsification based on the importance of each layer and dynamically adjust the sparsity rate during tensor fusion, add the function of calculating and evaluating the change of sparse noise before and after tensor fusion, provide the accuracy-guided tensor fusion algrithom. The key idea of SNA-MGS-SGD is to merge  adjacent layers and sparsify their merged gradients properly so that computations and communications can be pipelined as much as possible and control the test accuracy loss caused by sparse gradient fusion.

>>>>>>> 9e49a6e (first commit)
