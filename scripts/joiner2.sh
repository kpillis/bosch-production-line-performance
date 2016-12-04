#!/bin/bash
cd ../input
rm -f tmp.csv
FILES=../workdir/test_num*.csv
i=0
for f in $FILES
do
    echo $i
    echo "Processing $f file..."
    if [ $i -eq 0 ]
        then
            cp $f test_num.csv
            let "i=$i+1"
            continue
        else
            join --header -t',' -j 1 $f test_num.csv > tmp.csv
            mv tmp.csv test_num.csv
            let "i=$i+1"
    fi
done
rm $FILES
cd ../scripts
