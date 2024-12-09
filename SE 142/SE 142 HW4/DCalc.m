% k = vector containing all ply directions
% z = ply thickness
function D = DCalc(k,E1,E2,G12,v12,z)
    Dmat = zeros(3,3,length(k));
    h = -z*length(k)/2;
    for n = 1:1:length(k)
        Q = Qbar(k(n),E1,E2,G12,v12);
        Dmat(:,:,n) = Q*((h+z*n)^3 - (h+z*(n-1))^3);
    end
    D = (1/3)*sum(Dmat,3);
end