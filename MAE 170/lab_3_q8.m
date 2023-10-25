output = [208.333 416.667 583.333 833.333];
input = [200 400 600 800];
p_aliasing = [199.997 399.995 319.996 119.998];
a = 459.9940066;


plot(input, output,'xr','Markersize',10);
hold on;
plot(input, p_aliasing,'-b');
hold on;
xline(a,'--');

xlabel('Input Freq (Hz)');
ylabel('Measured Freq (Hz)');