dt = 0.001;
serpendipity_theme()

animate_field(@diff_eq1, @(x,y,fcn)Euler_forward(x,y,fcn,dt), ...
              -10,10,-10,10)



function [dxdt, dydt] = diff_eq1(x,y)

dxdt = y-x^2 - y^2;
dydt = x*y -y;

end

