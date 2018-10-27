S=[0;1/6;2/6;3/6;1];
D=[0.9023;0.3895;0.0612;0;0];
stairs(S,D);
hold on
x=linspace(0,1);
y=4*exp(-12*x.*x);
plot(x,y);
hold off
title('Hoefdding bound and Actual Data');