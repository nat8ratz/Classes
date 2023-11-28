% Aluminum
Alp = 2707; Alc = 879; Alk = 204;

% Acrylic
Acp = 1180; Acc = 2000; Ack = 0.2;

% initialize measurements in meters
d = 0.00081;
A = 2*(0.0381^2)+4*(0.0381*0.00081);
V = 0.00081*0.0381^2;
L = V/A;

Aldecay = (Alk*A)/(Alp*Alc*d*V)
Acdecay = (Ack*A)/(Acp*Acc*d*V)