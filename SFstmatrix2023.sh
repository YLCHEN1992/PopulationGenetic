for ((i=1; i<=3; i++));do(for((j=1; j<=3; j++));do(
            POPX=pop${i}.txt
            POPY=pop${j}.txt
            combined="pop${i}pop${j}"
            #core script
            vcftools --vcf finalcombined_split_chr.vcf --weir-fst-pop $POPX --weir-fst-pop $POPY --out $combined
            result=$(cat ${combined}.log|grep Fst |grep mean|cut -d : -f 2)
            echo -n "$result ">>Fst.matrix
);done;echo>>Fst.matrix);done;

