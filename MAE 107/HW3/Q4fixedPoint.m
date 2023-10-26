L1 = 20;
L2 = 6;
L3 = 18;
L4 = 14;

p1 = L1/L4;
p2 = L1/L2;
p3 = (L1^2+L2^2+L4^2-L3^2)/(2*L2*L4);

err = 0.01;

th2 = 60;
th4 = 95;
e = 1;
n=0;

while e > err
    th4g = th4;
    th4 = acosd((cosd(th2-th4)+p1*cosd(th2)-p3)/p2);
    e = abs(th4 - th4g)/th4;
    n=n+1;
end
n
th4

plot([0,L2*cosd(th2),L1+L4*cosd(th4),L1], [0,L2*sind(th2),L4*sind(th4),0], 'b-');