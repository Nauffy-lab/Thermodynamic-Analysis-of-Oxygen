function y = PVplot(P,T,c)
k = linspace(P,50,20);
j = linspace(1,P,20);
v1 = zeros(20,1);
v2 = zeros(20,1);
p_sat = [P ,P];
for i = 1:20
    z = Z(k(i),T,'l');
    v1(i) = Vbar(z,T,k(i));
end
v_sat = zeros(2,1);
[zl,zv] = Z_sat(T);
z_sat = [zl,zv];
for i = 1:2
    v_sat(i) = Vbar(z_sat(i),T,P);
end
for i = 1:20
    z = Z(j(i),T,'v');
    v2(i) = Vbar(z,T,j(i));
end
loglog(v1,k,c,'Linewidth',1.5)
hold on
loglog(v_sat,p_sat,c,'Linewidth',1.5)
hold on
loglog(v2,j,c,'Linewidth',1.5)
hold off

xlabel("Volume/mole(m^3/kmol)",FontSize=20)
ylabel("Pressure(bar)",FontSize=20)
title('PRESSURE VS MOLAR VOLUME',FontSize=25)


