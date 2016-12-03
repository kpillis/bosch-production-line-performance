#!/bin/bash
cd ../input
FILES=../workdir/train_num*.csv
i=0
for f in $FILES
do
    if [ $i -eq 0 ]
        then
            echo "First"
            cp $f train_num.csv
            let "i=$i+1"
            echo $i
            continue
        else
            join --header -t',' -j 1 $f train_num.csv > tmp.csv
            mv tmp.csv train_num.csv
            let "i=$i+1"
            echo $i
    fi
    echo "Processing $f file..."
done
cd ../scripts
