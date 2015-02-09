#!/bin/bash

if [ $# != 2 ]; then
	echo "Usage: `basename $0` userid ps"
	echo "Example: `basename $0` a12345678 1"
	exit
fi

ID=$1
PS=$2
TGT=ps${PS}/${ID}

# get deadline for PS
deadline=`grep ^ps${PS} deadlines | awk -F= '{print $2}'`

# clone the student's repo
git clone http://cs3217.comp.nus.edu.sg/${ID}/problem-set-${PS}.git $TGT

# move to the repo folder and do the following:
#  - get the SHA1 of the latest commit before the deadline
#  - create a "grading_branch" at that commit
#  - switch to that branch
cd $TGT
sha1=`git rev-list -n 1 --before="${deadline}" master`
git branch grading_branch $sha1
git checkout grading_branch

