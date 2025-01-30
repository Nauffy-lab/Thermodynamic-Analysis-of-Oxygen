x = [148.15 143.15 133.15 123.15 113.15 103.15 98.15 93.15 90.15];
y = zeros(9,1);
for i = 1:9
    y(i) = P_vap(x(i));
end
p = polyfit(x,y,3);
x2 = 148.15:-5:88.15;
y2 = polyval(p,x2);
figure(1)
plot(x,y,'o')
hold on
plot(x2,y2)
hold off
xlabel("Temperature(K)","FontSize",20)
ylabel("P_v_a_p(bar)","FontSize",20)
s = sprintf('P_v_a_p = %.8f T^3 + %.8f T^2 + %.8f T + %.8f',p(1),p(2),p(3),p(4));
title(s);

y1 = zeros(9,1);
for i = 1:9
    y1(i) = delVbar(x(i))*10^-6;
end
p1 = polyfit(x,y1,4);
x_2 = 148.15:-5:88.15;
y_2 = polyval(p1,x_2);
figure(2)
plot(x,y1,'o')
hold on
plot(x_2,y_2)
hold off
xlabel("Temperature(K)","FontSize",20)
ylabel("V/mol(m^3/mol)","FontSize",20)
s1 = sprintf('V/mol = %.8f T^4 + %.8f T^3 + %.8f T^2 + %.8f T + %.8f ',p1(1),p1(2),p1(3),p1(4),p1(5));
title(s1);



