% k = vector containing all ply directions
% z = ply thickness
function alphaGlobal = aGlobal(k,E1,E2,G12,v12,dT,z,a1,a2)
    Nt = NtCalc(k,E1,E2,G12,v12,dT,z,a1,a2);
    [A,B,D] = ABDCalc(k,E1,E2,G12,v12,z);
    [alpha,~,~] = AlphaBetaDeltaCalc(A,B,D);
    Eo = tempStrain(alpha,Nt);
    alphaGlobal = Eo/dT;
end