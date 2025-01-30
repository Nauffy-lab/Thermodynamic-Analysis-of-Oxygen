function y = diff_a(T)
x = 0.000001;
y1 = a(T-x);
y2 = a(T+x);
y = (y2-y1)/(2*x);