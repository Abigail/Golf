#% Opt: -M5.010
#% Opt: -a
$"=$,=0;
$:=1;{($;=$F[$,])?do{$:=-$:,$;=1 if$;==3;$"++;$F[$,]=0;$,=($,+$;*$:)%@F;redo}:say$"}