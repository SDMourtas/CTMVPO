function f = splinots(data,d,t)
rf = fix(t);
if t>size(data,1)-1
    f=data(end,:);
elseif rf==t
    f=data(t+1,:);
else
    del = data(rf+2,:)-data(rf+1,:); 
    dzz = (del-d(rf+1,:)); dzx = (d(rf+2,:)-del);
    f = (dzx-dzz)*(t-rf)^3 +(2*dzz-dzx)*(t-rf)^2 ...
            +d(rf+1,:)*(t-rf)+data(rf+1,:);
end