vid = videoinput('linuxvideo', 1 )
set(vid, 'FramesPerTrigger', 50);
% set(vid, 'FrameRate', 3);
set(getselectedsource(vid) ); %, 'FrameRate', 3);
start(vid);
wait(vid);
[f,t]=getdata(vid);
imtool(f(:,:,:,10))
implay(f)
vid