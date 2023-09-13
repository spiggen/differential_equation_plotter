function animate_field(fcn, method, xmin, xmax, ymin, ymax)

if exist("method", "var") == false
method = @Euler_forward;
end
if exist("xmax", "var") == false
xmax = 1;
end
if exist("ymin", "var") == false
ymin = 0;
end
if exist("ymax", "var") == false
ymax = 0;
end


serpendipity_theme();
%my_axes = uiaxes("XLim",[xmin xmax], "YLim",[ymin, ymax]);
p = axes();
serpendipity_theme(p);

my_field = particle_field(100,50,xmax, xmin, ymax, ymin);

recording_interval = 20;
plotting_interval = 20;
renewal_interval = 10;
iteration = 1;


while true

[my_field.x_positions, my_field.y_positions] = arrayfun( @(x,y) method(x,y, fcn), my_field.x_positions, my_field.y_positions);

if mod(iteration, recording_interval) == 0
my_field.record_trails();
end

if mod(iteration, plotting_interval) == 0
my_field.plot(p);
drawnow
end

if mod(iteration, renewal_interval) == 0
my_field.reset_random_trail();
end

iteration = iteration +1;
end

end