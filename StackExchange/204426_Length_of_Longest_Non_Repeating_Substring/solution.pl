#% Opt: -ln
#% Opt: -Mfeature=say
#% Opt: -MList::Util=max
@& = ();   # Header
m;.+(??{$&=~/(.).*\1/||push@&,length$&})(?!);;say max@&
