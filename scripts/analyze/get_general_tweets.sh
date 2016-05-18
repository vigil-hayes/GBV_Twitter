#!/bin/bash
cd /local/share/gbv_twitter/
source venv/bin/activate
cd -


# For all unprocessed, collected tweets today
for log in /local/share/gentweets/*.full/Gardenhose.*; do
        # Get the basename
	echo $log
        python get_general_tweets.py $log general_tweets.csv
done


