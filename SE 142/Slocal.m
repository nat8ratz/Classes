% this function finds the local [S] matrix given material properties 
% E1, E2, G12, and v12
% [S] matrix converts stress (sigma) to strain (epslion)
% NOTE: this function is for plane stress (3x3 matrix) only
function S = Slocal(E1,E2,G12,v12)
    S = [1/E1 -v12/E1 0;
         -v12/E1 1/E2 0;
          0 0 1/G12];
end