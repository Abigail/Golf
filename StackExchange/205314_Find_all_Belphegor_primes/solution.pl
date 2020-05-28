#% Opt: -M5.010
#% Opt: -Mexperimental 'signatures'
#% Opt: -Mbigint
sub p($m=3){$m>=$_||($_%$m&&p($m+2))}$_=16661;{p&&say;s/6+/0$&0/;redo}
