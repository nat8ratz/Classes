t = 0:1:10;
v = [0.0 2.0 4.0 6.5 8.0 8.5 7.0 6.5 4.0 3.5 1.5];

n = length(t)-1;
h = 10/n;

% Trapezoidal Rule
w = 0;
for n = 1:1:10
    w = w + v(n) + v(n+1);
end
Itrap = h/2*w

% Simpson's Rule
s = 0;
for n = 2:2:10
    s = s + v(n-1) + 4*v(n) + v(n+1);
end
Isimp = h/3*s