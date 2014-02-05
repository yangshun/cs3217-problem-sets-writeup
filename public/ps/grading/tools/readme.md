Tools for Grading
=================

1. Create students.list to contain a list of students you are grading. Each line has two items separated by whitespace (matric no, GitLab userid). Example provided.
2. Run ./pull.all.sh (1|2|3|4|5) to clone the respective ps repos of all the students in the list and create a grading branch based on the latest commit before the deadline.
3. Download grade sheet in tsv format and save as grades/ps{1,2,3,4,5}.tsv
4. Run ./tsv2txt.pl (1|2|3|4|5) to generate grade reports for all the students in students.list. The report (grade_report.txt) will be generated in respective git repo folder (but not git-added).

