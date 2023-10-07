addpath("Matlab-drive\differential_equation_plotter\colorthemes\")
addpath("Matlab-drive\differential_equation_plotter\functions\")
addpath("Matlab-drive\differential_equation_plotter\ODE-solvers\")
addpath("Matlab-drive\Spiggen_s Matlab toolbox _3")

global mymatrix
mymatrix = rand(2,2)*0.7


figure(1)
axes1 = axes();
fireflies("ColorSamples", 50)
axis("equal")
mygrid = transformation_plot(@pol2cart, ...
                             "translation", false)


fireflies("ColorSamples", 50)
axis("equal")
transformation_plot(@cart2pol, ...
                    "grid", mygrid, ...
                    "translation", false)







function [dxdt, dydt] = diff_eq1(x,y)
dxdt = 0.3*y;
dydt = 0.3*(sin(x) - 0.3*y);
end


function [dxdt, dydt] = diff_eq1_jacobian(x,y)
mymatrix = [ 0       1;
            cos(x)  -0.3]*0.3;

outvec = mymatrix*[x;y];
dxdt = outvec(1);
dydt = outvec(2);
end


function [dxdt, dydt] = diff_eq2(x,y)
global mymatrix
outvec = mymatrix*[x;y];
dxdt = outvec(1);
dydt = outvec(2);
end

function [dxdt, dydt] = diff_eq3(x,y)

dxdt = 0.3*(-y);
dydt = 0.3*(-y-x*(x-1));
end


function [dxdt, dydt] = diff_eq3_jacobian(x,y)
mymatrix = [ 0      -1;
            -2*x+1  -1]*0.3;

outvec = mymatrix*[x;y];
dxdt = outvec(1);
dydt = outvec(2);
end


function [dxdt, dydt] = diff_eq4(x,y)

dxdt = x;
dydt = -y^2-x*(x-1);
end


function [dxdt, dydt] = diff_eq5(x,y)

dxdt = 1;
dydt = 1;
end


function [dxdt, dydt] = diff_eq6(x,y)

dxdt = x^3-x;
dydt = 0;
end



function [dxdt, dydt] = diff_eq6_jacobian(x,y)
mymatrix = [ 0        1;
            3*x^2-1   0]*0.01;

outvec = mymatrix*[x;y];
dxdt = outvec(1);
dydt = outvec(2);
end


function [x, y] = transformation1(theta,r)

x = r*cos(theta);
y = r*sin(theta);
end

function [r, theta] = transformation2(x,y)

r = sqrt(x^2 + y^2);
theta = atan(y/x);
end