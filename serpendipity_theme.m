function serpendipity_theme(axis)

background_color = [30 0 40]/255;
axis_color = [160 0 102]/255;
new_colororder = [linspace(255,    255,100)' ...
                  linspace(0,      255,100)' ...
                  linspace(0,     0,  100)']./255;


set(0, "defaultaxescolor",   background_color)
set(0, "defaultfigurecolor", background_color)
colororder(new_colororder);

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

axis.ColorOrder = new_colororder;
end



end