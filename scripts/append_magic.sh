#!/bin/bash
cd ../input
rm -f tmp.csv
join --header -t',' -j 1 ../workdir/train_magic.csv train_num.csv > train.csv
rm -f ../workdir/train_magic.csv
rm -f train_num.csv
join --header -t',' -j 1 ../workdir/test_magic.csv test_num.csv > test.csv
rm -f ../workdir/test_magic.csv
rm -f test_num.csv
cd ../scripts
