#!/usr/bin/perl

die "perl $0 <list> <db> <od>"unless @ARGV==3;
my($list,$db,$od)= @ARGV;
unless(-e $od){`mkdir $od`;}
`makeblastdb -dbtype nucl -in $db`;
open LIST,$list or die $!;
while(<LIST>){
	chomp;
	my $tmp = $_;
	my @tabs = split /\s+/;
	my $t = $tabs[0];
	my $sam = $tabs[1];
	print  "blastn -query $sam -db $db -num_threads 1 -evalue 1E-10 -num_alignments 1000000 -outfmt 6 >$od/$t.blastout \n";
	#print  "awk '{if(\$4>500) print \$0}' $t.blastout > $t.blastout2 \n\n";	

	#print  "awk '{if(\$3>99.9) print \$0}' $od/$t.blastout > $od/$t.blastout.filter \n\n";
}
close LIST or die $!; 
