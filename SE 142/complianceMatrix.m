function S = complianceMatrix(E1, E2, E3, v12, v13, v23, G12, G13, G23)
    v21 = E2*v12/E1;
    v31 = E3*v13/E1;
    v32 = E3*v23/E2;
    S = [1/E1 -v21/E2 -v31/E3 0 0 0;
         -v12/E1 1/E2 -v32/E3 0 0 0;
         -v13/E1 -v23/E2 1/E3 0 0 0;
         0 0 0 1/G23 0 0;
         0 0 0 0 1/G13 0;
         0 0 0 0 0 1/G12];
end    