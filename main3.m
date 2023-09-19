dt = 0.0002;


myaxes = axes();
borealis()
set(gcf,'units','normalized','outerposition',[0 0 1 1]);
my_field_2 = particle_field(200, 100, 10, -10, 5, -5);
%my_field.iteration_nr = 1;
%my_field.recording_nr = 1;
%my_field.render_nr    = 1;

animate_field("ParticleField",     my_field_2, ...
              "Function",          @diff_eq1, ...
              "Method",            @(x,y,fcn)Euler_forward(x,y,fcn,dt), ...
              "Axes",              myaxes, ...
              "PlottingInterval",  100, ...
              "RecordingInterval", 100);




function [dxdt, dydt] = diff_eq1(x,y)
dydt = -(4*x^3)/(y^2);
dxdt = 1;
end
