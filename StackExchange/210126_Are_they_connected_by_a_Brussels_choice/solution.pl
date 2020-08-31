#% Opt: -Mfeature=say
#% Opt: -na
#% Boolean:
($_,$n)=@F;m[.+(?{say$=if$n eq$`.($&/2).$'||$n eq$`.($&*2).$'})(?!)]
