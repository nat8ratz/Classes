Angle = [0 25 30 45 60 70 90 110 120 135 150 155 180];
v = [2.2957 2.2355 2.1975 2.0862 1.9404 1.8245 1.5871 1.3312 1.2172 1.0734 0.95601 0.92244 0.86137;
     2.305 2.2567 2.2042 2.0915 1.9385 1.826 1.5833 1.339 1.2226 1.0736 0.95908 0.92673 0.86049;
     2.3077 2.2362 2.2012 2.0888 1.9362 1.8274 1.5859 1.3365 1.222 1.076 0.95521 0.92704 0.86246];

vavg = mean(v);
dev = std(v);

tang = 9.81*cosd(Angle);
err = 9.81*(cosd(Angle-1)-cosd(Angle+1));

radi = 9.81*sind(Angle);

[f,S] = polyfit(tang,vavg,1);
[mfit,delta] = polyval(f,tang,S);
dev2 = abs(vavg - mfit);
for n = 1:1:length(dev)
    if dev2(n) > dev(n)
        dev(n) = dev2(n);
    end
end

plot(tang, v(1,:),'ro');
hold on;
plot(tang, v(2,:),'bo');
plot(tang, v(3,:),'ko');

plot(tang,mfit,'g');
errorbar(tang,vavg,-dev,dev,-err,err,'k.');

xlabel('m/s^2');
ylabel('voltage');
legend('Data set 1','Data set 2','Data set 3','Line of best fit','Uncertainty',Location='northwest');