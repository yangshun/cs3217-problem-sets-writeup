#!/usr/bin/perl

die ("usage: $0 ps") if (@ARGV != 1);

$PS = shift;

# load grading template
$grading_template_file = "grading_templates/ps${PS}.txt";
$template = `cat $grading_template_file`;

# load matric no to userid mapping
%matric2userid = ();
$matric2userid_file = "students.list";
open(FILE, $matric2userid_file) or die ("Cannot open $matric2userid_file to read!");
while (<FILE>) {
	chop;
	($matric, $userid) = split(" ");
	$matric2userid{$matric} = $userid;
}
close(FILE);

# load grades in tsv format
$grades_file = "grades/ps1.tsv";
open(FILE, $grades_file) or die ("Cannot open $grades_file to read!");;
while (<FILE>) {
	chop;
	next if (/^S/); # skip the first line
	@values = split("\t");
	$matric = $values[1];
	$userid = $matric2userid{$matric};
	next if (!defined($userid)); # skip the student not in 'students.list'
	$grades = $template;
	# replace placeholders with actual values
	for ($i=0; $i<@values; $i++) {
		$value = $values[$i];
		$grades =~ s:\{$i\}:$value:g;
	}
	
	# output filled template to respective repo
	$output_dir = "ps${PS}/${userid}"; 
	`mkdir -p $output_dir`;
	$output_file = "${output_dir}/grading_report.txt";
	open(OFILE, ">$output_file") or die("Cannot open $output_file to write!");
	print OFILE "$grades";
	close(OFILE);
	print "Grade report written to $output_file.\n";
}
close(FILE);

