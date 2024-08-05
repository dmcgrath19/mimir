#!/bin/bash

#$ -N mimir-pythia

#$ -o /exports/eddie/scratch/s2558433/job_runs/mimir-pythia-$JOB_ID.log
#$ -e /exports/eddie/scratch/s2558433/job_runs/mimir-pythia-$JOB_ID.err
#$ -cwd
#$ -q gpu
#$ -pe gpu-a100 1
#$ -l h_vmem=300G
#$ -l h_rt=24:00:00
#$ -m bea -M s2558433@ed.ac.uk 

export HF_HOME="/exports/eddie/scratch/s2558433/.cache/huggingface_cache"
export TRANSFORMERS_CACHE="/exports/eddie/scratch/s2558433/.cache/huggingface_cache/transformers"
export HF_DATASETS_CACHE="/exports/eddie/scratch/s2558433/.cache/huggingface_cache/datasets"
export PIP_CACHE_DIR="/exports/eddie/scratch/s2558433/.cache/pip"
export CONDA_PKGS_DIRS="/exports/eddie/scratch/s2558433/.cache/conda_pkgs"

export MIMIR_CACHE_PATH="/exports/eddie/scratch/s2558433/.cache/mimir_cache"
export MIMIR_DATA_SOURCE="/exports/eddie/scratch/s2558433/.cache/mimir_ds_cache"

. /etc/profile.d/modules.sh
module unload cuda
module load cuda/12.1.1


source /exports/eddie/scratch/s2558433/miniconda3/etc/profile.d/conda.sh
module load anaconda
conda activate mimir
cd /exports/eddie/scratch/s2558433/mimir/

python run.py --config configs/py-xxl.json

conda deactivate
