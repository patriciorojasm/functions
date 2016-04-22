my_video = VideoReader('controlII-1.avi');
get(my_video);
nFrames = my_video.NumberOfFrames;
vidHeight = my_video.Height;
vidWidth = my_video.Width;

mov(1:nFrames) = struct('cdata', zeros(vidHeight, vidWidth, 3, ...
    'uint8'), 'colormap', []);

for k=1:200
    mov(k).cdata = read(my_video, k)
    disp(num2str(k));
end

%movie(mov, 1,my_video.FrameRate);
implay(mov);


%figure;
%subplot(3,1,1);
%imshow(im1);
%subplot(3,1,2);
%imshow(im2);
%subplot(3,1,1);
%imshow(im1+im2);
