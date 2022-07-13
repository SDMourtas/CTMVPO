function sdata = sps(sdata)
n=size(sdata,1);
m=length(sdata{1});
for i=1:m
w = cell2mat(cellfun(@(x)(x(i,:)), sdata, 'UniformOutput', false));
data=w(1:n,1:m)';
del = data(:,2:end)-data(:,1:end-1); 
bb=zeros(m,n);
bb(:,2:n-1)=3*(del(:,1:n-2)+del(:,2:n-1));
bb(:,1)=(5*del(:,1)+del(:,2))/2;
bb(:,n)=(del(:,n-2)+5*del(:,n-1))/2;
dxt = ones(n-2,1);
c = spdiags([2 1 0;dxt 4*dxt dxt;0 1 2],[-1 0 1],n,n);
d=(bb/c)';
for j=1:n
sdata{j,1}(i,1:m)=d(j,:);
end
end