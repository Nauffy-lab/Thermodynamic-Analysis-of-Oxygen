function y = Vbar(Z,T,P)
R = 8.314;
P = P*10^5;
y = (Z*R*T*10^3)/P;
