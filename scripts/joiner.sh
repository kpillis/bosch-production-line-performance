#!/bin/bash
cd ../input
join --header -t',' -j 1 train_numeric.csv train_date.csv > train_numdate.csv
join --header -t',' -j 1 train_numdate.csv train_categorical.csv > trainer.csv
join --header -t',' -j 1 test_numeric.csv test_date.csv > test_numdate.csv
join --header -t',' -j 1 test_numdate.csv test_categorical.csv > tester.csv
cd ../scipts
