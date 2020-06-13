#!/opt/perl/bin/perl
#% Opt: -pl

use 5.028;

use strict;
use warnings;
no  warnings 'syntax';

use experimental 'signatures';
use experimental 'lexical_subs';

s!  \D+                |
    \d+(?:[.:^e/]\d+)+ |
   (\d+)
 ! $1 ? "*" . (0 + $1) : ""
 !exg;


$_ = eval "1$_";


__END__
