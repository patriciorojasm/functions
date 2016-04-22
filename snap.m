vid = videoinput('linuxvideo', 1)
%preview(vid);
data = getsnapshot(vid);
%data = getdata(vid);
%image(data);