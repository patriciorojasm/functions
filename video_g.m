figure;
for k=1:100
    j = rgb2gray(mov(1,k).cdata); %= read(my_video, k)
    l=mean(j);
    l
    %l(k) =mean(l)
    %k
end

%movie(mov, 1,my_video.FrameRate);
%implay(j);c