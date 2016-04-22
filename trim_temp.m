temp_c=-temp;
temp_c(1:10) =nan;
[pks,locs] = findpeaks(temp_c,'MINPEAKHEIGHT',-1.4,'MinPeakDistance',400);
end_point = size(locs,2);
i=1;
for i=1:end_point
    a1 = locs(i)-20;
    a2 = locs(i)+20;
    temp_c(a1:a2) = NaN;
    %temp_c(a1:a2) =  (mean(temp_c(a1-50:a1)) + mean(temp_c(a2:a2+50)))*.5 ;
    %disp(num2str(a*i));
end
temp_c = -temp_c;

temp_c = (temp_c -p(1,2))/p(1,1);

figure, plot(temp_c);

tempx= temp_c;

threshold=6.5;
index=1;

while index < size(tempx,2)     %cu.DataIndex
    if tempx(index) < threshold & index < cu1.DataIndex
        tempx(index) = nan;
        %tempx(index) = 8;   %mean(tempx(index-10:index-1));
        index = index+1;
    else
        index = index+1;
    end
        
end

threshold=6.18;
index=1;
while index < size(tempx,2)     
    if tempx(index) < threshold 
        tempx(index) = nan;
        index = index+1;
    else
        index = index+1;
    end
        
end
tempx = sgolayfilt(tempx, 1,301);
tempx=inpaint_nans(tempx,5);   % interpolates for missing values
figure, plot(tempx);


tempx_r = floor(tempx);
figure, 
subplot(211), plot(tempx_r);
tempx_r_d = diff(tempx_r);
subplot(212), plot(tempx_r_d);


%pts_tempx_r_d = find(diff(tempx_r) ==1);
