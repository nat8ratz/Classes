for x = 1:1:30
y = 3;
[pks_ref, loc_ref] = findpeaks(recMatrix_ref(:,x,y),MinPeakDistance=10,MinPeakHeight=0.25);
[pks_sig, loc_sig] = findpeaks(recMatrix_sig(loc_ref(3):1:588,x,y),MinPeakDistance=10,MinPeakHeight=0.25);
loc_sig = loc_sig + loc_ref(3);
delay(x) = (loc_sig(1)-loc_ref(1))/100;
end

stepSize = 23/3
xvec = (stepSize:stepSize:230)

plot(xvec,delay,'xb',MarkerSize=10,LineWidth=2.5);
hold on
ylim([0,1.3])
ylabel('Time Delay (ms)')
xlabel('X-Position (mm)')


speed = 307.7158;
d1 = sqrt(0.30^2+0.128^2)*1000;
d30 = sqrt(0.07^2+0.128^2)*1000;
t1 = d1/speed;
t30 = d30/speed;
slope = (t30-t1)/230

plot(stepSize:230-stepSize:230,[t1 t30],LineWidth=2)

pf = polyfit(xvec,delay,1)
m = pf(1); b = pf(2);



fitline = m*(xvec)+b;
plot(xvec, fitline,'r-',LineWidth=2)

errorbar(xvec,delay,-1/5,1/5,-2.5,2.5,'k');
legend('Data Points','Speed of Sound','Line of Best Fit')
txt = sprintf('y = %.4f * x + %.4f', m, b);


text(150, 0.25, txt);

deltax = d1-d30

scaling = -deltax/230

speedfinal = scaling * 1/m
