@b=map{[/\d/g]}<>;for$x(@a=keys@b){for$z(@a){for$y(@c=keys@{$b[0]}){for$w(@c){$t||=$b[$x][$y]&&$b[$z][$w]&&abs($x-$z)+abs($y-$w)<7&&($x!=$z||$y!=$w)}}}}say$t
