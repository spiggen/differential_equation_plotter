classdef particle_field < handle

properties (Access = public)

    x_positions
    y_positions

    x_positions_init
    y_positions_init

    reset_to_rand = false

    iteration_nr = 1
    recording_nr = 1
    render_nr    = 1
    

    x_max
    x_min
    y_max
    y_min

end
properties (Access = private)

    x_positions_trails
    y_positions_trails
    z_positions_trails

    index_counter

    length_of_trail
    number_of_particles

end
methods

    function self = particle_field(number_of_particles, length_of_trail, x_max, x_min, y_max, y_min)
     if exist("y_min", "var") == false
     y_min = 0;
     end
     if exist("y_max", "var") == false
     y_min = 1;
     end
     if exist("x_min", "var") == false
     y_min = 0;
     end
     if exist("x_max", "var") == false
     y_min = 1;
     end
     if exist("length_of_trail", "var") == false
     length_of_trail = 100;
     end
     if exist("number_of_particles", "var") == false
     number_of_particles = 100;
     end

    self.x_max = x_max;
    self.x_min = x_min;
    self.y_max = y_max;
    self.y_min = y_min;

    self.length_of_trail = length_of_trail;
    self.number_of_particles = (ceil(sqrt(number_of_particles)))^2;
    self.index_counter = 1;

    [x_positions, y_positions] = meshgrid(linspace(x_min, x_max, ceil(sqrt(number_of_particles))), ...
                                          linspace(y_min, y_max, ceil(sqrt(number_of_particles))));

    %if gpuDeviceCount("available") == 0
    self.x_positions = reshape(x_positions, numel(x_positions), 1);
    self.y_positions = reshape(y_positions, numel(y_positions), 1);
    
    self.x_positions_init = self.x_positions;
    self.y_positions_init = self.y_positions;

    self.x_positions_trails = NaN(self.number_of_particles, self.length_of_trail);
    self.y_positions_trails = NaN(self.number_of_particles, self.length_of_trail);
    
    %else
    %self.x_positions = gpuArray(reshape(x_positions, numel(x_positions), 1));
    %self.y_positions = gpuArray(reshape(y_positions, numel(y_positions), 1));
    
    %self.x_positions_trails = gpuArray(NaN(self.number_of_particles, self.length_of_trail));
    %self.y_positions_trails = gpuArray(NaN(self.number_of_particles, self.length_of_trail));
    %end
    end



    function self = record_trails(self)
    self.index_counter = loopback(self.index_counter+1, self.length_of_trail);
    
    self.x_positions_trails(:,self.index_counter) = self.x_positions;
    self.y_positions_trails(:,self.index_counter) = self.y_positions;

    if self.reset_to_rand
    self.x_positions = arrayfun(@(x)rand_if_outofbounds(self.x_min, x, self.x_max), ...
                                                    self.x_positions);
    self.y_positions = arrayfun(@(x)rand_if_outofbounds(self.y_min, x, self.y_max), ...
                                                    self.y_positions);
    else
    self.x_positions = arrayfun(@(x_init, x)reset_if_outofbounds(x_init, self.x_min, x, self.x_max), ...
                                                    self.x_positions_init, self.x_positions);
    self.y_positions = arrayfun(@(x_init, x)reset_if_outofbounds(x_init, self.y_min, x, self.y_max), ...
                                                    self.y_positions_init, self.y_positions);
    end

    self.x_positions_trails(:,self.index_counter) = arrayfun(@(x)NaN_if_outofbounds(self.x_min, x, self.x_max), ...
                                                    self.x_positions_trails(:,self.index_counter));
    self.y_positions_trails(:,self.index_counter) = arrayfun(@(x)NaN_if_outofbounds(self.y_min, x, self.y_max), ...
                                                    self.y_positions_trails(:,self.index_counter));

    %self.x_positions_trails(isnan(self.x_positions_trails(:,self.index_counter)), ...
    %                        loopback(self.index_counter-1, self.length_of_trail)) = NaN;
    %self.y_positions_trails(isnan(self.y_positions_trails(:,self.index_counter)), ...
    %                        loopback(self.index_counter-1, self.length_of_trail)) = NaN;

   
    end


    function self = reset_random_trail(self, number_of_tails)
    if exist("number_of_tails", "var") == false
    number_of_tails = 1;
    end

    for i = 1:number_of_tails
    particle_to_be_reset = round(rand(1)*(self.number_of_particles -1) +1);
    
    if self.reset_to_rand
    self.x_positions(particle_to_be_reset) = rand(1)*(self.x_max-self.x_min) + self.x_min;
    self.y_positions(particle_to_be_reset) = rand(1)*(self.y_max-self.y_min) + self.y_min;
    else
    self.x_positions(particle_to_be_reset) = self.x_positions_init(particle_to_be_reset);
    self.y_positions(particle_to_be_reset) = self.y_positions_init(particle_to_be_reset);
    end
    self.x_positions_trails(particle_to_be_reset, self.index_counter) = NaN;
    self.y_positions_trails(particle_to_be_reset, self.index_counter) = NaN;
    end

    
    end


    function plot(self, plotobj)
    order = [(mod(self.index_counter, self.length_of_trail)+1):self.length_of_trail, ... 
             1:mod(self.index_counter, self.length_of_trail)];

    if exist("plotobj", "var")
    plot(plotobj, self.x_positions_trails(:, order)', ...
                  self.y_positions_trails(:, order)')
    else
    plot(self.x_positions_trails(:, order)', ...
         self.y_positions_trails(:, order)')
    end
    end

end



end
