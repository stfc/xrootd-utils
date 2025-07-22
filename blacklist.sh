managers=`cat managers.txt`
for i in $managers
do
ssh -i .ssh/id_rsa root@${i}.gridpp.rl.ac.uk "echo \"${1}.gridpp.rl.ac.uk\" >> /etc/xrootd/cms.blacklist"
done
