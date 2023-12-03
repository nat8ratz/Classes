t = 0:(1/30):(193/30);
frames = 194;
angles = angled(1:frames);
hold on;

for n = 2:1:194
    if angles(n) < 1;
        angles(n) = angles(n) + 360;
    end
end
plot(t,angles);

totAngle = angles - angles(1);
slope = zeros(1,194);

i = 0;
a = 0;
for n = 2:1:194
    if totAngle(n-1) > totAngle(n)
        totAngle(n:1:194) = 360 + totAngle(n:1:194);
        i = i+1;
        rotTime(i) = t(n);
        if i > 1
            if rotTime(i) <= rotTime(i-1)+(1/15)
                a = a+1;
                aliasing(a) = t(n);
            end
        end
        rot(i) = i;
    end
    slope(n) = (totAngle(n)-totAngle(n-1))*30;
end

plot(t,totAngle,'.-');
plot(t,slope/6,'.-');
plot(rotTime,rot*60,"o-");
xline(aliasing,'r');

P = polyfit(t(1:aliasing(1)*30),totAngle(1:aliasing(1)*30),2);
q = polyder(P);
%M = polyfit(t,slope,1);
%mfit = polyval(M,t);
bf = polyval(P,t);
sl = polyval(q,t);

plot(t,bf);plot(t,sl/6);
% plot(t,mfit);

legend('(1) angle measured vs time','(2) total angle traversed', ...
    '(3) attempt at rev/min','(4) 2nd order poly approx of (2)', ...
    '(5)slope of 2nd order poly in rev/min','aliasing');