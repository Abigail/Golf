# No input:  Count up forever
# Integer:   Is this number a prime?
# String:    YouTube Comments #1
if(eof()){{say++$_;redo}}
else{$_=<>;chomp;if(/\D/)
{/^.+?(?{say$&})(?!)/;/^(
..*).(?{say$1})(?!)/x}else
{$p=$_>1;$n=$_;$p&&=$n%$_
for 2..$n-2;say!!$p}}
