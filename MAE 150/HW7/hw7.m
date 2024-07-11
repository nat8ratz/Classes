clear all;
close all;
clc;
format long;

name = 'Natalie Ratzlaff';
id = 'A17091327';
hw_num = 6;

l1 = 2.7;
l2 = 1;
l3 = 2.4;
l4 = 3;

L1 = l1/l4;
L2 = l1/l2;
L3 = (l1^2+l2^2-l3^2+l4^2)/(2*l2*l4);

th2 = 1:1:360;
th4 = zeros(1,360);
for n = 1:1:360
    fr = @(t4) L3 + L2*cosd(t4) - L1*cosd(th2(n)) - cosd(th2(n)-t4);
    t4 = [0 180];
    th4(n) = fzero(fr,t4);
end

th3 = asind((l4*sind(th4)-l2*sind(th2))/l3);

w2 = 1:1:360;

w3 = abs(l2/l3 * sind(th4-th2)/sind(th3-th4) * w2);
w4 = abs(l2/l4 * sind(th3-th2)/sind(th3-th4) * w2);

figure(1);
plot(th2,th3);
hold on;
plot(th2,th4);

figure(2);
plot(w2,w3);
hold on;
plot(w2,w4);

p1a = 'See figure 1';
p1b = 'See figure 2';
