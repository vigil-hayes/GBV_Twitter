#!/bin/bash
cd /local/share/gbv_twitter/
source venv/bin/activate
cd -

python twitter_streaming_gbv_tags.py config/tags_keys.cfg config/gbv_tags.cfg &>> logs/twitter_streaming_gbv_tags.log &
