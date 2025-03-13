#!/usr/bin/env bash

workdir=`pwd`
dataset=20110521 			# valid: 20130502 or 20110521

cd $workdir/data/$dataset
for i in {1..22}
do
  gunzip -k ALL.chr${i}.250000.vcf.gz
done

if [[ "$dataset" == "20110521" ]]; then
	base_url="ftp://ftp.1000genomes.ebi.ac.uk/vol1/ftp/release/$dataset/"
	file_name=".phase1_release_v3.20101123.snps_indels_svs.genotypes.vcf.gz"
else 
	base_url="ftp://ftp.1000genomes.ebi.ac.uk/vol1/ftp/release/$dataset/supporting/functional_annotation/filtered/"
	 file_name=".phase3_shapeit2_mvncall_integrated_v5.$dataset.sites.annotation.vcf.gz"
fi

cd $workdir/data/$dataset/sifting
for i in {1..22}
do
  wget -c "${base_url}ALL.chr${i}${file_name}"
  gunzip -k "All.chr${i}$file_name"
done

cd $workdir
