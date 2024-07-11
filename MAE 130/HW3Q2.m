w = 0:0.1:20;
n = 1;
a = 2/length(u)*sum(u.'.*cos(n.*w.*t.'));
b = 2/length(u)*sum(u.'.*sin(n.*w.*t.'));
c = sqrt(a.^2+b.^2);
stem(w,c);
hold on;
xlabel('ω_n');
ylabel('C_n');
