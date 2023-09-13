function [x,y] = Euler_forward(x,y, fcn, delta_t)
%if nargout(fcn) == 1
%x = x + delta_t;
%y = y + fcn(x,y)*delta_t;

%elseif nargout(fcn) == 2
[delta_x, delta_y] = fcn(x,y);

x = x + delta_x*delta_t;
y = y + delta_y*delta_t;

%end

end