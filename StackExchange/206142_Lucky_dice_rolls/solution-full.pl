#!/opt/perl/bin/perl
#% Opt: -lap
#% Opt: -MList::Util=sum

use 5.026;

use strict;
use warnings;
no  warnings 'syntax';

my ($n, $k, $luck) = @F;

my @a = map {         # Iterate over all possible rolls
    my @b = sort {$a <=> $b} /\d+/g;  # Grab the digits, sort them.
    pop @b for $luck .. -1;           # Remove the -luck best rolls.
    shift @b for 1 .. $luck;          # Remove the  luck worst rolls.
    sum @b;                           # Sum the remaining pips.
}
glob       #  Glob expansion (as the shell would do)
join ",",  #  Separate the results of each die in a roll.
           #  Almost any character will do, as long as it's
           #  not special for glob expansion, and not a digit
     (
        "{" .      # "{" introduces a set of things glob can choose from
            join (",", 1 .. $k) .   # 1 to number of faces
         "}"       # matching "}"
     ) x ($n + abs $luck);  # Number of dice in a roll

$_ = sum (@a) / @a;  # Sum the results of each different roll,
                     # and divide by the number of rolls; $_ is
                     # printed at the end of the program.

__END__
