function images2video(filename, startindex, endindex)
o = VideoWriter(filename+".mp4");
open(o)

for i = startindex:endindex
writeVideo(o, im2frame(imread(filename+string(i)+".png")));
disp(i)
end

close(o)

end