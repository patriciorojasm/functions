%names = who;
%end_value = size(names,1);
% fix the vector names to the same format
names=fieldnames(x);
%i=size(names,1)/2+1;
for i=1:3000 % end_value
    n=names{i};
    l=length(n);
    if l==2
        no=strcat(n(1),'000',n(2));
        %no = eval(names{i});
    elseif l==3
        no=strcat(n(1),'00',n(2:3));
    elseif l==4
        no=strcat(n(1),'0',n(2:4));
    else
        no=n;
    end
    %no = eval(names{i});
    %names_1{i} = no;
    eval([no, '=x.(names{i});']);
    disp(names{i})
end
%names_1 = sort(names_1);
clear 'T*';