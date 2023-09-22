function fireflies(varargin)

for arg_nr = 1:2:numel(varargin)
if varargin{arg_nr} == "ColorSamples"
number_of_points = varargin{arg_nr + 1};
end
end

if exist("number_of_points", "var") == false; number_of_points = 100; end



background_color_1 = [15  0 20]/255;
background_color_2 = [15  0 20]/255;
axis_color         = [150 0 150]/255;

new_colormap       = [
                      linspace(255,    255, round(number_of_points*0.2))' ...
                      linspace(255,    0,   round(number_of_points*0.2))' ...
                      linspace(100,    0,   round(number_of_points*0.2))';

                      linspace(255,    70,  round(number_of_points*0.6))' ...
                      linspace(0,      0,   round(number_of_points*0.6))' ...
                      linspace(0,      220, round(number_of_points*0.6))';
                      
                      linspace(70,     0,   round(number_of_points*0.2))' ...
                      linspace(0,      0,   round(number_of_points*0.2))' ...
                      linspace(220,    0,   round(number_of_points*0.2))']./255;

objects  = findall(groot);
graphics = objects(1:2);
for i = 1:numel(objects)
if isequal(class(objects(i)), 'matlab.graphics.axis.Axes') || ...
   isequal(class(objects(i)), 'matlab.ui.Figure')
graphics(i) = objects(i); 
end
end


for index = 1:numel(graphics)
fig = graphics(index);
if isprop(fig, "defaultaxescolor"); fig.defaultaxescolor = background_color_1; end
if isprop(fig, "Color");            fig.Color            = background_color_2; end
if isprop(fig, "XColor");           fig.XColor           = axis_color;         end
if isprop(fig, "YColor");           fig.YColor           = axis_color;         end
if isprop(fig, "ZColor");           fig.ZColor           = axis_color;         end
if isprop(fig, "ColorOrder");   set(fig,'ColorOrder',new_colormap,'nextplot','replacechildren');end

end


end