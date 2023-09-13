function x_NaN = NaN_if_outofbounds(xmin,x,xmax)
if x < xmin || xmax < x
x_NaN = NaN;
else
x_NaN = x;
end
end