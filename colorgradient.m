function rgbarray = colorgradient(varargin)
rgbarray = zeros(10*numel(varargin), 3);

for index = 2:numel(varargin)
rgbarray(index,:) = [linspace(varargin{index}), linspace(), linspace()]'./255;

end

end