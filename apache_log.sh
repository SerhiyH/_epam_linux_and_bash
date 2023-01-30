#!/bin/bash
#apache_log.sh
#Using Apache log example create a script to answer the following questions:


#1. From which ip were the most requests?
count_ip=`awk '{ print $1 }' apache_logs.txt | sort | uniq -c | sort -nr | head -n 1 | awk '{ print $2, " / " $1 " requests " }'`
#`cut -d " " -f 1 apache_logs.txt | sort | uniq -c | sort -nr | head -n 10 | awk '{print $1}'`
echo -e "1. Most requests are from ip: $count_ip\n"


#2. What is the most requested site?
most_req_page=`awk '{ print $0 }' apache_logs.txt `
echo -e "2. Most requested page is:\n$most_req_page\n"


#3. How many requests were there from each ip?
how_req=`awk '{ print $1 }' apache_logs.txt | sort | uniq -c | sort -rn | awk '{ print " IP ", $2 " / ", $1 }'`
echo -e "3. Requests from each ip:\n$how_req\n"


#4. What non-existent sites were clients referred to?
nonExPage=`awk '{ print $0 }' apache_logs.txt | grep "error"`
echo -e "4. Non-existent sites were:\n$nonExPage\n"


#5. What time did site get the most requests?
tmRequests=`awk '{ print $4, $5 }' apache_logs.txt | sort | uniq -c | sort -nr | head -n 5`
echo -e "5. Time did site get the most requests:\n$tmRequests\n"


#6. What search bots have accessed the site? (UA + IP)
searchAccess=`awk '{ print $0 }' apache_logs.txt | sort | uniq -c | awk '{ print $2, $8, $9, $10, $15, $16 }' | grep "200" | grep [Bb]ot`
#echo -e "6. Site search accessed:\n$searchAccess\n"
