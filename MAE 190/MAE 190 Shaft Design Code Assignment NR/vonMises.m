function maxStress = vonMises(Mstress,Tstress)
    maxStress = sqrt(Mstress^2 + 3*Tstress^2);
end