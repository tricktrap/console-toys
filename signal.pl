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
my @chars = ("A".."Z", "a".."z", '0'..'9', ' ');
my $rate_max = .05;
my $rate = rand $rate_max;

my $oldcol = -1;
my $iterations = 0;
while (1) {
  if ($iterations > 100) {
    $rate = rand $rate_max;
    $iterations = 0;
  }
  $t += $rate;
  my $col = int(((signal($t) + 1) / 2) * $signal_columns);

  #my $char = ( $oldcol < $col ? '\\' : ( $oldcol > $col ? '/' : '|'));
  my $char = $chars[rand @chars];
  $oldcol = $col;

  my $leading_columns   = ($col-1);
  my $trailing_columns  = ($signal_columns - $leading_columns - 1);
  my $signal_str = (" " x $leading_columns) . $char . (" " x $trailing_columns) . "|";

  my $random_str = "";
  $random_str .= $chars[rand @chars] for 1..$text_columns;

  my $str = $signal_str . $random_str . "\n";

  print $str;
  usleep(1000);
  ++$iterations;
}