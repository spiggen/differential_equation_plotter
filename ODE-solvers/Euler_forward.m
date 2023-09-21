function [x,y] = Euler_forward(x,y, fcn, dt)
%if nargout(fcn) == 1
%x = x + delta_t;
%y = y + fcn(x,y)*delta_t;

%elseif nargout(fcn) == 2
[dxdt, dydt] = fcn(x,y);

x = x + dxdt*dt;
y = y + dydt*dt;

%end

end