#!/bin/bash

#SBATCH --job-name=fslswap
#SBATCH --ntasks-per-node=1
#SBATCH --mem=4G
#SBATCH --time=00:15:00

# Copyright (c) 2020 brainlife.io at University of Texas at Austin and Indiana University
# 
# This is the main file run by the brainlife.io orchestration system
#
# Author: Hanna Willis, Rebecca Truby & Giulia Bertò

dwi=`jq -r '.dwi' config.json`
bvecs=`jq -r '.bvecs' config.json`
bvals=`jq -r '.bvals' config.json`
sbref=`jq -r '.sbref' config.json`
t1=`jq -r '.t1' config.json`
fmri=`jq -r '.bold' config.json`
dimensions=`jq -r '.swap_dimensions' config.json`

# make output directory
mkdir -p out_dir

if [ -f "$dwi" ]; then 

   echo "Run dwi swap"
   fslswapdim $dwi $dimensions out_dir/dwi.nii.gz
   
   # This is a Saad python script
   bash python.sh
   cp $bvals out_dir/dwi.bvals
   
   #if [ -f "$sbref" ]; then
   #   fslswapdim $sbref $dimensions out_dir/sbref.nii.gz  	
   #fi
   
elif [ -f "$t1" ]; then 

   echo "Run t1 swap"   
   fslswapdim $t1 $dimensions out_dir/t1.nii.gz
   
elif [ -f "$fmri" ]; then 

   echo "Run fmri swap"   
   fslswapdim $fmri $dimensions out_dir/bold.nii.gz  
    
   if [ -f "$sbref" ]; then
   fslswapdim $sbref $dimensions out_dir/sbref.nii.gz  	
   fi
   
fi   
