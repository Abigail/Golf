#!/opt/perl/bin/perl

use 5.026;

use strict;
use warnings;
no  warnings 'syntax';

use experimental 'signatures';

use Test::More;

my @solutions = <solution*.pl solution*.bc solution*.gawk solution*.awk>;
my @allinputs = grep {/^input[0-9]*(?:-(?:pl|bc|g?awk))?$/}
                grep {!/_by_line$/} <input*>;

foreach my $solution (@solutions) {
    diag ($solution) if @solutions > 1;
    my $type = $solution =~ s/.*\.//r;

    my @prog  = `cat $solution`;
    chomp @prog;

    my @options;
    my $is_bool;
    my %post_process;
    my %test_numbers;
    my $sets_tests;
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
        elsif ($key =~ /^Tests?$/) {
            $sets_tests = 1;
            $test_numbers {$_} = 1 for $args =~ /[0-9]+/g;
        }
    }

    my %seen;
    my @numbers = sort {$a <=> $b} 
                  grep {!$seen {$_} ++} map {/input([0-9]+)/} @allinputs;
    my @inputs;
    my @outputs;
    foreach my $number ("", @numbers) {
        next if $sets_tests && !$test_numbers {$number || 0};
        #
        # Select the right inputs
        #
        my $input  = -f "input$number-$type"      ? "input$number-$type"
                   : -f "input$number"            ? "input$number"
                   :                                "";
        my $output = -f "output$number-$type.exp" ? "output$number-$type.exp"
                   : -f "output$number.exp"       ? "output$number.exp"
                   :                                "";
        if (-f $input && -f $output) {
            push @inputs  => $input;
            push @outputs => $output;
        }
    }


    foreach my $i (keys @inputs) {
        my $input  = $inputs  [$i];
        my $output = $outputs [$i];
        my  $exp = `cat $output`;

        my  $pid = open my $child, "-|";
        die "Failed to fork: $!" unless defined $pid;
        if (!$pid) {
            if ($type eq 'pl') {
                exec "perl", @options, "./$solution", $input;
            }
            elsif ($type eq 'bc') {
                exec "bc ./$solution < $input"
            }
            elsif ($type eq 'awk' || $type eq 'gawk') {
                exec $type, @options, "-f", "./$solution", $input;
            }
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
            #
            # I have absolutely no fucking clue why 'chomp (@got)' nor
            # 'chomp (@exp)' isn't chopping off the new lines.
            #
            s/\n$// for @got;
            s/\n$// for @exp;
            if (@got < @exp) {
                push @got => (0) x (@exp - @got);
            }
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
