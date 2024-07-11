clear all;
close all;
clc;
format long;

name = 'Natalie Ratzlaff';
id = 'A17091327';
hw_num = 3;

x = @(t) t;
y = @(t) t^2;
x1 = @(t) t - (0.25/sqrt(1+4*t^2))*2*t;
y1 = @(t) t^2 + (0.25/sqrt(1+4*t^2));
x2 = @(t) t - (0.5/sqrt(1+4*t^2))*2*t;
y2 = @(t) t^2 + (0.5/sqrt(1+4*t^2));
x3 = @(t) t - (0.75/sqrt(1+4*t^2))*2*t;
y3 = @(t) t^2 + (0.75/sqrt(1+4*t^2));
x4 = @(t) t - (1/sqrt(1+4*t^2))*2*t;
y4 = @(t) t^2 + (1/sqrt(1+4*t^2));

figure(1);
hold on;
fplot(x,y,[-2,2]);
fplot(x1,y1,[-2,2]);
fplot(x2,y2,[-2,2]);
fplot(x3,y3,[-2,2]);
fplot(x4,y4,[-2,2]);
xlabel('x');
ylabel('y');
title('Offset Parabolic Curves');
legend('D = 0','D = 0.25','D = 0.5','D = 0.75','D = 1');

p1a = 'See figure 1'

R = @(t) sqrt(1 + 4*t^2)/2;
K = @(t) 2/sqrt(1+4*t^2);

figure(2);
subplot(2,1,1);
hold on;
fplot(R,[-2,2]);
xlabel('x');
ylabel('R');
title('Radius of Curvature');
subplot(2,1,2);
hold on;
fplot(K,[-2,2]);
xlabel('x');
ylabel('K');
title('Curvature');

p1b = 'See fugure 2'

p1c = 'The curves overlap on each other when D exceeds the maximum radius of cuvravure.'

figure(3);
hold on;
c1 = @(x) -2*x^3 - 13*x^2 - 10*x + 1;
fplot(c1,[-1 0]);
c2 = @(x) -18*x^3 + 27*x^2 - 10*x + 1;
fplot(c2,[0 1]);
c3 = @(x) 2.5*x^2 - 2.5;
fplot(c3,[-1 1]);
xlabel('x');
ylabel('y');
title('Cubic Hermite Spline Interpolation');
legend('curve #1','curve #2','curve #3');

p2 = 'See figure 3'

ta = 0:109;
tb = 110:119;
tc = 120:199;
td = 200:219;
te = 220:339;
tf = 340:359;
w = (1000)*2*pi/60;
y3a = 100.*(ta./110).^3 - 150.*(ta./110).^4 + 60.*(ta./110).^5;
dy3a = (300.*(ta./110).^2 - 600.*(ta./110).^3 + 300.*(ta./110).^4)*w;
d2y3a = (600.*(ta./110) - 1800.*(ta./110).^2 + 1200.*(ta./110).^3)*w^2;
d3y3a = (600 - 3600.*(ta./110) + 3600.*(ta./110).^2)*w^3;
y3b = 10 + 0.*tb;
dy3b = 0.*tb;
d2y3b = 0.*tb;
d3y3b = 0.*tb;
y3c = 10 + 10.*((tc-120)./80 - 1/(2*pi)*sin(2*pi.*(tc-120)./80));
dy3c = (10*(w/80).*(1-cos(2*pi.*(tc-120)./80)))*w;
d2y3c = (20*pi*(w/80)^2.*sin(2*pi.*(tc-120)./80))*w^2;
d3y3c = (40*pi^2*(w/80)^3.*cos(2*pi.*(tc-120)./80))*w^3;
y3d = 20 + 0.*td;
dy3d = 0.*td;
d2y3d = 0.*td;
d3y3d = 0.*td;
y3e = -10.*(1-cos(pi.*(te-220)./120)) + 20;
dy3e = (-10*(pi*w/120).*sin(pi.*(te-220)./120))*w;
d2y3e = (-10*(pi*w/120)^2.*cos(pi.*(te-220)./120))*w^2;
d3y3e = (10*(pi*w/120)^3.*sin(pi.*(te-220)./120))*w^3;
y3f = 0.*tf;
dy3f = 0.*tf;
d2y3f = 0.*tf;
d3y3f = 0.*tf;

figure(4);
subplot(4,1,1);
hold on;
plot(ta,y3a);
plot(tb,y3b);
plot(tc,y3c);
plot(td,y3d);
plot(te,y3e);
plot(tf,y3f);
xlabel('𝜃 (degrees)');
ylabel('Displacement (mm)');
title('Displacement Profile');
subplot(4,1,2);
hold on;
plot(ta,dy3a);
plot(tb,dy3b);
plot(tc,dy3c);
plot(td,dy3d);
plot(te,dy3e);
plot(tf,dy3f);
xlabel('𝜃 (degrees)');
ylabel('Velocity (mm/s)');
title('Velocity Profile');
subplot(4,1,3);
hold on;
plot(ta,d2y3a);
plot(tb,d2y3b);
plot(tc,d2y3c);
plot(td,d2y3d);
plot(te,d2y3e);
plot(tf,d2y3f);
xlabel('𝜃 (degrees)');
ylabel('Acceleration (mm/s^2)');
title('Acceleration Profile');
subplot(4,1,4);
hold on;
plot(ta,d3y3a);
plot(tb,d3y3b);
plot(tc,d3y3c);
plot(td,d3y3d);
plot(te,d3y3e);
plot(tf,d3y3f);
xlabel('𝜃 (degrees)');
ylabel('Jerk (mm/s^3');
title('Jerk Profile');

p3a = 'See figure 4'

t = [ta tb tc td te tf].*pi./180;
y3 = [y3a y3b y3c y3d y3e y3f];

[ccx,ccy] = pol2cart(t,y3+20);
[px,py] = pol2cart(t,y3+26);
[bcx,bcy] = pol2cart(t,20);
[pcx,pcy] = pol2cart(t,26);

figure(5);
hold on;
plot(bcx,bcy);
plot(pcx,pcy);
plot(ccx,ccy);
plot(px,py);
xlabel('x (mm)');
ylabel('y (mm)');
title('Cam Shape');
legend('Base Circle','Prime Circle','Cam Contour','Pitch Curve');

p3b = 'See figure 5'

dy3 = [dy3a dy3b dy3c dy3d dy3e dy3f];
pa = atand(((1/w).*dy3)./(y3 + 20));

figure(6);
hold on;
plot(t.*(180/pi),pa);
xlabel('𝜃 (degrees)');
ylabel('Φ (degrees)');
title('Pressure Angle');
yline(30);
yline(-30);

p3c = 'See figure 6'

p3d = 'This cam has a pressure angle over 30 degrees, so it is not a good design for the angular velocity it is set to; lowering the angular velocity or making the cam features less sharp would decrease the max pressure angle and make it a better cam.'

M = [ccx(2:2:360).' ccy(2:2:360).' zeros(180,1)]
writematrix(M,'cam_profile.txt')