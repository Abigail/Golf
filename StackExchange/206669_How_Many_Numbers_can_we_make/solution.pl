#% Opt: -alp
%s = ();  # Header
@t=([@F],[reverse @F]);while(@t){($N,@l)=@{shift@t};@l?push@t,([$N+$l[0],@l[1..$#l]],[$N*$l[0],@l[1..$#l]],[$N+$l[-1],@l[0..$#l-1]],[$N*$l[-1],@l[0..$#l-1]]):$s{$N}++}$_=keys%s
