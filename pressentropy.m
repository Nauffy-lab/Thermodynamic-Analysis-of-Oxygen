temp = [148.15 143.15 133.15 123.15 113.15 103.15 98.15 93.15 90.15];
s_1 = zeros(9,1);
s_2 = zeros(9,1);
p_2 = zeros(9,1);

for i = 1:9
    p = P_vap(temp(i));
    p1 = linspace(p,1,20);
    p2 = linspace(100,p,20);
    p3 = [p,p];
    s1 = zeros(20,1);
    s2 = zeros(20,1);
    s3 = [S(p,temp(i),'l') S(p,temp(i),'v')];
    s_1(i) = S(p,temp(i),'l')*10^-3;
    s_2(i) = S(p,temp(i),'v')*10^-3;
    p_2(i) = p;
    c = ['b' 'g' 'r' 'c' 'm' 'r' 'b' 'g' 'r'];
    for j = 1:20
        s1(j) = S(p1(j),temp(i),'v');
    end
    for k = 1:20
        s2(k) = S(p2(k),temp(i),'l');
    end
    s1 = s1*10^-3;
    s2 = s2*10^-3;
    s3 = s3*10^-3;
    semilogy(s1,p1,c(i),'LineWidth',2)
    hold on
    semilogy(s2,p2,c(i),'LineWidth',2)
    hold on
    semilogy(s3,p3,c(i),'LineWidth',2)
    hold on

    title("PRESSURE VS ENTROPY",'FontSize',25)
    xlabel("Entropy(KJ/mol/K)",'FontSize',15)
    ylabel("Pressure(bar)",'FontSize',15)
    
end
semilogy(s_1,p_2,'--k','LineWidth',2.5)
hold on
semilogy(s_2,p_2,'--k','LineWidth',2.5)
hold on

temp2 = [-100 -75 -50 -25 0 25 50 75 100 125 150]+273.15;
p_1 = linspace(100,1,10);
for i = 1:10
    s = zeros(10,1);
    for j = 1:10
        s(j) = S(p_1(j),temp2(i),'n');
    end
    s = s*10^-3;
    semilogy(s,p_1,'LineWidth',2)
    hold on
end
hold off


