#!/bin/bash
dnn="${dnn:-resnet56}"
source exp_configs/$dnn.conf
nworkers="${nworkers:-4}"
density="${density:-0.002}"
threshold="${threshold:-8192}"
compressor="${compressor:-topk}"
# compressor="${compressor:-randk}"
nwpernode=1
nstepsupdate=1
PY=python
MPIPATH=/lihongliang/zm/build

HOROVOD_FUSION_THRESHOLD=0 $MPIPATH/bin/mpirun --oversubscribe --prefix $MPIPATH -np $nworkers -hostfile cluster$nworkers -bind-to none -map-by slot \
    -x NCCL_DEBUG=INFO -x LD_LIBRARY_PATH -x PATH \
    -x NCCL_P2P_DISABLE=1 \
    -x NCCL_SHM_DISABLE=1 \
    -x NCCL_CHECKS_DISABLE=1 \
    -x HOROVOD_FUSION_THRESHOLD=0 \
    -mca pml ob1 -mca btl ^openib \
    $PY horovod_trainer.py --dnn $dnn --dataset $dataset --max-epochs $max_epochs --batch-size $batch_size --nworkers $nworkers --data-dir $data_dir --lr $lr --nsteps-update $nstepsupdate --nwpernode $nwpernode --density $density --compressor $compressor --threshold $threshold
