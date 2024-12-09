% k = vector containing all ply directions
% z = ply thickness
function [A,B,D] = ABDCalc(k,E1,E2,G12,v12,z)
    A = ACalc(k,E1,E2,G12,v12,z);
    B = BCalc(k,E1,E2,G12,v12,z);
    D = DCalc(k,E1,E2,G12,v12,z);
end