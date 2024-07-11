F = [1040 1092 1120 1210 1320 1381 1419 1470 1490 1540];
stress = (3*0.05.*F)./(2*0.01*0.005^2);
P = [10/11 9/11 8/11 7/11 6/11 5/11 4/11 3/11 2/11 1/11];

x = log(stress);
y = log(log(1./P));
plot(x,y,'x');
slope = polyfit(x,y,1)
y1 = polyval(slope,x);
hold on;
plot(x,y1);