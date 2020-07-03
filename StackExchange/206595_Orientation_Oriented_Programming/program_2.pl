# No input:  "Hello, World!"
# Integer:   It's my Birthday :D
# String:    No A, just CAPS LOCK
#                                           v
if(eof()){$_="Hello, World!"}else{$_=<>;chomp
;if(/^-?\d+$/){if($_){$x=1+2*($_<0?1:$_);@x=(
' $'x$_,' |'x$_,'-'x$x,'~'x$x,'-'x$x);$_=join
$/,grep$_,@x}else{$_="Congratulations on yo".
"ur new baby! :D"}}else{s[a([^aA]*)a?] #
[$1=~y,a-zA-Z,A-Za-z,r]ige}};say;
