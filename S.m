function y = S(P,T,phase)
z = Z(P,T,phase);
Tc = 154.6;
Pc = 5.046*10^6;
R = 8.314;
b = 0.0778*R*Tc*(1/Pc);

B = (b*P*10^5)/(R*T);

Tr = 298.15; 
c = 25.46*log(T/Tr) + (1.519*10^(-2))*(T - (Tr)) - (0.7151*(1/2)*10^(-5))*(T^2 -(Tr)^2) + (1.311*(1/3)*10^(-9))*(T^3-(Tr)^3);
d = diff_a(T);
e = R*log(P);
sq = sqrt(2);
s = (d/(b*2*sq))*log((z + (1+sq)*B)./(z + (1-sq)*B));
v = R*log(z-B);

y = v + s + c - e;