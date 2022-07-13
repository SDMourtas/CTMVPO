function [c,ceq] = nonlcon(x,W,w)
c = x'*W*x-w;
ceq = [];