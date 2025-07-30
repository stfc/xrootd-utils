hosts=`cat hosts.txt`
managers=`cat managers.txt`
for i in $hosts
do
echo "$i.gridpp.rl.ac.uk"
        for j in $managers
	do
	ssh root@${j}.gridpp.rl.ac.uk "echo \"$i.gridpp.rl.ac.uk\" >> /etc/xrootd/cms.blacklist"
        done 
	sleep 240
	ssh root@${i}.gridpp.rl.ac.uk "reboot"
        for j in $managers                                                                     
	do
        ssh root@${j}.gridpp.rl.ac.uk "sed -i '$ d' /etc/xrootd/cms.blacklist"
        done
done
