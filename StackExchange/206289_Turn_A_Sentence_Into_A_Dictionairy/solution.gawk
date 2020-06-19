#% Opt: -F[^a-zA-Z]+
#% Post: space
{for(i=1;i<=NF;i++){if($i!=""){a[tolower($i)]=1}}n=asorti(a,b);for(j=1;j<=n;j++){print b[j]}}
