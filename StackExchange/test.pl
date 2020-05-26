#!/opt/perl/bin/perl

use 5.026;

use strict;
use warnings;
no  warnings 'syntax';

use experimental 'signatures';

use Test::More;

my @solutions = <solution*.pl>;

foreach my $solution (@solutions) {
    diag ($solution) if @solutions > 1;

    my @prog  = `cat $solution`;
    chomp @prog;

    my @options;

    foreach (@prog) {
        next unless /#%\s*/p;
        if (${^POSTMATCH} =~ /(?:Opt|O):\s*/p) {
            push @options => ${^POSTMATCH};
        }
    }

    foreach my $input (<input*>) {
        my ($ext) = $input =~ /^input(.*)/;
        my  $exp_output = "output$ext.exp";
        my  $exp = `cat $exp_output`;

        my  $pid = open my $child, "-|";
        die "Failed to fork: $!" unless defined $pid;
        if (!$pid) {
            exec "perl", @options, "./$solution", $input;
            die "Failed to exec: $!";
        }
        #
        # Parent
        #
        local $/;
        my $got = <$child>;

        is  $got, $exp, "Test: $input";
    }
}

done_testing;

exit;

__END__
