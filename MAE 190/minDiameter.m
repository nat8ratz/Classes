function d = minDiameter(Tm,Ta,Mm,Ma,fs,Dd,rd,unit,Sut,finish,prob)
    ka = kaCalc(finish,Sut,unit);
    kc = kcCalc(Ta,Tm,Ma,Mm);
    ke = keCalc(prob);
    kf = 1;
    kd = 1;

    [Kt, Kts] = KtCalc(Dd,rd);
    [A, B] = gerberAB(Ma,Mm,Ta,Tm,Kt,Kts);

    dest = 1;
    kb = kbCalc(dest,unit);
    Se = SeCalc(Sut.ka,kb,kc,kd,ke,kf);
    n = gerbern(A,B,Sut,Se,d);

end
