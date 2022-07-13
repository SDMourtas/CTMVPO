function f = splinotss(sdata,d,t)
k=length(sdata);
rf = fix(t);
if t>k-1
    f=sdata{k};
elseif rf==t
    f=sdata{rf+1};
else
    del = sdata{rf+2}-sdata{rf+1}; 
    dzz = (del-d{rf+1}); dzx = (d{rf+2}-del);
    f = (dzx-dzz)*(t-rf)^3 +(2*dzz-dzx)*(t-rf)^2 ...
            +d{rf+1}*(t-rf)+sdata{rf+1};
end