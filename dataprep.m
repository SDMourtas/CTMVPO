function [c,m,dc,dm]=dataprep(X,s)
% expected return and covariance construction

[tot1,tot2]=size(X);
R=zeros(tot1-s,tot2);
C{tot1-s,1}={};
for i=1:tot1-s
    r=X(i:s+i-1,:); rr=r./max(r);
    C{i,1}=100*cov(rr);
    R(i,:)=mean(rr);
end
dR=zeros(tot1-s,tot2); dC{tot1-s,1}={};
for i=1:tot1-s
    if i~=tot1-s
        dC{i,1}=C{i+1,1}-C{i,1}; dR(i,:)=R(i+1,:)-R(i,:);
    else
        dC{i,1}=dC{i-1,1}; dR(i,:)=dR(i-1,:);
    end
end
c=@(x)linotss(C,x); m=@(x)linots(R,x)';
dc=@(x)linotss(dC,x); dm=@(x)linots(dR,x)';

%c=@(x)pchinotss(C,x); m=@(x)pchinots(R(s+1:end,:),x)';
%dc=@(x)pchinotss(dC,x); dm=@(x)pchinots(dR,x)';
%spl1 = sps(C); c = @(x)splinotss(C,spl1,x); spl = sp(R(s+1:end,:)); m = @(x)splinots(R(s+1:end,:),spl,x)';
%dspl1 = sps(dC); dc = @(x)splinotss(dC,dspl1,x); dspl = sp(dR); dm = @(x)splinots(dR,dspl,x)';