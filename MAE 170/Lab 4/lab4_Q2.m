f_min = 1;
f_max = 30;
RC = 0.0083
G = 1./sqrt((2*pi*f_vec*RC).^2 + 1);
fc_t = 1/(2*pi*RC)

plot(f_vec,transfer_vec,'r-o','LineWidth',2,'MarkerSize',4);
xlabel('frequency (Hz)'); % x-axis label name
ylabel('|FT|_{max}/|FT|_{max,ref}'); % y-axis label name
title('Transfer Function'); % set title as sampling rate
xlim([f_min f_max]);

hold on

plot(f_vec, G, 'b-','LineWidth',2)

yline(1/sqrt(2),'-.');
xline(fc_t,':');

x = [17 18];
y = [transfer_vec(17,1) transfer_vec(18,1)];
c = polyfit(x, y, 1);
fc_a = (1/sqrt(2) -c(2))/c(1)

xline(fc_a,'--');
legend('experimental','expected','-3dB amplitude','-3dB theor freq','-3dB exp freq');

error = abs(fc_t - fc_a)

e = error/30*100

