#!/bin/bash
cd ../input
rm -f tmp.csv
FILES=../workdir/train_num*.csv
i=0
for f in $FILES
do
    echo $i
    echo "Processing $f file..."
    if [ $i -eq 0 ]
        then
            cp $f train_num.csv
            let "i=$i+1"
            continue
        else
            join --header -t',' -j 1 $f train_num.csv > tmp.csv
            mv tmp.csv train_num.csv
            let "i=$i+1"
    fi
done
rm $FILES
cd ../scripts
