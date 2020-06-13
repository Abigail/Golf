#!/opt/perl/bin/perl
#% Post: none

use 5.028;

use strict;
use warnings;
no  warnings 'syntax';

use experimental 'signatures';
use experimental 'lexical_subs';

my ($rows, $type, $amount) = split ' ' => <>;

say "Row $_: \\*$type in next ${\($_ - 2)} stitches, " .
"2 $type in next stitch\\* $amount times (${\($_ * $amount)} stitches)."
for 1 .. $rows;

__END__
