function [dH , dS ] = clapeyron(T)

dH = diffPvap(T)*T*delVbar(T);
dS = diffPvap(T)*delVbar(T);
