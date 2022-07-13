function [xi_minus,xi_plus,W,J,A,q,d,b,omegabar]=problem(t,c,m,w,pr)
r=m(oomega(t)*t);
n=length(r);
if pr==3
W=c(oomega(t)*t);
else
W=2*c(oomega(t)*t);
end
J=ones(1,n);
d=1;
xi_plus=ones(n,1);
xi_minus=zeros(n,1);
omegabar=1e+100;

if pr==1
q=zeros(n,1);
A=-r';
b=-w;
else
q=-r;
A=[];
b=[];
end