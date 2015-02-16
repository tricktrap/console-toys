#!perl
# Calculates Pi using Monte Carlo method

my $trials = 0;
my $hits   = 0;

my $pi     = 0.0;

while(1) {
  my $x = (rand 2) - 1;
  my $y = (rand 2) - 1;

  if ($x * $x + $y * $y < 1) {
    ++$hits;
  }
  $trials += 1;

  $pi = $hits * 4.0 / $trials;

  printf("%.8f %8.d %8.d %.8f %.8f\n", $pi, $trials, $hits, $x, $y);
}
