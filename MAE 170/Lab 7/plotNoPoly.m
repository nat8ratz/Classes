t = 0:(1/30):(193/30);
frames = 194;
angles = angled(1:frames);
tiledlayout(3,1);

for n = 2:1:194
    if angles(n) < 1
        angles(n) = angles(n) + 360;
    end
end

totAngle = angles - angles(1);
slope = zeros(1,194);
aliasing = zeros(1,5);

count = 0;
for n = 2:1:194
    if totAngle(n-1) > totAngle(n)
        totAngle(n:1:194) = 360 + totAngle(n:1:194);
    end
    if totAngle (n) > totAngle(n-1)+180 && count < 5
        count = count+1;
        aliasing(count) = n-1;
    end

    slope(n) = (totAngle(n)-totAngle(n-1))*30/6;
end

M = polyfit(t,slope,1);
mfit = polyval(M,t);

nexttile;
plot(t,angles,'b.-');
ylabel('angle (degrees)');
xline(aliasing/30);
nexttile;
plot(t,totAngle,'k.-');
ylabel('angle (degrees)');
xline(aliasing/30);
nexttile;
plot(t,slope,'r.');
hold on;
plot(t,mfit,'k');
txt = sprintf('y = %f * x + %f', M(1),M(2));
text(0.1, 1250, txt);
ylabel('rev/min');
xlabel('time (s)');
xline(aliasing/30);