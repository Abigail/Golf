#!/opt/perl/bin/perl
#% Opt: -n
#% Post: space

use 5.026;

use strict;
use warnings;
no  warnings 'syntax';

use experimental 'signatures';

my $k = 2 * $_;
my %m = qw [00 D 01 L 10 R 11 U];

y/D// == y/U//  &&   # Does $_ contain as many D's as U's ?
y/R// == y/L//  &&   # Does $_ contain as many R's as L's ?
!/.+                 # Grab a substring
  (??{               # Code block, result is seen a pattern
       !(            # Negate what follows, if true, the result is ""
                     #     and "" will always match
                     #                      if false, the result is 1,
                     #     and since the string does not contain a 1,
                     #     the match will fail
         $& =~ y!D!! == $& =~ y!U!!  && # Does the substring contain as many
                                        # D's as U's?
         $& =~ y!R!! == $& =~ y!L!!  && # Does the substring contain as many
                                        # R's as L's?
         y!!!c - length ($&)            # Is this a proper substring?
                                        # y!!!c is a funny way getting the
                                        # length of $_, saving 1 byte over
                                        # using length, and if the lengths
                                        # are unequal, subtracting them is
                                        # a true value
       )})/x    &&   # if all conditions are met
say                  # print the results
for                  # do this for each
map {
    sprintf ("%0$k" . "b", $_)          # Get the binary representation 
    =~ s/../$m{$&}/gr                   # And replace pairs of digits
                                        # with directions
} 0 .. 4 ** $_;      # Range of numbers
                                        

__END__
