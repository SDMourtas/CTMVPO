function [W,J,A,q,d,b]=problem2(t,c,m,w,pr,z)
r=m(oomega(t)*t);
if pr==3
W=c(oomega(t)*t);
else
W=2*c(oomega(t)*t);
end
n=length(r);

if nargin==5
J=ones(1,n);
I=eye(n);
xi_plus=ones(n,1);
xi_minus=zeros(n,1);
d=1;
    if pr==1
        q=zeros(n,1);
        rp=w;
        A=[-r';I;-I];
        b=[-rp;xi_plus;xi_minus];
    else
        q=-r;
        A=[I;-I];
        b=[xi_plus;xi_minus];
    end
else
J=zeros(1,n);
I=zeros(2*n,n);
xi=zeros(2*n,1);
d=0;
    if pr==1
        q=zeros(n,1);
        rp=0;
        A=[-r';I];
        b=[-rp;xi];
    else
        q=-r;
        A=I;
        b=xi;
    end
end
