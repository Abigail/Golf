# No input:  Build me a brick wall!
# Integer:   Do you want to code a snowman
# String:    -
#                                                     v
if(eof()){$_=("___|"x18).$/;$_ x=2;s/^..|..$//g;$_ x=5}
else{@c=map{$_-1}<>=~/./g;$_=$".(""," ___","  _"," ___"
)[$c[0]].$/.$".("_===_","....."," /_\\","(_*_)")[$c[0]]
.$/.($","\\",$",$")[$c[4]]."(".(".","o","O","-")[$c[2]]
.(",",".","_",$")[$c[1]].(".","o","O","-")[$c[3]].")".(
$","/",$",$")[$c[5]].$/.("<",$","/",$")[$c[4]]."(".($".
": ","] [","> <","   ")[$c[6]].")".(">",$","\\",$")[$c[
5]]."\n (".(" : ",'" "',"___","   ")[$c[7]].")"}say
