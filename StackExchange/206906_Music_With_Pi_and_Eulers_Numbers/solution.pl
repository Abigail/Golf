#% Opt: -MMath::BigFloat
#% Opt: -Mfeature=say
#% Opt: -pl
#% Post: none
$n=$_;$p=new Math::BigFloat;$p->accuracy(500);$_=$p->bpi;s/..//;s!.!'('.substr(CDEFGABCDE,$&,1).("'"x($&>6)).', '.((substr 7182818284,$&,1)/4).")\n"!eg;/(.+\n){$n}/;$_=$&
