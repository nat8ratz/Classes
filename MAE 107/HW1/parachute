C1 = 0.7;
C2 = 1.17;
g = 9.81;
p = 1.112;
A1 = 0.025*pi;
A2 = 81;
m = 62.5;
x = 1;
v = zeros(1,1201);
T = zeros(1,1201);

for t = 0.01:0.01:12
    x = x + 1;
    T(1,x) = t;
    if t > 6
        v(1,x) = v(1,x-1) + (g - (C2*p*A2*v(1,x-1)^2)/(2*m))*0.01;
    else
        v(1,x) = v(1,x-1) + (g - (C1*p*A1*v(1,x-1)^2)/(2*m))*0.01;
    end
    if v(1,x) < 0
        disp(T(1,x))
        disp(v(1,x))
        break
    end
end

plot(T,v)
