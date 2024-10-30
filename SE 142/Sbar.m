% this equation finds the global [S] matrix given the fiber angle t, as well
% as material properties E1, E2, G12, and v12
% [S] matrix converts stress (sigma) to strain (epslion)
% NOTE: this function is for plane stress (3x3 matrix) only
function Sbar = Sbar(t,E1,E2,G12,v12)
Ts = Tsigma(t);
S = Slocal(E1,E2,G12,v12);
Sbar = (Ts')*S*Ts;
end