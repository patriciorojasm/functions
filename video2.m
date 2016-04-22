list=dir('*.jpeg');
num = size(list,1);
mov(1:num) = struct('cdata', zeros(640, 480, 3, ...
    'uint8'), 'colormap', []);
for i=1:num
%im = imread(list(i).name );
%j = rgb2gray(mov(1,k).cdata);
%l(i)=mean(im(i));


%mov(i).cdata = imread(list(i).name );

%j=mean(imread(list(i).name ));
%mov(i).cdata = rgb2gray(mov(i).cdata);
frame(i)     =mean(mean(mov(i).cdata));


end

for j=1:(num-1)  %j=2:(num+1)
    m=j+1;
    frame_post(m)=mean(mean(mov(m).cdata));
end

delta = frame_post -frame;
figure; plot(delta);


implay(mov);