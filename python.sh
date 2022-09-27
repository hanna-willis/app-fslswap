#!/bin/bash

# input configs 
   bvecs=`jq -r '.bvecs' config.json`
   dimensions=`jq -r '.swap_dimensions' config.json`
   
# Run custom bvec_swap.py script written by Saad.
   singularity exec -e docker://brainlife/dipy:0.16.0 python bvec_swap.py $bvecs $dimensions out_dir/dwi.bvecs


