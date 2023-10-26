L1 = 20;
L2 = 6;
L3 = 18;
L4 = 14;

p1 = L1/L4;
p2 = L1/L2;
p3 = (L1^2+L2^2+L4^2-L3^2)/(2*L2*L4);

err = 0.0001;

th4 = 80;

for th2 = 0:10:360
e = 1;
n=0;

while e > err
    th4g = th4;
    fx = cosd(th2-th4g) + p1*cosd(th2) - p2*cosd(th4g) - p3;
    fxp = sind(th2-th4g) + p2*sind(th4);
    th4 = th4g - fx/fxp;
    e = abs(th4 - th4g)/th4;
    n=n+1;
end
plot(th2,th4, 'o');
hold on
end
xlabel('theta 2');
ylabel('theta 4');