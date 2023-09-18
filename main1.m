dt = 0.001;

my_vidwriter = VideoWriter("flowfield1.avi");
myaxes = axes();
borealis();
set(gcf,'units','normalized','outerposition',[0 0 1 1])

open(my_vidwriter);

animate_field("Function", @diff_eq1, ...
              "Method", @(x,y,fcn)Euler_forward(x,y,fcn,dt), ...
              "XLim", [-10, 10], ...
              "YLim", [-5, 5], ...
              "VideoWriter", my_vidwriter, ...
              "Axes", myaxes);


function [dxdt, dydt] = diff_eq1(x,y)

dydt = sin(x);
dxdt = y;


end

