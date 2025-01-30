%options
%1)the vapor pressure 𝑃 (𝑇) at temperatures 𝑇 = −125, −150 and −175 °C
%2)Plot the isotherm 𝑃 − 𝑉 curve at temperatures 𝑇 = −125, −150 and −175 °C
%3)Make a plot for 𝑃𝑣𝑎𝑝 versus 𝑇 for the vapor-liquid coexistence for given
%temperatures
%4)Fit a polynomial curve to 𝑃𝑣𝑎𝑝 versus T,also for Δ𝑉(𝑇)
%5)Plot Δ𝐻 and Δ𝑆 as a function of temperature
%6)Enthalpy calculations
%7)Entropy calculations

option = input("Enter the option no.:- ");

if option == 1
    temp = [148.15 123.15 98.15];
    p_vap = zeros(3,1);
    for i = 1:3
        p_vap(i) = P_vap(temp(i));
    end
    for i = 1 : 3
        fprintf('The vapor pressure at %.2f K is %.4f bar \n',temp(i),p_vap(i))
    end
end

if option == 2
    temp = [148.15 123.15 98.15];
    p_vap = zeros(3,1);
    c = ['r' 'b' 'g'];
    for i = 1:3
        p_vap(i) = P_vap(temp(i));
    end
    PVplot(p_vap(1),temp(1),c(1));
    hold on
    PVplot(p_vap(2),temp(2),c(2));
    hold on
    PVplot(p_vap(3),temp(3),c(3));
    hold off
    

end

if option == 3
    temp = [148.15 143.15 133.15 123.15 113.15 103.15 98.15 93.15 90.15];
    p_vap = zeros(9,1);
    for i = 1:9
        p_vap(i) = P_vap(temp(i));
    end
    plot(temp,p_vap,'linewidth',2.5)
    hold on
    plot(temp,p_vap,'.r',MarkerSize=15)
    hold off
    title("P_v_a_p vs T","FontSize",20)
    xlabel("Temperature(K)","FontSize",20)
    ylabel("P_v_a_p(bar)","FontSize",20)
    
end

if option == 4
    curve_fitting
    temp = [148.15 143.15 133.15 123.15 113.15 103.15 98.15 93.15 90.15];
    delH = zeros(9,1);
    delS = zeros(9,1);
    for i = 1:9
        [dH,dS] = clapeyron(temp(i));
        delH(i) = dH*10^-3;
        delS(i) = dS*10^-3;
    end

    for j = 1:9
        fprintf('At T = %.2f K,  ΔH/mole is %.4f (KJ/mole) and  ΔS/mole is %.4f (KJ/K/mol) \n',temp(j),delH(j),delS(j));
    end
end


if option == 5
    temp = [148.15 143.15 133.15 123.15 113.15 103.15 98.15 93.15 90.15];
    delH = zeros(9,1);
    delS = zeros(9,1);
    for i = 1:9
        [dH,dS] = clapeyron(temp(i));
        delH(i) = dH*10^-3;
        delS(i) = dS*10^-3;
    end

    figure(1)
    plot(temp,delH,'linewidth',2.5)
    hold on
    plot(temp,delH,'.r',MarkerSize=15)
    hold off
    title("ΔH/mol vs T","FontSize",20)
    xlabel("Temperature(K)","FontSize",20)
    ylabel("ΔH/mol(KJ/mol)","FontSize",20)

    figure(2)
    plot(temp,delS,'linewidth',2.5)
    hold on
    plot(temp,delS,'.r',MarkerSize=15)
    hold off
    title("ΔS/mol vs T","FontSize",20)
    xlabel("Temperature(K)","FontSize",20)
    ylabel("ΔS/mol(KJ/mol/K)","FontSize",20)
    
   
end
if option == 6
    pressenthalpy
end

if option == 7
    pressentropy
end
