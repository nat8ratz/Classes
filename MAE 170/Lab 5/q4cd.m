%for x = 1:1:30
x=15
y = 3

plot(recMatrix_sig(:,x,y));hold on;plot(recMatrix_ref(:,x,y))

[pks_ref, loc_ref] = findpeaks(recMatrix_ref(:,x,y),MinPeakDistance=10,MinPeakHeight=0.25);
[pks_sig, loc_sig] = findpeaks(recMatrix_sig(loc_ref(3):1:588,x,y),MinPeakDistance=10,MinPeakHeight=0.25);

loc_sig = loc_sig + loc_ref(3);

plot(loc_ref,pks_ref,'o');plot(loc_sig,pks_sig,'o')

delay(x) = loc_sig(1)-loc_ref(1);

%end

%plot(delay)
% 2.5mm