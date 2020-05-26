#% Opt: -MList::Util=max
#% Opt: -MList::Util=uniq
#% Opt: -pl
@==map{y===c}sprintf("%b",$_)=~/0+/g;$_=(@===max@=)&&(@===uniq@=)?0+@=:0
