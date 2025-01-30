function [zl,zv] = Z_sat(T)
Tc = 154.6;
Pc = 5.046*10^6;
R = 8.314;
P = Pc;

b = 0.0778*R*Tc*(1/Pc);
A = (a(T)*P)/(R*T)^2;
B = (b*P)/(R*T);

alpha = B-1;
beta = A - 3*B^2 - 2*B;
gamma = B^3 + B^2 - A*B;

c = [1 alpha beta gamma];
z = real(roots(c));
Zv = max(z);
Zl = min(z);
f_l = fug(Zl,P,T);
f_v = fug(Zv,P,T);

while abs(f_l/f_v - 1) > 10^(-4)
    P = P*(f_l/f_v);
    b = 0.0778*R*Tc*(1/Pc);
    A = (a(T)*P)/(R*T)^2;
    B = (b*P)/(R*T);

    alpha = B-1;
    beta = A - 3*B^2 - 2*B;
    gamma = B^3 + B^2 - A*B;

    c = [1 alpha beta gamma];
    z = real(roots(c));
    Zv = max(z);
    Zl = min(z);
    f_l = fug(Zl,P,T);
    f_v = fug(Zv,P,T);
end
zl = Zl;
zv = Zv;