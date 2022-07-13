function [t,x]=CTMVPO1(gamma,c,m,dc,dm,w,p1,s1,pr)
tspan=[0 5]; options=odeset(); n=length(m(0)); x0=ones(n+2,1)/n;
warning off

% ZNN solutions
tic
[t,x]=ode15s(@ZNN1,tspan,x0(1:end-1),options,gamma,c,m,dc,dm,w,p1,s1,pr);
toc
for i=1:n
subplot(n,1,i);plot(t,x(:,i),'Color',[0.4940 0.1840 0.5560]);hold on
ylabel(['$\eta_{',num2str(i),'}(t)$'],'Interpreter','latex');
end

% Quadprog solutions
options1=optimset('Display','off');
tot=length(t);xth=zeros(n,tot);
tic
for k=1:tot
[xi_minus,xi_plus,W,J,A,q,d,b,~]=problem(t(k),c,m,w,pr);
xth(:,k)=quadprog(W,q,A,b,J,d,xi_minus,xi_plus,x0(1:n),options1);
end
toc
for i=1:n
subplot(n,1,i);plot(t,xth(i,:),':','Color',[0.9290 0.6940 0.1250]);xlim(tspan);hold on
end

xlabel('Time')
legend('ZNN','${\tt quadprog}$','Interpreter','latex')
hold off

kt1=zeros(tot,1); kt2=kt1;
for i=1:tot
kt1(i)=x(i,1:n)*c(oomega(t(i))*t(i))*x(i,1:n)';
kt2(i)=xth(:,i)'*c(oomega(t(i))*t(i))*xth(:,i);
end

figure
plot(t,kt1,'Color',[0.4940 0.1840 0.5560]);hold on
plot(t,kt2,':','Color',[0.9290 0.6940 0.1250])
xlabel('Time')
ylabel('Variance %')
xticks([0 1 2 3 4 5])
xticklabels({'May','Jun','Jul','Aug','Sep','Oct'})
legend('ZNN','${\tt quadprog}$','Interpreter','latex');xlim(tspan)
hold off

kexp2=zeros(tot,1); kexp3=kexp2; kexp0=kexp2; kexp4=kexp2;
err1=x(:,1:n)'-xth; nerr1=zeros(tot,1);
for i=1:tot
kexp0(i)=x(i,1:n)*m(oomega(t(i))*t(i));
kexp2(i)=xth(:,i)'*m(oomega(t(i))*t(i));
kexp3(i)=mean(m(oomega(t(i))*t(i)));
kexp4(i)=w;
nerr1(i)=norm(err1(:,i),2);
end

figure
plot(t,kexp3,'k');hold on
if pr==1
plot(t,kexp4,'--')
end
plot(t,kexp0,'Color',[0.4940 0.1840 0.5560])
plot(t,kexp2,':','Color',[0.9290 0.6940 0.1250])
xlabel('Time')
ylabel('Expected return')
if pr==1
legend('SMA20','Target price','ZNN','${\tt quadprog}$','Interpreter','latex')
else
legend('SMA20','ZNN','${\tt quadprog}$','Interpreter','latex')
end
xticks([0 1 2 3 4 5])
xticklabels({'May','Jun','Jul','Aug','Sep','Oct'});xlim(tspan)
hold off

figure
semilogy(t,nerr1,'Color',[0.4940 0.1840 0.5560]);hold on
ylabel('Error');xlabel('Time');xlim(tspan)
legend('$|\!|\eta_\mathrm{ZNN}(t)-\eta_{\tt quadprog}(t)|\!|^2_2$','Interpreter','latex');hold off