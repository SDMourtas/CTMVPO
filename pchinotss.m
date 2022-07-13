function f = pchinotss(sdata,t)
%  The function pchinots(data,t) (pchinots standing for Piecewise Cubic 
%  Hermite interpolation of time series) returns interpolated values of
%  a 1-D function at specific query points using Piecewise Cubic Hermite
%  interpolation.
%
%  INPUT:
%
%           data = A column vector which contains the time series values.
%
%           t = A real number or a column vector which is consist with real 
%               numbers. Those numbers are the coordinates of the query 
%               points.
%
%  OUTPUT: 
%
%           The Piecewise Cubic Hermite interpolation of the inputted 
%           number or the Piecewise Cubic Hermite interpolation of each
%           number of the input vector.

n = length(sdata);
    rf = fix(t);
    if t==rf && rf<n-1
        f = sdata{rf+1};
        return
    elseif t<1
        m = length(sdata{rf+1});
        r1 = sdata{rf+2}-sdata{rf+1};
        r2 = sdata{rf+3}-sdata{rf+2}; 
        del = [r1;r2];
        d = zeros(2*m,m);
        [k1,k2] = find(sign(del(1:m,:)).*sign(del(m+1:2*m,:)) > 0);
        for i=1:length(k1)
            d(k1(i)+m,k2(i))=2*min(abs(del(k1(i),k2(i))), ...
                abs(del(k1(i)+m,k2(i)))).*max(abs(del(k1(i),k2(i))), ...
                abs(del(k1(i)+m,k2(i))))./(del(k1(i),k2(i))+del(k1(i)+m,k2(i)));
        end
        d(1:m,:) = (3*r1 - r2)/2;
        for i=1:m
            for j=1:m
        if sign(d(i,j)) ~= sign(r1(i,j))
            d(i,j) = 0;
        elseif (sign(r1(i,j)) ~= sign(r2(i,j))) && (abs(d(i,j)) > abs(3*r1(i,j)))
            d(i,j) = 3*r1(i,j);
        end
            end
        end
        rr = d(1:m,:);
        dzzdx = (r1-rr); dzdxdx = (d(m+1:2*m,:)-r1);
        f = (dzdxdx-dzzdx)*(t-rf)^3 ...
            +(2*dzzdx-dzdxdx)*(t-rf)^2 ...
            +rr*(t-rf)+sdata{rf+1};
    elseif t>n-2
        rf = n-2;
        m = length(sdata{rf});
        r1 = sdata{rf+1}-sdata{rf};
        r2 = sdata{rf+2}-sdata{rf+1};
        del = [r1;r2];
        d = zeros(3*m,m);
        [k1,k2] = find(sign(del(1:m,:)).*sign(del(m+1:2*m,:)) > 0);
        for i=1:length(k1)
            d(k1(i)+m,k2(i))=2*min(abs(del(k1(i),k2(i))), ...
                abs(del(k1(i)+m,k2(i)))).*max(abs(del(k1(i),k2(i))), ...
                abs(del(k1(i)+m,k2(i))))./(del(k1(i),k2(i))+del(k1(i)+m,k2(i)));
        end
        d(2*m+1:3*m,:) = (3*r2 - r1)/2;
        for i=1:m
            for j=1:m
        if sign(d(2*m+i,j)) ~= sign(r2(i,j))
            d(2*m+i,j) = 0;
        elseif (sign(r2(i,j)) ~= sign(r1(i,j))) && (abs(d(2*m+i,j)) > abs(3*r2(i,j)))
            d(2*m+i,j) = 3*r2(i,j);
        end
            end
        end
        rr = d(m+1:2*m,:);
        dzzdx = (r2-rr); dzdxdx = (d(2*m+1:3*m,:)-r2);
        f = (dzdxdx-dzzdx)*(t-rf)^3 ...
            +(2*dzzdx-dzdxdx)*(t-rf)^2 ...
            +rr*(t-rf)+sdata{rf+1};
    else
        m = length(sdata{rf});
        r1 = sdata{rf+1}-sdata{rf};
        r2 = sdata{rf+2}-sdata{rf+1};
        r3 = sdata{rf+3}-sdata{rf+2};
        del = [r1;r2;r3];
        d = zeros(3*m,m);
        [k1,k2] = find(sign(del(1:2*m,:)).*sign(del(m+1:3*m,:)) > 0);
        for i=1:length(k1)
            d(k1(i)+m,k2(i))=2*min(abs(del(k1(i),k2(i))), ...
                abs(del(k1(i)+m,k2(i)))).*max(abs(del(k1(i),k2(i))), ...
                abs(del(k1(i)+m,k2(i))))./(del(k1(i),k2(i))+del(k1(i)+m,k2(i)));
        end
%k3=diag(del(k1,k2));
%k4=diag(del(k1+m,k2));
%d(sub2ind(size(d), k1+m,k2)) = 2*min(abs(k3), abs(k4)).*max(abs(k3), abs(k4))./(k3+k4);
        rr = d(m+1:2*m,:);
        dzzdx = (r2-rr); dzdxdx = (d(2*m+1:3*m,:)-r2);
        f = (dzdxdx-dzzdx)*(t-rf)^3 ...
            +(2*dzzdx-dzdxdx)*(t-rf)^2 ...
            +rr*(t-rf)+sdata{rf+1};
    end