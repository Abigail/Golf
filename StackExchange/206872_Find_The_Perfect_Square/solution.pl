#!/opt/perl/bin/perl
#% Opt: -MList::Util=max
#% Opt: -pl
$n=$_;$_=max grep!($n%$_**2),1..$n
