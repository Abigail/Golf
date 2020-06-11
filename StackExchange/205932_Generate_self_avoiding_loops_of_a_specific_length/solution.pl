#% Opt: -M5.010
#% Opt: -n
#% Post: space
$k=2*$_;%m=qw[00 D 01 L 10 R 11 U];y=D====y=U==&&y=R====y=L==&&!/.+(??{!($&=~y=D====$&=~y=U==&&$&=~y=R====$&=~y=L==&&y===c-length$&)})/&&say for map{sprintf("%0$k".b,$_)=~s/../$m{$&}/gr}0..4**$_
