function y = Z(P,T,phase)
Tc = 154.6;
Pc = 5.046*10^6;
R = 8.314;
P = P*10^5;
b = 0.0778*R*Tc*(1/Pc);
A = (a(T)*P)/(R*T)^2;
B = (b*P)/(R*T);

alpha = B-1;
beta = A - 3*B^2 - 2*B;
gamma = B^3 + B^2 - A*B;
s = 0;
c = [1 alpha beta gamma];
z = roots(c);
for i = 1:3
    if imag(z(i)) == 0
        s = s+1;
        k = z(i);
    end
end
if s == 3

    if phase == 'l'
        k = min(z);
    end
    if phase == 'v'
        k = max(z);
    end
end
if phase == 'n'
    k = real(k);
end
y = k;