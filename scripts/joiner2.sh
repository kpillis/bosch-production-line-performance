#!/bin/bash
cd ../input
rm -f tmp.csv
FILES=../workdir/test_num*.csv
i=0
for f in $FILES
do
    if [ $i -eq 0 ]
        then
            echo "First"
            cp $f test_num.csv
            let "i=$i+1"
            echo $i
            continue
        else
            join --header -t',' -j 1 $f test_num.csv > tmp.csv
            mv tmp.csv test_num.csv
            let "i=$i+1"
            echo $i
    fi
    echo "Processing $f file..."
done
cd ../scripts
