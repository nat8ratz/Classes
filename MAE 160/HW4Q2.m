stress = [321 389 411 423 438 454 475 489 497 501];
P = [10/11 9/11 8/11 7/11 6/11 5/11 4/11 3/11 2/11 1/11];

x = log(stress);
y = log(log(1./P));
plot(x,y,'x');
slope = polyfit(x,y,1)
y1 = polyval(slope,x);
hold on;
plot(x,y1);