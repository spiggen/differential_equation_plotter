function out_index = loopback(in_index, max_index)
out_index = in_index - (in_index > max_index)*  max_index*fix(in_index/max_index) + ...
                       (1 > in_index)*          max_index*(abs(fix(in_index/max_index))+1);

end