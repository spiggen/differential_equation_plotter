function borealis()


background_color = [0 0 0]/255;
axis_color       = [0 0 0]/255;
new_colororder = 1 - get(gca, "colororder");
new_colororder(:,1) = (2/pi)*atan(new_colororder(:,1)*2 + 0.2*rand(size(new_colororder(:,1))));
new_colororder(:,2) = (2/pi)*atan(new_colororder(:,2)*2 + 0.2*rand(size(new_colororder(:,1))));
new_colororder(:,3) = (2/pi)*atan(new_colororder(:,3)*4);

set(0, "defaultaxescolor",   background_color)
set(0, "defaultfigurecolor", background_color)
colororder(new_colororder);


gcf.GridColorMode = 'manual';
gcf.GridAlpha = 0.2;
gcf.GridColor = axis_color;
gcf.Color = background_color;
gcf.XGrid = "on";
gcf.YGrid = "on";
gcf.ZGrid = "on";
gcf.XColor = axis_color;
gcf.YColor = axis_color;
gcf.ZColor = axis_color;

gcf.ColorOrder = new_colororder;



end