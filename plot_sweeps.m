index=1;
num=10;
x = length/(traces);
figure; plot(time,data);
uicontrol('Style', 'pushbutton', 'String', 'Next','Callback', @der)

for index=1:num
    x1= x*(index -1);
    x2= x*index;
    xlim([x1 x2]);
end 

function der(h,dos)

    x1= x*(index -1);
    x2= x*index;
    xlim([x1 x2]);


end