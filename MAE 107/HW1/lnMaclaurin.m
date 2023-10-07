e = log(1.01)

a = zeros(1,4);
Ea = zeros(1,4);

for n = 1:1:4
    if n <= 1
        a(1,n) = (((-1)^(n+1))/n)*0.01^n;
    else
        a(1,n) = a(1,n-1) + (((-1)^(n+1))/n)*0.01^n;
        Ea(1,n) = (a(1,n)-a(1,n-1))/a(1,n);
    end
end

a
Ea
Ee = (a - e)/e*100
