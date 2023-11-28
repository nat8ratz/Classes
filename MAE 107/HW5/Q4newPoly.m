x = [1.5 2.0 2.7 3.2 4.0 4.4];
f = [4 8 11 -2 -5 1];

xi = 2.5;

B = zeros(6,6);

B(:,1) = f(:);

for n = 2:1:6
    for m = n:1:6
        B(m,n) = (B(m-1,n-1)-B(m,n-1))/(x(m-(n-1))-x(m));
    end
end

dx = xi - x;

fi(1) = B(1,1);
for n = 2:1:6
    fi(n) = fi(n-1) + prod(dx(1:n-1))*B(n,n);
    ea(n-1) = abs(fi(n)-fi(n-1));
end
fi
ea
ff = fi(6)
Ea = ea(5)