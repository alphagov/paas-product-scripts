ORGLIST=`cf orgs|tail +4`
# echo $ORGLIST
for i in $ORGLIST;
	do {
	echo "=============================================="
	echo "Org $i"
	echo "=============================================="
	cf org-users $i
	echo
	}
	done
