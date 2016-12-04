#!/bin/bash
cd ../input
rm -f tmp.csv
join --header -t',' -j 1 ../workdir/train_magic.csv train_num.csv > train.csv
join --header -t',' -j 1 ../workdir/test_magic.csv test_num.csv > test.csv
cd ../scripts
