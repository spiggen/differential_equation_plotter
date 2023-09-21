function fireflies()

background_color_1 = [15 0 20]/255;
background_color_2 = [15 0 20]/255;
axis_color         = [160 0 102]/255;

new_colororder     = [linspace(255,    255, 10)' ...
                      linspace(255,    255, 10)' ...
                      linspace(255,    100, 10)';
                      
                      linspace(255,    255, 40)' ...
                      linspace(255,    0,   40)' ...
                      linspace(100,    0,   40)';

                      linspace(255,    70,  40)' ...
                      linspace(0,      0,   40)' ...
                      linspace(0,      220, 40)';
                      
                      linspace(70,     0,   10)' ...
                      linspace(0,      0,   10)' ...
                      linspace(220,    0,   10)']./255;


set(0, "defaultaxescolor",   background_color_1)
set(0, "defaultfigurecolor", background_color_2)
colororder(new_colororder);


gcf.GridColorMode = 'manual';
gcf.GridAlpha = 0.2;
gcf.GridColor = axis_color;
gcf.Color = background_color_2;
gcf.XGrid = "on";
gcf.YGrid = "on";
gcf.ZGrid = "on";
gcf.XColor = axis_color;
gcf.YColor = axis_color;
gcf.ZColor = axis_color;


gcf.ColorOrder = new_colororder;

end