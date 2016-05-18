#!/bin/bash
cd /local/share/gbv_twitter/
source venv/bin/activate
cd -

DATE="$(date +'%Y-%m-%d')"
HOUR="$(date +'%H')"

# For all unprocessed, collected tweets today
for log in /local/share/gbv_twitter/scripts/collect/logs/"$DATE"/*s*[0-9].json; do
        # Get the basename
        BASE=$(basename $log)
        # Remove duplicates
        awk '!a[$0]++' $log > "$BASE"
        mv $log "$log".processed

        # Filter tweets by location
	mkdir /local/share/gbv_twitter/tweets/"$DATE"
	mv "$BASE" /local/share/gbv_twitter/tweets/"$DATE" 
done
