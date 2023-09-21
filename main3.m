dt = 0.1;

fireflies()
myaxes = axes();
fireflies()
%set(gcf,'units','normalized','outerposition',[0 0 1 1]);
my_field_2 = particle_field(150, 50, 10, -10, 5, -5);
%my_field.iteration_nr = 1;
%my_field.recording_nr = 1;
%my_field.render_nr    = 1;

animate_field("ParticleField",     my_field_2, ...
              "Function",          @diff_eq1, ...
              "Method",            @(x,y,fcn)RK4(x,y,fcn,dt), ...
              "Axes",              myaxes, ...
              "PlottingInterval",  1, ...
              "RecordingInterval", 1, ...
              "RenewalInterval",   1);




function [dxdt, dydt] = diff_eq1(x,y)
dydt = sin(x) - 0.3*y;
dxdt = y;
end
