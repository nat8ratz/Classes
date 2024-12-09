% this function finds the local [S] matrix given material properties 
% E1, E2, G12, and v12
% [Q] matrix converts strain (epsilon) to stress (sigma)
% NOTE: this function is for plane stress (3x3 matrix) only
function Q = Qlocal(E1,E2,G12,v12)
    S = Slocal(E1,E2,G12,v12);
    Q = inv(S);
end