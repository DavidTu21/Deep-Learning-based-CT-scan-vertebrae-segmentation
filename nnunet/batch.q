#!/bin/bash -l
#SBATCH --job-name=lowres
#SBATCH --nodes=1
#SBATCH --ntasks=4
#SBATCH --mem=100gb
#SBATCH --time=12:00:00
#SBATCH --qos=express
#SBATCH --gres=gpu:1
#SBATCH --mail-type=ALL

#This is a comment
#Anything above this line starting with #SBATCH is a set of instructions for the batch system e.g. how much memory you want
#Do NOT modify "nodes=1" unless you know what you're doing - most "desktop" programs can't use more than one node

#The below is what you want to actually run/do

echo "number of cores is $SLURM_NTASKS"
export nnUNet_raw_data_base="/scratch1/tu012/nnUNet-David/nnunet/nnUNet_base/"
export RESULTS_FOLDER="/scratch1/tu012/nnUNet-David/nnunet/RESULT/"
export nnUNet_preprocessed="/scratch1/tu012/nnUNet-David/nnunet/nnUNet_preprocessed/"
module load torch/20170407
module load torchvision/0.6.1-py36
module load pytorch/1.6.0-py36-cuda10
python inference/predict_simple.py -i nnUNet_base/nnUNet_raw_data/Task188_Verse/imagesTs -o nnUNet_base/nnUNet_raw_data/Task188_Verse/Inference_result_lowres -t 188 -m 3d_lowres --disable_tta 
#python run/run_training.py 3d_fullres nnUNetTrainerV2 Task188_Verse 4 -c --valbest --disable_postprocessing_on_folds


 

