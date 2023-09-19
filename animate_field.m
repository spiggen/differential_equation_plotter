function animate_field(varargin)
method =  @(x,y,fcn)Euler_forward(x,y,fcn,dt = 0.001);
xmin = -1; xmax = 1;
ymin = -1; ymax = 1;
saving = false;
recording_interval = 10;
plotting_interval = 10;
renewal_interval = 5;
%gpuavailable = (gpuDeviceCount("available") > 1);


for index = 1:2:numel(varargin)
if varargin{index} == "Function"
fcn      = varargin{index + 1};
elseif varargin{index} == "ParticleField"
my_field = varargin{index + 1};
xmax     = my_field.x_max;
xmin     = my_field.x_min;
ymax     = my_field.y_max;
ymin     = my_field.y_min;
elseif varargin{index} == "Method"
method   = varargin{index + 1};
elseif varargin{index} == "XLim"
xmin     = varargin{index + 1}(1);
xmax     = varargin{index + 1}(2);
elseif varargin{index} == "YLim"
ymin     = varargin{index + 1}(1);
ymax     = varargin{index + 1}(2);
elseif varargin{index} == "SaveFilename"
filename = varargin{index + 1};
saving   = true;
elseif varargin{index} == "Axes"
myaxes   = varargin{index + 1};
elseif varargin{index} == "RecordingInterval"
recording_interval = varargin{index + 1};
elseif varargin{index} == "PlottingInterval"
plotting_interval = varargin{index + 1};
elseif varargin{index} == "RenewalInterval"
renewal_interval = varargin{index + 1};
end
end

if exist("myaxes",   "var") == false; myaxes = axes(); end
if exist("my_field", "var") == false 
my_field = particle_field(200, 50, xmax, xmin, ymax, ymin); 
end






while true
%if gpuavailable
[my_field.x_positions, my_field.y_positions] = arrayfun( @(x,y) method(x,y, fcn), my_field.x_positions, my_field.y_positions);
%else
%parfor index = 1:numel(my_field.x_positions)
%x_index = mod(index, width(my_field.x_positions))
%[my_field.x_positions(), my_field.y_positions] = arrayfun( @(x,y) parfeval(method(x,y, fcn), 2), my_field.x_positions, my_field.y_positions);
%end
%end


if mod(my_field.iteration_nr, recording_interval) == 0
my_field.record_trails();
my_field.recording_nr = my_field.recording_nr + 1;
end

if mod(my_field.iteration_nr, plotting_interval) == 0
my_field.plot(myaxes);
if saving
exportgraphics(myaxes, strrep(filename, ".png", string(my_field.render_nr)+".png"), ...
               'Resolution',        300, ...
               'BackgroundColor',   get(gca, "defaultfigurecolor"))

end
drawnow
my_field.render_nr = my_field.render_nr + 1;
end

if mod(my_field.iteration_nr, renewal_interval) == 0
my_field.reset_random_trail();
end

my_field.iteration_nr = my_field.iteration_nr + 1;
end

end