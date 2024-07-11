clear all;
close all;
clc;
format long;

name = 'Natalie Ratzlaff';
id = 'A17091327';
hw_num = 2;

a = 77;
b = 30;
c = 25;
g = 2;
da = 0.5;
db = 0.1;
dc = 0.1;
dg = 0.8;

p1a = a - b - c - g
p1b = dg + da + db + dc
p1c = sqrt(dg^2 + da^2 + db^2 + dc^2)

bmax = b + 0.5;
bmin = b - 0.3;

p2a = (bmax + bmin + b)/3
p2b = b
p2c = bmin + sqrt(0.5*(b-bmin)*(bmax-bmin))
p2d = (30 - bmin)/(bmax-bmin)
p2e = bmin + 0.9*(bmax-bmin)

L = 135;
p = 1.19;
v = 33.4;
S = 4;
dL = 0.5/L;
dp = 0.001/p;
dv = 0.5/v;
dS = 0.03/S;

p3a = Cl(L,p,v,S)
p3b = p3a*(dL + dp + 2*dv + dS)
p3c = p3a*sqrt(dL^2 + dp^2 + 2*dv^2 + dS^2)

rng('default');
mcL = makedist('Uniform','Lower',134.5,'Upper',135.5);
gL = random(mcL,1,25000);
mcp = makedist('Triangular','A',1.189,'B',1.19,'C',1.191);
gp = random(mcp,1,25000);
mcv = makedist('Triangular','A',32.9,'B',33.4,'C',33.9);
gv = random(mcv,1,25000);
mcS = makedist('Normal','mu',4,'sigma',0.03);
gS = random(mcS,1,25000);
gC = Cl(gL,gp,gv,gS);

figure(1);
subplot(2,3,1);
histogram(gL);
xlabel('Lift (N)');
ylabel('number of points');
title('Lift Histogram');
subplot(2,3,2);
histogram(gp);
xlabel('Fluid Density (kgm^-^3)');
ylabel('number of points');
title('Fluid Density Histogram');
subplot(2,3,3);
histogram(gv);
xlabel('Airspeed (ms^-^1)');
ylabel('number of points');
title('Airspeed Histogram');
subplot(2,3,4);
histogram(gS);
xlabel('Air Foil Area (m^2)');
ylabel('number of points');
title('Air Foil Area Histogram');
subplot(2,3,5);
histogram(gC);
xlabel('Lift Coefficient C_L');
ylabel('number of points');
title('Lift Coefficient Histogram');

p3d = 'See figure 1'

ef = mle(gC);
p3e = ef(1)
p3f = ef(2)

distCl = makedist('normal','mu',ef(1),'sigma',ef(2));
p3g = cdf(distCl, 0.05)

function C = Cl(L,p,v,S)
    C = L./(0.5.*p.*v.^2.*S);
end