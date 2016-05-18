#!/bin/bash
cd /local/share/gbv_twitter/
source venv/bin/activate
cd -


# For all unprocessed, collected tweets today
for log in /local/share/gbv_twitter/scripts/collect/logs/2016-*/tags*.json; do
        # Get the basename
        python get_gbv_hashtags.py $log gbv_hashtags_data.csv
done


