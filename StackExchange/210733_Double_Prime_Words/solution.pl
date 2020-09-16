#% Opt: -MList::Util=sum
#% Opt: -Mfeature=say
#% Opt: -pl
#% Bool:
s/[^a-z]//gi;$m=sum map-64+ord,split//,uc;$_=(1 x y===c)!~/^(11+)\1+$|^1$/&&(1x$m)!~/^(11+)\1$/
