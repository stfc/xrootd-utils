managers=`cat managers.txt`
for i in $managers
do
ssh root@${i}.gridpp.rl.ac.uk "echo \"${1}.gridpp.rl.ac.uk\" >> /etc/xrootd/cms.blacklist"
done
