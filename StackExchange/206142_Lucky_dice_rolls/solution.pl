#v Opt: -lap
#% Opt: -MList::Util=sum
@,=map{@;=sort{$a<=>$b}/\d+/g;pop@;for$F[2]..-1;shift@;for 1..$F[2];sum @;}glob join",",("{".join(",",1..$F[1])."}")x($_+abs$F[2]);$_=sum(@,)/@,
