perl -M5.010 -MYAML -nE '$;=$1 if s/\[(\w+)\] +//;$;{$;}.=$_}{say for%' < input
