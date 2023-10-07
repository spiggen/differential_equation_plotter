function grid = transformation_plot(fcn, varargin)
translation = true;
create_grid = true;
for index = 1:2:numel(varargin)
if varargin{index} == "translation"
translation = varargin{index + 1};
elseif varargin{index} == "grid"
create_grid = false;
grid = varargin{index + 1};
x_horizontal = grid{1};
y_horizontal = grid{2};
x_vertical   = grid{3};
y_vertical   = grid{4};
end
end

if create_grid
[x_horizontal, y_horizontal] = meshgrid(0:10, linspace(0,10,100));
[y_vertical,   x_vertical]   = meshgrid(0:10, linspace(0,10,100));
end

[x_horizontal_transformed, y_horizontal_transformed] = arrayfun(fcn, x_horizontal, y_horizontal);
[x_vertical_transformed,   y_vertical_transformed]   = arrayfun(fcn, x_vertical,   y_vertical);

if translation
x_horizontal_transformed = x_horizontal + x_horizontal_transformed;
y_horizontal_transformed = y_horizontal + y_horizontal_transformed;
x_vertical_transformed   = x_vertical   + x_vertical_transformed;
y_vertical_transformed   = y_vertical   + y_vertical_transformed;
end


for i = 0:0.05:1
factor = 2*i^2*(1-0.5*i^2);

plot(x_horizontal, y_horizontal, ...
     x_vertical,   y_vertical,   ...
     x_horizontal - (x_horizontal - x_horizontal_transformed)*factor, ...
     y_horizontal - (y_horizontal - y_horizontal_transformed)*factor, ...
     x_vertical   - (x_vertical   - x_vertical_transformed  )*factor, ...
     y_vertical   - (y_vertical   - y_vertical_transformed  )*factor)

drawnow

end

grid = {x_horizontal_transformed, y_horizontal_transformed, x_vertical_transformed, y_vertical_transformed};

end