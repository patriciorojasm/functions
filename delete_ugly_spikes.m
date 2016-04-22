
v_discard= -1.3;
v_min  = min(spikes');  %creates vector that contains the min of each spike;
v_min_index = find(v_min < v_discard); % index of the undesired traces

spikes(v_min_index,:) = [];     % delete rows in spikes
index(:,v_min_index) = [];       % delete rows in index

%----after get_spikes--------
%cluster_class(v_min_index,:) = [];       % delete rows in c_class




        