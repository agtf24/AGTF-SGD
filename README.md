
# AGTF-SGD：Code for Accuracy-Guided Tensor Fusion for Sparse Gradient in Data Parallel Deep Learning.
# Accuracy-Guided Tensor Fusion for Sparse Gradient in Data Parallel Deep Learning
## Introduction
We implement a prototype of AGTF-SGD on Pytorch based on OMGS-SGD shared publicly available（*INFOCOM 2020* (Optimal Merged-Gradient Sparsification Schocastic Gradident Descent (OMGS-SGD)). On this basis, we implement layer-wise gradients sparsification based on the importance of each layer and dynamically adjust the sparsity rate during tensor fusion, add the function of calculating and evaluating the change of sparse noise before and after tensor fusion, provide the accuracy-guided tensor fusion algrithom. The key idea of AGTF-SGD is to fuse adjacent layers and sparsify their merged gradients properly so that computations and communications can be pipelined as much as possible and control the test accuracy loss caused by sparse gradient fusion.

## Installation
### Prerequisites
- Python3
- PyTorch-0.4.+
- nccl-2.20.5
- OpenMPI-4.1.5
- cmake-3.16.3
- Horovod-0.28.1

### Quick Start
```
git clone https://github.com/agtf24/AGTF_SGD.git
cd AGTF_SGD 
pip install -r requirements.txt
dnn=resnet20 nworkers=2 ./horovod_mpi.sh
```
Assume that you have 2 GPUs on a single node and everything works well, you will see that there are 2 workers running at a single node training the ResNet-20 model with the Cifar-10 data set using the AGTF-SGD algorithm.

