function animate_field(varargin)
method =  @(x,y,fcn)Euler_forward(x,y,fcn,dt = 0.001);
xmin = -1; xmax = 1;
ymin = -1; ymax = 1;
writing_video = false;
gpuavailable = (gpuDeviceCount("available") > 1);


for index = 1:2:numel(varargin)
if varargin{index} == "Function"
fcn     = varargin{index + 1};
elseif varargin{index} == "Method"
method  = varargin{index + 1};
elseif varargin{index} == "XLim"
xmin    = varargin{index + 1}(1);
xmax    = varargin{index + 1}(2);
elseif varargin{index} == "YLim"
ymin    = varargin{index + 1}(1);
ymax    = varargin{index + 1}(2);
elseif varargin{index} == "VideoWriter"
vid_obj = varargin{index + 1};
writing_video = true;
elseif varargin{index} == "Axes"
myaxes  = varargin{index + 1};
end
end

if exist("myaxes", "var") == false; myaxes = axes(); end





my_field = particle_field(200,50,xmax, xmin, ymax, ymin);

recording_interval = 20;
plotting_interval = 20;
renewal_interval = 10;
iteration = 1;


while true
%if gpuavailable
[my_field.x_positions, my_field.y_positions] = arrayfun( @(x,y) method(x,y, fcn), my_field.x_positions, my_field.y_positions);
%else
%parfor index = 1:numel(my_field.x_positions)
%x_index = mod(index, width(my_field.x_positions))
%[my_field.x_positions(), my_field.y_positions] = arrayfun( @(x,y) parfeval(method(x,y, fcn), 2), my_field.x_positions, my_field.y_positions);
%end
%end


if mod(iteration, recording_interval) == 0
my_field.record_trails();
end

if mod(iteration, plotting_interval) == 0
my_field.plot(myaxes);
if writing_video
exportgraphics(myaxes,'frame.png','Resolution',300)
writeVideo(vid_obj,imread("frame.png"));
end
drawnow
end

if mod(iteration, renewal_interval) == 0
my_field.reset_random_trail();
end

iteration = iteration +1;
end

end