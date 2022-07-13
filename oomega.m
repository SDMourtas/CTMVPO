function omega=oomega(t)
if t<=1
    omega=22;
elseif t>1 && t<=2
    omega=2/t+20;
elseif t>2 && t<=4
    omega=-2/t+22;
elseif t>4 && t<=5
    omega=6/t+20;
end