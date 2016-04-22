function button_next(obj,event)
%function nextbutton(source,eventdata)
        global i1
        i2=i1; 
        global i2
        global si   % spikes's size
        si2=si;
        global ss   % spikes
        sspikes=ss;
        if i2<= si2
            i2=i2+1;
            plot(sspikes(i2,:));
        end
end

