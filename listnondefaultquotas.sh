ORGLIST=`cf orgs|tail -n +4`
# echo $ORGLIST
for i in $ORGLIST;
	do {
	j=`cf org $i|tail -n +4`
	k=`echo $j|grep "quota: *default"`
	if [ $? -eq 1 ]
		then
		echo "======== $i ========="
		cf org $i|grep "quota:"|sed -e 's/^[[:space:]]*//'
		echo
	fi
	}
	done
