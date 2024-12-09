% k = vector containing all ply directions
% z = ply thickness
function NT = Nt(k,E1,E2,G12,v12,dT,z,a1,a2)
    N = zeros(3,length(k));
    for n = 1:1:length(k)
        Q = Qbar(k(n),E1,E2,G12,v12);
        a = aVecT(k(n),a1,a2);
        N(:,n) = Q*a;
    end
    NT = dT*z*sum(N,"all");
end