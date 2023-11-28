x = [1.5 2.0 2.7 3.2 4.0 4.4];
fx = [4 8 11 -2 -5 1];

xi = 2.5;

n = length(x);

B =zeros(n,n);

for i = 1:1:n
    B(i,1) = fx(i);
end

for j = 2:1:n
    for i = 1:1:n-(j-1);
        B(i,j) = (B(i+1,j-1)-B(i,j-1))/(x(i+(j-1))-x(i));
    end
end

xterm = 1;
yint(1) = B(1,1);

for o = 1:1:n-1
    xterm = xterm*(xi-x(o));
    yint2 = yint(o) + B(1,o+1)*xterm;
    ea(o) = yint2 - yint(o);
    yint(o+1) = yint2;
end