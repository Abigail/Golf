# No input:  1, 2, Fizz, 4, Buzz
# Integer:   You're on a 8 day streak!
# String:    -
#                                                     v
if(eof()){say$_%15?$_%5?$_%3?$_:Fizz:Buzz:FizzBuzz for
1..100;exit}say<>=~/^8|^1[18](...)*$/?an:a
