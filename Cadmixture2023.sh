#put me into sample file
#running environment including in [bcftools] [vcftools] [plink] [admixture]
num=$1
#creating index 
ls *vcf.gz|while read line;do
bcftools index -f $line
done
#merge .vcf
bcftools merge *.vcf.gz -Oz -0 -o merge.vcf.gz
#filter
bcftools filter -t chr1,chr10,chr11,chr12,chr13,chr14,chr15,chr16,chr17,chr18,chr19,chr2,chr20,chr21,chr22,chr3,chr4,chr5,chr7,chr8,chr9,chrX merge.vcf.gz --output combined_split_chr.vcf.gz --output-type z 
#generate ped and map files
vcftools --gzvcf combined_split_chr.vcf.gz --plink --out combined_split_chr
plink --file combined_split_chr --maf 0.01 --geno 0.01 --mind 0.02 --recode --out finalcombined_split_chr
#generate bed fam and bim files
plink --file finalcombined_split_chr --make-bed --out finallcombined_split_chr
for ((i=1; i<=$num; i++));do (nohup admixture --cv finallcombined_split_chr.bed $i -j4| tee log${i}.out > runoob.log 2>&1 & ); done