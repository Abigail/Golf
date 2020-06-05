#% Opt: -M5.010
#% Opt: -a
#% Post: Space
@F{@F}=@F;{$d=abs($F[0]-$F[1]);$F{$d}++or$F[@F]=$d;say shift@F;@F>1&&redo}say@F
