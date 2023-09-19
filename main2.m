dt = 0.002;


myaxes = axes();
borealis()
set(gcf,'units','normalized','outerposition',[0 0 1 1]);
%my_field = particle_field(200, 100, 10, -10, 5, -5);
%my_field.iteration_nr = 1;
%my_field.recording_nr = 1;
%my_field.render_nr    = 1;

animate_field("ParticleField", my_field, ...
              "Function",      @diff_eq1, ...
              "Method",        @(x,y,fcn)Euler_forward(x,y,fcn,dt), ...
              "Axes",          myaxes, ... 
              "SaveFilename",  "C:\Users\jonas\OneDrive - KTH\Matlab-drive\differential_equation_plotter\frames\pendelum.png");




function [dxdt, dydt] = diff_eq1(x,y)
dydt = sin(x) - 0.3*y;
dxdt = y;
end
