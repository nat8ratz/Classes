data = importdata("30.txt");
crosshead = data.data(:,1);
crosshead = crosshead - crosshead(1);
load = data.data(:,2);
load = load - load(1);
time = data.data(:,3);
extensometer = data.data(:,4);
extensometer = extensometer - extensometer(1);

w = 0.783;
t = 0.053;
area = t*w;

stress = load/area;

figure(1)
plot(crosshead,stress)
xlabel('Crosshead Displacement (in)');
ylabel('Stress (psi)');

ultstress = max(stress);

figure(2)
hold on;
p = polyfit(extensometer(1:207),stress(1:207),1)
y = polyval(p,extensometer(1:207));
eq = sprintf('y = %.2ex + %.2e', p);
plot(extensometer(1:254),stress(1:254),LineWidth=2)
plot(extensometer(1:207),y,LineWidth=2)
xlabel('Strain');
ylabel('Stress (psi)');
legend('Stress v. Strain Data', 'Line of Best Fit','Location','southeast')
text(min(extensometer)+0.0001, max(y)-5000, eq)
