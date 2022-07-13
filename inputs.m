function [s_minus,s_plus,hta,pii]=inputs(xi_minus,xi_plus,W,J,A,q,d,b,omegabar)
s_minus=[xi_minus;-omegabar*ones(size(J,1),1);0*ones(size(A,1),1)];
s_plus=[xi_plus;omegabar*ones(size(J,1),1);omegabar*ones(size(A,1),1)];
n=size([J.' A.'],2);
J2=zeros(size(J,1),n);
A2=zeros(size(A,1),n);
hta=[W -J.' A.';J J2;-A A2];
pii=[q;-d;b];