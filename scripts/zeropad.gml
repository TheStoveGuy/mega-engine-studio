///zeropad(integer: real, digits: real)
// returns a string of the given integer, adding zeroes to left of the integer until it is at least as many digits as given.

var i,d,s;
i = argument0;
d = argument1;
s = string(floor(i))
while (string_length(s) < d)
    s = "0" + s

return s;
