% k = vector containing all ply directions
% z = ply thickness
function Mt = MtCalc(k,E1,E2,G12,v12,dT,z,a1,a2)
    M = zeros(3,length(k));
    h = -z*length(k)/2;
    for n = 1:1:length(k)
        Q = Qbar(k(n),E1,E2,G12,v12);
        a = aVecT(k(n),a1,a2);
        M = Q*a*((h+z*n)^2 - (h+z*(n-1))^2);
    end
    Mt = dT*z*sum(M,2);
end