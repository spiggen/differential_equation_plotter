function serpendipity_theme(axis)

background_color = [10 3 10]/255;
axis_color = [120 0 82]/255;



set(0, "defaultaxescolor",   background_color)
set(0, "defaultfigurecolor", background_color)

if exist("axis","var")
axis.GridColorMode = 'manual';
axis.GridAlpha = 0.2;
axis.GridColor = axis_color;
axis.Color = background_color;
axis.XGrid = "on";
axis.YGrid = "on";
axis.ZGrid = "on";
axis.XColor = axis_color;
axis.YColor = axis_color;
axis.ZColor = axis_color;
%axis.ColorOrder = [124 0 82;
%                   253 93 0;
%                   176 0 0;
%                   176 0 47;
%                   176 0 118;
%                   112 1 75;
%                   60 0 40;
%                   60 0 16;
%                   60 16 0;
%                   255 228 88;
%                   228 135 42;
%                   129 0 168;
%                   0 0 0]./255;
axis.ColorOrder = [linspace(224,    253,100)' ...
                   linspace(0,      193,100)' ...
                   linspace(82,     0,  100)']./255;
end



end