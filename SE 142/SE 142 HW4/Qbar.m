% this equation finds the global [Q] matrix given the fiber angle t, as well
% as material properties E1, E2, G12, and v12
% [Q] matrix converts strain (epsilon) to stress (sigma)
% NOTE: this function is for plane stress (3x3 matrix) only
function Qbar = Qbar(t,E1,E2,G12,v12)
    Te = Tepsilon(t);
    Q = Qlocal(E1,E2,G12,v12);
    Qbar = (Te')*Q*Te;
end