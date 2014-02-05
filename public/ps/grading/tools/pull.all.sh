#!/bin/bash

if [ $# != 1 ]; then
	echo "Usage: `basename $0` ps"
	echo "Example: `basename $0` 1"
	exit
fi

PS=$1

# students.list should contain a list of students' matric no and GitLab userid to be checked out
for i in `awk '{print $2}' students.list`; do
	echo $i;
	./pull.sh $i $PS
done

