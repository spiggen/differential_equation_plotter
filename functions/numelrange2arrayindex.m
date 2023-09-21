function [xindex, yindex] = numelrange2arrayindex(index, xsize, ysize)

xindex = mod(index-1, xsize)+1;
yindex = floor((index-1)/ysize) + 1;

end