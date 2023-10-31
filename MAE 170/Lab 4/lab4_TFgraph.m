plot(f_vec,transfer_vec,'r-o','LineWidth',2,'MarkerSize',4);
xlabel('frequency (Hz)'); % x-axis label name
ylabel('|FT|_{max}/|FT|_{max,ref}'); % y-axis label name
title('Transfer Function'); % set title as sampling rate
xlim([f_min f_max]);