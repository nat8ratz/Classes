%[pks_ref, loc_ref] = findpeaks(recMatrix_ref,'SortStr', 'descend', 'NPeaks', 5)
%[pks_sig, loc_sig] = findpeaks(recMatrix_sig,'SortStr', 'descend', 'NPeaks', 1)

[pks_ref, loc_ref] = findpeaks(recMatrix_ref(:),MinPeakDistance=10,MinPeakHeight=0.05);
[pks_sig, loc_sig] = findpeaks(recMatrix_sig(loc_ref(3):1:588,1),MinPeakDistance=10,MinPeakHeight=0.01);
plot(recMatrix_sig);hold on;plot(recMatrix_ref);
loc_sig = loc_sig + loc_ref(3);

plot(loc_ref,pks_ref,'o');plot(loc_sig,pks_sig,'o')

delay = (loc_sig(1)-loc_ref(1))/100

dist = sqrt(0.15^2+0.3^2)

speed = dist/delay*1000
theor = dist/340*1000

err = delay-theor




