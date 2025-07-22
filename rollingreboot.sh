hosts=`cat hosts.txt`
managers=`cat managers.txt`
fedid=''
for i in $hosts
do
echo "$i.gridpp.rl.ac.uk"
        for j in $managers
	do
	ssh -i .ssh/id_rsa -J ${fedid}@lcgui05.gridpp.rl.ac.uk root@${j}.gridpp.rl.ac.uk "echo \"$i.gridpp.rl.ac.uk\" >> /etc/xrootd/cms.blacklist"
        done 
	sleep 120
	ssh -i .ssh/id_rsa -J ${fedid}@lcgui05.gridpp.rl.ac.uk root@${i}.gridpp.rl.ac.uk "reboot"
        for j in $managers                                                                     
	do
        ssh -i .ssh/id_rsa -J ${fedid}@lcgui05.gridpp.rl.ac.uk root@${j}.gridpp.rl.ac.uk "sed -i '$ d' /etc/xrootd/cms.blacklist"
        done
done
