function ka = kaCalc(finish,Sut,unit)
    a = finish(unit);
    b = finish(3);
    ka = a*Sut^b;
end