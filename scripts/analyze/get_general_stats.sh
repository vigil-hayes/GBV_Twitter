#!/bin/bash

tags=$1
out=$2

# timestamp, tid, uid, uname, replytostatus, replytouser, oid, ouid, ufollowcount, ufriendcount, ufavecount, ustatuscount, lat, lng, ','.join(mentions), ','.join(hashtags), ','.join(urls), ','.join(media), timestamp-otimestamp, otimestamp, oufollowcount, oufriendcount, oufavecount, oustatuscount, olat, olng, text

echo "TAG: # Tweets" >> $out
awk 'BEGIN{FS="\t"}!a[$2]++' $tags | wc -l >> $out

echo "TAG: % Retweets" >> $out
awk 'BEGIN{FS="\t"}{tweets+=1; if($3 !~ $8){retweet+=1}}END{print retweet/tweets}' $tags >> $out

echo "TAG: % Replies" >> $out
awk 'BEGIN{FS="\t"}{tweets+=1; if($5 !~ /None/ || $6 !~ /None/){reply+=1}}END{print reply/tweets}' $tags >> $out

echo "TAG: # Unique users" >> $out
awk 'BEGIN{FS="\t"}!a[$3]++' $tags | wc -l >> $out

echo "TAG: # Unique content creators" >> $out
awk 'BEGIN{FS="\t"}{if($8 ~ /None/){a[$3]}else{a[$8]}}END{for(x in a){creator+=1}print creator}' $tags >> $out

