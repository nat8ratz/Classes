% k = vector containing all ply directions
% z = ply thickness
function B = BCalc(k,E1,E2,G12,v12,z)
    Bmat = zeros(3,3,length(k));
    h = -z*length(k)/2;
    for n = 1:1:length(k)
        Q = Qbar(k(n),E1,E2,G12,v12);
        Bmat(:,:,n) = Q*((h+z*n)^2 - (h+z*(n-1))^2);
    end
    B = 0.5*sum(Bmat,3);
end