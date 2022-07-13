function f = linots(data,t)
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

rf=fix(t);
if t>size(data,1)-1
    f=data(end,:);
elseif t==rf
    f=data(t+1,:);
else
    f=data(rf+1,:)+(data(rf+2,:)-data(rf+1,:)).*(t-rf);
end