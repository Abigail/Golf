#% Opt: -M5.010
@a=map{[s/ /0/gr=~/./g,0]}<>;push@a,[(0)x@{$a[0]}];for$y(0..$#a-1){for$x(0..$#{$a[0]}-1){if($a[$y][$x]){$h=$a[$y][$x+1]&&!$a[$y][$x-1];$v=$a[$y+1][$x]&&!$a[$y-1][$x];$c++if$h||$v;if($h){print" $c. ";$i=$x;print$a[$y][$i-1]while$a[$y][$i++]}push@v,[$c,$y,$x]if$v}}}say;for(@v){($c,$y,$x)=@$_;print" $c. ";$i=$y;print$a[$i-1][$x]while$a[$i++][$x]}say
