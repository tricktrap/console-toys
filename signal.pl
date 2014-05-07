#!/usr/bin/perl -w
use strict;
use warnings;
use Time::HiRes qw(usleep);

sub signal {
  my ($t) = @_;

  my $y = sin($t) + rand(.2) - .1;

  return ($y < -1 ? -1 : ($y >= 1 ? 1 : $y));
}

my $t = 0;
my $signal_columns = 70;
my $text_columns = 40;

while (1) {
  $t += .01;
  my $col = int(((signal($t) + 1) / 2) * $signal_columns);

  my $leading_columns   = ($col-1);
  my $trailing_columns  = ($signal_columns - $leading_columns - 1);
  my $signal_str = (" " x $leading_columns) . '*' . (" " x $trailing_columns) . "|";
  my @chars = ("A".."Z", "a".."z");

  my $random_str = "";
  $random_str .= $chars[rand @chars] for 1..$text_columns;

  my $str = $signal_str . $random_str . "\n";

  print $str;
  usleep(1000);
}