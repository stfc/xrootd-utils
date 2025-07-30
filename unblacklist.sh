managers=`cat managers.txt`
for i in $managers
do
ssh root@${i}.gridpp.rl.ac.uk "sed -i \"/${1}/d\" /etc/xrootd/cms.blacklist"
done
