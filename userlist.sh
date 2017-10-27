ORGLIST=`cf orgs`
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
