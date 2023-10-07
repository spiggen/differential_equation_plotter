function randx = reset_if_outofbounds(x_init, xmin, x, xmax)
if x < xmin || xmax < x
randx = x_init;
else
randx = x;
end
end