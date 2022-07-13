function output=ZNN1(t,x,gamma,c,m,dc,dm,w,p,s,pr)
[W,J,A,q,d,b]=problem2(t,c,m,w,pr); n=length(m(t)); X=x(1:n); L=x(n+1:end);
[dW,dJ,dA,dq,dd,db]=problem2(t,dc,dm,w,pr,1);

N=b-A*X; R=p*s*exp(-s*N'); P=(R*A)';
dP=s*(R.*A')*(dA*X)+(R*(dA-s*A.*db))';
dPdx=s*(R.*A')*A;

E1=W*X+q+J'*L+P; dE1=-dW*X-dq-dJ'*L-dP;
E2=J*X-d; dE2=-dJ*X+dd;

M=[W+dPdx,J';J,zeros(size(J,1))];

Z=[E1;E2]; dZ=[dE1;dE2];
output=M\(-gamma*Z+dZ);