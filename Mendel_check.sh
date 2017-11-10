#!/bin/env bash

#   Emily Vonderharr 10/31/17
#   this script is for plink Mendel error checking
#   run from directory containing .ped files

PLINK=/home/morrellp/vonde026/Apps/Plink/plink
MAP=/panfs/roc/groups/9/morrellp/vonde026/Deleterious_GP/Data/Mendel_Errors/From_ExCap/GP_Comb.map

for i in *.ped
do
$PLINK --ped $i --map $MAP --allow-extra-chr --mendel --out ${i}_out
done


