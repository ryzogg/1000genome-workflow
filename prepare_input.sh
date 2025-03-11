#!/usr/bin/env bash

workdir=`pwd`
dataset= 20130502			# valid: 20130502 or 20110521

cd $workdir/data/$dataset
for i in {1..22}
do
  gunzip -k ALL.chr${i}.250000.vcf.gz
done

cd $workdir/data/$dataset/sifting
for i in {1..22}
do
  wget ftp://ftp.1000genomes.ebi.ac.uk/vol1/ftp/release/$dataset/supporting/functional_annotation/filtered/ALL.chr${i}.phase3_shapeit2_mvncall_integrated_v5.$dataset.sites.annotation.vcf.gz
  gunzip -k ALL.chr${i}.phase3_shapeit2_mvncall_integrated_v5.$dataset.sites.annotation.vcf.gz
done

cd $workdir
