managers=`cat managers.txt`
for i in $managers
do
ssh root@${i}.gridpp.rl.ac.uk "cat /etc/xrootd/cms.blacklist" > ${i}.man.blk
done
files=(*.man.blk)
first="${files[0]}"
for f in $files;
do
  cmp --silent "$first" "$f" || {
    echo "Mismatched blacklist: $first vs $f"
    diff $first $f
    exit 1
  }
done
cat $first
cat $first > blacklist.txt
rm -rf *.man.blk
