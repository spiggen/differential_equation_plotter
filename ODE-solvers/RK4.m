function [x,y] = RK4(x,y, fcn, dt)


[dxdt1, dydt1] = fcn(x, y);
[dxdt2, dydt2] = fcn(x + dxdt1*dt/2, y + dydt1*dt/2);
[dxdt3, dydt3] = fcn(x + dxdt2*dt/2, y + dydt2*dt/2);
[dxdt4, dydt4] = fcn(x + dxdt3*dt,   y + dydt3*dt);

x = x + dt*(dxdt1 + dxdt2*2 + dxdt3*2 + dxdt4)/6;
y = y + dt*(dydt1 + dydt2*2 + dydt3*2 + dydt4)/6;

end