temp = [148.15 143.15 133.15 123.15 113.15 103.15 98.15 93.15 90.15];
h_1 = zeros(9,1);
h_2 = zeros(9,1);
p_2 = zeros(9,1);
for i = 1:9
    p = P_vap(temp(i));
    p1 = linspace(p,1,20);
    p2 = linspace(100,p,20);
    p3 = [p,p];
    h1 = zeros(20,1);
    h2 = zeros(20,1);
    h3 = [H(p,temp(i),'l') H(p,temp(i),'v')];
    h_1(i) = H(p,temp(i),'l')*10^-3;
    h_2(i) = H(p,temp(i),'v')*10^-3;
    p_2(i) = p;
    c = ['b' 'g' 'r' 'c' 'm' 'r' 'b' 'g' 'r'];
    for j = 1:20
        h1(j) = H(p1(j),temp(i),'v');
    end
    for k = 1:20
        h2(k) = H(p2(k),temp(i),'l');
    end
    h1 = h1*10^-3;
    h2 = h2*10^-3;
    h3 = h3*10^-3;
    semilogy(h1,p1,c(i),'LineWidth',2)
    hold on
    semilogy(h2,p2,c(i),'LineWidth',2)
    hold on
    semilogy(h3,p3,c(i),'LineWidth',2)
    hold on

    title("PRESSURE VS ENTHALPY",'FontSize',25)
    xlabel("Enthalpy(KJ/mol)",'FontSize',15)
    ylabel("Pressure(bar)",'FontSize',15)
end
semilogy(h_1,p_2,'--k','LineWidth',2.5)
hold on
semilogy(h_2,p_2,'--k','LineWidth',2.5)
hold on


temp2 = [-100 -75 -50 -25 0 25 50 75 100 125 150]+273.15;
p_1 = linspace(100,1,10);
for i = 1:10
    h = zeros(10,1);
    for j = 1:10
        h(j) = H(p_1(j),temp2(i),'n');
    end
    h = h*10^-3;
    semilogy(h,p_1,'LineWidth',2)
    hold on
end
hold off

