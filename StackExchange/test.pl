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
    my %post_process;
    my $size = 0;

    foreach (@prog) {
        $size += length unless /#(?:%|\s*Header|\s*Footer)/;
        next unless /#%\s*/p;
        my $info = ${^POSTMATCH};
        my ($key, $args) = $info =~ /^([^:]+):\s*(.*)/;
        $args =~ s/\s+$//;
        if ($key =~ /^O(?:pt)?$/) {
            push @options => $args;
        }
        elsif ($key =~ /^B(?:ool(?:ean)?)?$/) {
            $is_bool = 1;
        }
        elsif ($key =~ /^P(?:ost)?$/) {
            $post_process {lc $args} = 1;
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

        my (@exp, @got);

        if ($post_process {space}) {
            #
            # Compare as if everything is space separated
            #
            $exp =~ s/\s+$//;
            $got =~ s/\s+$//;
            @exp = join " ", split /\s+/ => $exp, -1;
            @got = join " ", split /\s+/ => $got, -1;
        }
        elsif ($post_process {none}) {
            @exp = $exp;
            @got = $got;
        }
        else {
            #
            # Line by line
            #
            chomp (@exp = split /\n/ => $exp, -1);
            chomp (@got = split /\n/ => $got, -1);
        }

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

    diag "Size = $size";
}

done_testing;

exit;

__END__
