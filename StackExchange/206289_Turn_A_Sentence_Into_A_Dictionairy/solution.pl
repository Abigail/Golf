#% Opt: -MList::Util=uniq
#% Opt: -n
#% Opt: -Mfeature=say
#% Post: space
say for sort@e=uniq lc=~/\pL+/g
