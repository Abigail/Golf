#% Opt: -anl
#% Opt: -M5.010
$c=0;
for(1..$_){for$y(1..$F[1]){($_+$y)%5||$c++}}say$c
