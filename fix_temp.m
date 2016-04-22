threshold=6.18;
index=1;
while index < size(tempx,2)     %cu.DataIndex
    if tempx(index) < threshold
        tempx(index) = nan;
        index = index+1;
    else
        index = index+1;
    end
    
end
    
figure, plot(tempx);