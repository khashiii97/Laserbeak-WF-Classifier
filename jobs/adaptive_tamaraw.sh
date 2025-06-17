#!/bin/bash
#SBATCH --job-name=two_step_vs_rf   # Job name
#SBATCH --gres=gpu:1                   # Request GPU resource
#SBATCH --nodes=1                      # Run all processes on a single node
#SBATCH --ntasks=1                     # Run a single task        
#SBATCH --cpus-per-task=30              # Number of CPU cores per task
#SBATCH --mem=128G                      # Job memory request
#SBATCH --time=20:00:00                # Time limit hrs:min:sec
#SBATCH --output=/home/kka151/projects/def-t55wang/kka151/Laserbeak-WF-Classifier/jobs/logs/tamaraw_two_step_lb_k_7_%j.log  # Standard output and error log


# Load any modules and activate your conda environment here
module load StdEnv/2023
module load python/3.11.5
module load rust/1.76.0
module load gcc arrow/17.0.0
source /home/kka151/venvs/python_11_5/bin/activate


# Navigate to your project directory (optional)
cd /home/kka151/projects/def-t55wang/kka151/Laserbeak-WF-Classifier



# Execute your deep learning script
python3 benchmark.py --data_dir cc --config ./configs/laserbeak.json --dataset adaptive-tamaraw --epochs 20 --multisamples 10 --exp_name my_experiment --tamaraw_config 1

python3 benchmark.py --data_dir cc --config ./configs/laserbeak.json --dataset adaptive-tamaraw --epochs 20 --multisamples 10 --exp_name my_experiment --tamaraw_config 2

python3 benchmark.py --data_dir cc --config ./configs/laserbeak.json --dataset adaptive-tamaraw --epochs 20 --multisamples 10 --exp_name my_experiment --tamaraw_config 3

python3 benchmark.py --data_dir cc --config ./configs/laserbeak.json --dataset adaptive-tamaraw --epochs 20 --multisamples 10 --exp_name my_experiment --tamaraw_config 25