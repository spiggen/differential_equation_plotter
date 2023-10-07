addpath("Matlab-drive\differential_equation_plotter\colorthemes\")
addpath("Matlab-drive\differential_equation_plotter\functions\")
addpath("Matlab-drive\differential_equation_plotter\ODE-solvers\")
addpath("Matlab-drive\Spiggen_s Matlab toolbox _3")


dt = 0.001;

global mymatrix
mymatrix = (rand(2) - rand(2))*rand(1)*10


myaxes = axes();

fireflies("ColorSamples", 100, "Figures", myaxes)

%set(gcf,'units','normalized','outerposition',[0 0 1 1]);
my_field_2 = particle_field(100, 100, 10, -10, 5, -5);
my_field_2.reset_to_rand = true;
%my_field.iteration_nr = 1;
%my_field.recording_nr = 1;
%my_field.render_nr    = 1;

animate_field("ParticleField",     my_field_2, ...
              "Function",          @diff_eq2, ...
              "Method",            @(x,y,fcn)RK4(x,y,fcn,dt), ...
              "Axes",              myaxes, ...
              "PlottingInterval",  50, ...
              "RecordingInterval", 50, ...
              "RenewalInterval",   50);




function [dxdt, dydt] = diff_eq1(x,y)
dydt = sin(x) - 0.3*y;
dxdt = y;
end


function [dxdt, dydt] = diff_eq2(x,y)
global mymatrix
outvec = mymatrix*[x;y];
dxdt = outvec(1);
dydt = outvec(2);
end

function [dxdt, dydt] = diff_eq3(x,y)

dxdt = -y;
dydt = -y-x*(x-1);
end