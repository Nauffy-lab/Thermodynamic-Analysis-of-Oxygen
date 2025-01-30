function y = delVbar(T)
[zl,zv] = Z_sat(T);
z = zv - zl;
R = 8.314;
y = (z*R*T)/P_vap(T);

