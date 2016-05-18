#!/bin/bash


awk 'BEGIN{FS="\t"}{if(($3 ~ $8 || $8 == "") && ($5 ~ /None/ || $6 ~ /None/)){print $0}}' combined.csv > original_tweets.csv


awk 'BEGIN{FS="\t"}{a[$4]+=1}END{for(x in a){print x "\t" a[x]}}' combined.csv | sort -nrk 2 > tweeters_freq.csv

awk 'BEGIN{FS="\t"}{if($3 ~ $8 || $8 == ""){a[$4]+=1}}END{for(x in a){print x "\t" a[x]}}' combined.csv | sort -nrk 2 > content_creators.csv
