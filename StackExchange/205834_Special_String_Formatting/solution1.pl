#% Opt: -nF//
pop @F if $F [-1] =~ /\n/;  # Header: Strip off newline, if any
%F = ();                    # Header: Reset %F for multi input
$F{$_}++for@F;$F{$_}&&print$_,$F{$_}xor$F{$_}=0for@F
;print"\n";                 # Footer: Print newline for between inputs
