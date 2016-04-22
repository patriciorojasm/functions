names=fieldnames(x);
end_value = size(names,1)-1;
i= 1;
%out=x.(names{i});   % ONLY for first iteration
for i=1:end_value
    %r_sample = x.(names{i+1});    % ONLY for first iteration
    r_sample = x.(names{i});
    out = vertcat(out, r_sample);
end
clear end_value i names r_sample x
