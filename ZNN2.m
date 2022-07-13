function output=ZNN2(t,x,gamma,c,m,dc,dm,w,p,s,p2,s2)
[W,J,A,q,d,b]=problem2(t,c,m,0,3); n=length(m(t)); X=x(1:n);  L=x(n+1);
[dW,dJ,dA,dq,dd,db]=problem2(t,dc,dm,0,3,1); dw=0;

N=b-A*X; R=p*s*exp(-s*N'); P=(R*A)';
dP=s*(R.*A')*(dA*X)+(R*(dA-s*A.*db))';
dPdx=s*(R.*A')*A;

N2=w-X'*W*X; Q=exp(-s2*N2); P2=2*p2*s2*Q*W*X;
dP2=2*p2*s2*Q*dW*X+2*p2*s2^2*Q*X*(X'*dW*X-dw);
dP2dx=2*p2*s2*Q*(2*s2*X'*W*X*W+W);

E1=q+J'*L+P+P2; dE1=-dq-dJ'*L-dP-dP2;
E2=J*X-d; dE2=-dJ*X+dd;
M=[dPdx+dP2dx,J';J,0];
Z=[E1;E2]; dZ=[dE1;dE2];
output=M\(-gamma*Z+dZ);
