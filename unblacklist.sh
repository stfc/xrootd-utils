managers=`cat managers.txt`
for i in $managers
do
ssh -i .ssh/id_rsa root@${i}.gridpp.rl.ac.uk "sed -i \"/${1}/d\" /etc/xrootd/cms.blacklist"
done
