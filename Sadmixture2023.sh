star=$1
num=$2
for ((i=$star; i<=$num; i++));do (nohup admixture --cv finallcombined_split_chr.bed $i -j4| tee log${i}.out > runoob.log 2>&1 & ); done
