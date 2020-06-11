#% Opt: -M5.010
#% Opt: -n
#% Post: space
$k=2*$_;@m=(D,L,R,U);y=D====y=U==&&y=R====y=L==&&!/.+(??{!($&=~y=D====$&=~y=U==&&$&=~y=R====$&=~y=L==&&y===c-length$&)})/&&say for map{sprintf("%0$k".b,$_)=~s/../'$m['."0b$&]"/geer}0..4**$_
