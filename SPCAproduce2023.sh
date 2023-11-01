plink --file finalcombined_split_chr --pca --out finalcombined_split_chr.pca
twstats -t twtable -i finalcombined_split_chr.pca.eigenval -o finalcombined_split_chr.pca.eigenval.out