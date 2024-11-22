function ke = keCalc(prob)
    if prob >= 99.9999
        ke = 0.620;
    elseif prob >= 99.999
        ke = 0.659;
    elseif prob >= 99.99
        ke = 0.702;
    elseif prob >= 99.9
        ke = 0.753;
    elseif prob >= 99
        ke = 0.814;
    elseif prob >= 95
        ke = 0.868;
    elseif prob >= 90
        ke = 0.897;
    else
        ke = 1;
    end
end