[pks_ref, loc_ref] = findpeaks(recMatrix_ref,'SortStr', 'descend', 'NPeaks', 5)
[pks_sig, loc_sig] = findpeaks(recMatrix_sig,'SortStr', 'descend', 'NPeaks', 1)

delay = (loc_sig-loc_ref(3))*5.88/588
speed = 0.335/delay*1000