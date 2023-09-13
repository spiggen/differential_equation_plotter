function randx = rand_if_outofbounds(xmin, x, xmax)
if x < xmin || xmax < x
randx = rand(1)*(xmax-xmin) + xmin;
else
randx = x;
end
end