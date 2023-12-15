x = tang;
xbar = mean(x);
s = delta;

s1 = s.*sqrt(1./(sum((x-xbar).^2)));
s0 = s.*sqrt(sum(x.^2)./sum((x-xbar).^2));

sa1 = mean(s1)
sa0 = mean(s0)