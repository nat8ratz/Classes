% k = vector containing all ply directions
% z = ply thickness
function A = ACalc(k,E1,E2,G12,v12,z)
    Amat = zeros(3,3,length(k));
    for n = 1:1:length(k)
        Q = Qbar(k(n),E1,E2,G12,v12);
        Amat(:,:,n) = Q;
    end
    A = z*sum(Amat,3);
end