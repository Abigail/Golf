#!/opt/perl/bin/perl
#% Opt: -alp

use 5.026;

use strict;
use warnings;
no  warnings 'syntax';

use experimental 'signatures';

my @todo;

my %seen;
my $c = 0;

@todo = ([@F], [reverse @F]);
while (@todo) {
    $c ++;
    my $todo = shift @todo;
    my ($N, @list) = @$todo;
    if (!@list) {
        $seen {$N} ++;
        next;
    }
    #
    # Four cases to deal with
    #
    my @new = ([$N + $list [0],  @list [1 .. $#list]],
               [$N * $list [0],  @list [1 .. $#list]],
               [$N + $list [-1], @list [0 .. $#list - 1]],
               [$N * $list [-1], @list [0 .. $#list - 1]]);

    push @todo => @new;
}

$_ = keys %seen;

# printf "Size = %d; count = %d\n", scalar @F, $c;

__END__
