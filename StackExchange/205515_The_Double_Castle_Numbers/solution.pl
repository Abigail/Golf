#% Opt: -alp
#% Opt: -Mbigint
$o = 0;
($m,$n,$a,$B)=@F;$o=$o*$B+$_ for(($a)x$m,$a-1)x2,($a)x$m,(($a)x$n,$a-1)x2,($a)x$n;$_=$o
__END__
