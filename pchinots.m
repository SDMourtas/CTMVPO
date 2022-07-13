function f = pchinots(data,t)
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

n = length(data);
    rf = fix(t);
    if t==rf && rf<n-1
        f = data(rf+1,:);
        return
    elseif t<1
        m = size(data,2);
        del = data(rf+2:rf+3,:)-data(rf+1:rf+2,:);
        d = zeros(2,m);
        [k1,k2] = find(sign(del(1,:)).*sign(del(2,:)) > 0);
        for i=1:length(k1)
            d(k1(i)+1,k2(i))=2*min(abs(del(k1(i),k2(i))), ...
                abs(del(k1(i)+1,k2(i)))).*max(abs(del(k1(i),k2(i))), ...
                abs(del(k1(i)+1,k2(i))))./(del(k1(i),k2(i))+del(k1(i)+1,k2(i)));
        end
        d(1,:) = (3*del(1,:) - del(2,:))/2;
        for i=1:m
        if sign(d(1,i)) ~= sign(del(1,i))
            d(1,i) = 0;
        elseif (sign(del(1,i)) ~= sign(del(2,i))) && (abs(d(1,i)) > abs(3*del(1,i)))
            d(1,i) = 3*del(1,i);
        end
        end
        dzzdx = (del(1,:)-d(1,:)); dzdxdx = (d(2,:)-del(1,:));
        f = (dzdxdx-dzzdx)*(t-rf)^3 ...
            +(2*dzzdx-dzdxdx)*(t-rf)^2 ...
            +d(1,:)*(t-rf)+data(rf+1,:);
    elseif t>n-2
        rf = n-2;
        m = size(data,2);
        del = data(rf+1:rf+2,:)-data(rf:rf+1,:);
        d = zeros(3,m);
        [k1,k2] = find(sign(del(1,:)).*sign(del(2,:)) > 0);
        for i=1:length(k1)
            d(k1(i)+1,k2(i))=2*min(abs(del(k1(i),k2(i))), ...
                abs(del(k1(i)+1,k2(i)))).*max(abs(del(k1(i),k2(i))), ...
                abs(del(k1(i)+1,k2(i))))./(del(k1(i),k2(i))+del(k1(i)+1,k2(i)));
        end
        d(3,:) = (3*del(2,:) - del(1,:))/2;
        for i=1:m
        if sign(d(3,i)) ~= sign(del(2,i))
            d(3,i) = 0;
        elseif (sign(del(2,i)) ~= sign(del(1,i))) && (abs(d(3,i)) > abs(3*del(2,i)))
            d(3) = 3*del(2);
        end
        end
        dzzdx = (del(2,:)-d(2,:)); dzdxdx = (d(3,:)-del(2,:));
        f = (dzdxdx-dzzdx)*(t-rf)^3 ...
            +(2*dzzdx-dzdxdx)*(t-rf)^2 ...
            +d(2,:)*(t-rf)+data(rf+1,:);
    else
        m = size(data,2);
        del = data(rf+1:rf+3,:)-data(rf:rf+2,:);
        d = zeros(3,m);
        [k1,k2] = find(sign(del(1:2,:)).*sign(del(2:3,:)) > 0);
        for i=1:length(k1)
            d(k1(i)+1,k2(i))=2*min(abs(del(k1(i),k2(i))), ...
                abs(del(k1(i)+1,k2(i)))).*max(abs(del(k1(i),k2(i))), ...
                abs(del(k1(i)+1,k2(i))))./(del(k1(i),k2(i))+del(k1(i)+1,k2(i)));
        end
        dzzdx = (del(2,:)-d(2,:)); dzdxdx = (d(3,:)-del(2,:));
        f = (dzdxdx-dzzdx)*(t-rf)^3 ...
            +(2*dzzdx-dzdxdx)*(t-rf)^2 ...
            +d(2,:)*(t-rf)+data(rf+1,:);
    end