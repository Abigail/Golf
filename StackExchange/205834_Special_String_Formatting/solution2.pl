#% Opt: -p
s/./$&1/g;1while s/(\D)\K(\d+)(.*)\1\d/($2+1).$3/e
