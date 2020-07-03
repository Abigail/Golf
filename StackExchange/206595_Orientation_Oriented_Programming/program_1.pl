# No input:  In Honor of Adam West
# Integer:   Am I a Rude Number?
# String:    Don't google "google"
#                                           v
if(eof()){say+("11 *25 *\n7 4*10 *5 *10 4*" .
"\n5 4*12 7*12 4*\n3 6*12 7*12 6*\n2 9*9 9*".
"9 9*\n 47*\n49*\n49*\n49*\n 47*\n  5*7 21*".
"7 5*\n4 4*7 3*4 5*4 3*7 4*\n7 **7 *6 3*6 *".
"7 **\n")=~s/(\d+)(\D)/$2 x$1/gre}else{chomp(
$_=<>);if(/\D/){/^google/&&die;$_=length}else
{$_=sprintf"00%b",$_;$_=/00100(.{5})*$/?1:0}}
say;
