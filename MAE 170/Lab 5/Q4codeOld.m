for x = 1:1:30
y = 3;
[pks_ref, loc_ref] = findpeaks(recMatrix_ref(:,x,y),MinPeakDistance=10,MinPeakHeight=0.25);
[pks_sig, loc_sig] = findpeaks(recMatrix_sig(loc_ref(3):1:588,x,y),MinPeakDistance=10,MinPeakHeight=0.25);
loc_sig = loc_sig + loc_ref(3);
delay(x) = (loc_sig(1)-loc_ref(1))/100;
end

plot(10:10:300,delay,'xb',MarkerSize=10,LineWidth=2.5);
hold on
ylim([0,1.3])
ylabel('Time Delay (ms)')
xlabel('X-Position (mm)')


speed = 307.7158;
d1 = sqrt(0.29^2+0.12^2)*1000;
d30 = 120;
t1 = d1/speed;
t30 = d30/speed;
slope = (t30-t1)/290

plot(10:290:300,[t1 t30],LineWidth=2)

pf = polyfit(10:10:300,delay,1)
m = pf(1); b = pf(2);



fitline = m*(10:10:300)+b;
plot(10:10:300, fitline,'r-',LineWidth=2)

errorbar(10:10:300,delay,-1/5,1/5,-2.5,2.5,'k');
legend('Data Points','Speed of Sound','Line of Best Fit')
txt = sprintf('y = %.4f * x + %.4f', m, b);


text(200, 0.25, txt);

deltax = d1-d30

scaling = -deltax/290

speedfinal = scaling * 1/m
