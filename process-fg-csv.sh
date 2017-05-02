#!/usr/bin/env bash

set -v
time ruby process_fg_csv.rb fg_data/fg-EarliestData-13Apr17.csv ../tensorflow/fg-data-earlest-13Apr17.csv
time ruby process_fg_csv.rb fg_data/fg-LatestData-13Apr17.csv ../tensorflow/fg-data-latest-13Apr17.csv

set +v
# Sed example to change NULL values post processing:
#sed -i 's/0.0001/-1.0/g' fg-data-earlest-13Apr17.csv
