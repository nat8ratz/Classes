function kc = kcCalc(Ta,Tm,Ma,Mm)
    if Ta > 0 || Tm > 0
        kc = 0.59;
    elseif Ma > 0 || Mm > 0
        kc = 0.85;
    else
        kc = 1;
    end
end
