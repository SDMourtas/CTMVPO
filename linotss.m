function f = linotss(sdata,t)
%  The function linots(data,t) (linots standing for linear interpolation of
%  time series) returns interpolated values of a 1-D function at specific 
%  query points using linear interpolation.
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
%           The linear interpolation of the inputted number or the linear
%           interpolation of each number of the input vector.

k=length(sdata);
rf=fix(t);
if t>k-1
    f=sdata{k};
elseif t==rf
    f=sdata{t+1};
else
    f=sdata{rf+1}+(sdata{rf+2}-sdata{rf+1}).*(t-rf);
end