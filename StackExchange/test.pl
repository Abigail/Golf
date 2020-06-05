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
    my $is_bool;

    foreach (@prog) {
        next unless /#%\s*/p;
        my $info = ${^POSTMATCH};
        if ($info =~ /(?:Opt|O):\s*/p) {
            push @options => ${^POSTMATCH};
        }
        elsif ($info =~ /(?:Boolean|Bool|B):\s*/p) {
            $is_bool = 1;
        }
    }

    foreach my $input (<input*>) {
        my ($ext) = $input =~ /^input(.*)/;
        next if $ext eq "_by_line";
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

        chomp (my @exp = split /\n/ => $exp, -1);
        chomp (my @got = split /\n/ => $got, -1);

        if ($is_bool) {
            @exp = map {$_ ? 1 : 0} @exp;
            @got = map {$_ ? 1 : 0} @got;
        }

        subtest "Test: $input", sub {
            foreach my $i (keys @exp) {
                is $got [$i], $exp [$i], "Line: " . $i;
            }
            is scalar @got, scalar @exp, "Expected number of outputs"
        }
    }
}

done_testing;

exit;

__END__
