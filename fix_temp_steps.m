
s=size(cursor_info,2);
i=1;
zz=[];
for i=1:s
    zz(i)=  cursor_info(1,i).DataIndex;
end
zz=sort(zz);