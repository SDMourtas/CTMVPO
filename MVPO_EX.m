function [t,x]=MVPO_EX(MVPO_Setup,Example)
% Choose MVPS setup and examples
if Example==1
    m=4; w1=0.963; w2=0.045; p1=1e-8; s1=1e5; p2=1e-8; s2=3e4; p3=2e-4; s3=5e2; 
elseif Example==2
    m=10; w1=0.955; w2=0.039; p1=1e-8; s1=6e4; p2=1e-8; s2=3e4; p3=2e-4; s3=5e2;
else
    m=20; w1=0.955; w2=0.037; p1=1e-8; s1=6e4; p2=1e-8; s2=3e4; p3=1e-4; s3=5e2;
end

s=20;                    % number of delays for average and cov matrix
X1=xlsread('dataC');     % stocks close prices
X=X1(:,1:m);              % market space
[R,C,dR,dC]=dataprep(X,s);

gamma=1e4; % NN design parameter
if MVPO_Setup==1
[t,x]=CTMVPO1(gamma,R,C,dR,dC,w1,p1,s1,1);
elseif MVPO_Setup==2
[t,x]=CTMVPO1(gamma,R,C,dR,dC,0,p2,s2,2);
else
[t,x]=CTMVPO2(gamma,R,C,dR,dC,w2,p2,s2,p3,s3);
end