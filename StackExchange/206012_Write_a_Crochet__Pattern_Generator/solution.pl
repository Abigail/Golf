#% Opt: -M5.010
#% Opt: -a
#% Post: none
say"Row $_: \\*$F[1] in next ${\($_-2)} stitches, 2 $F[1] in next stitch\\* $F[2] times (${\($_*$F[2])} stitches)."for 1..$_
