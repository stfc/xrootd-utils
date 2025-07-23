hosts=`cat hosts.txt`
for t in ${hosts[@]}; do
#  echo "--------------------------------------------------------------------------------------------------------------" 
( echo $t && ssh root@${t}.gridpp.rl.ac.uk "${1}" )
done
