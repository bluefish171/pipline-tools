#!/usr/bin/perl
die "perl $0 <clean.list>"unless #$ARGV==1;
my($list) = @ARGV;

open LIST,$list or die $!;
while(<LIST>){
chomp;
my @tabs =split /\//;
my $sms = $tabs[-1];
my @tms = split /\./,$sms;
print "$tms[0]\t$_\n";

}
close LIST or die $!;
