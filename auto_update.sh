#!/bin/bash
DIR='/home/ben/GitRepos/links'

if [[ -n $(ip addr | grep '172.2[96]\|2001') ]]; then
	if [[ -n $(diff <(head -2 $DIR/index.md) <(ip addr | grep '172.29\|2001' |awk '{print "* " $2}')) ]]; then

		ip addr | grep '172.2[96]\|2001' |awk '{print "* " $2}' > $DIR/index.md
		echo >> $DIR/index.md
		echo '---' >> $DIR/index.md
		date >> $DIR/index.md

		# README.md

		echo "My local ip address at school" > $DIR/README.md
		ip addr | grep '172.2[96]\|2001' |awk '{print "* " $2}' >> $DIR/README.md
		echo >> $DIR/README.md
		echo '---' >> $DIR/README.md
		date >> $DIR/README.md

		git -C $DIR reset HEAD^
		git -C $DIR add ./*
		git -C $DIR commit -m 'index'
	fi
fi
git -C $DIR push -f
