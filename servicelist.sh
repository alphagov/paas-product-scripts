ORGLIST=`cf orgs|tail -n +4`
# echo $ORGLIST
for i in $ORGLIST;
	do {
	echo "=============================================="
	echo "Org $i"
	echo "=============================================="
	cf org-users $i
	cf target -o $i
	cf spaces
	SPACELIST=`cf spaces|tail -n +4`
	for j in $SPACELIST
		do {
		echo "*********"
		echo "Space $j"
		echo "*********"
		cf target -o $i -s $j
		cf services
		cf apps
		}
		done

	echo
	}
	done
