function kb = kbCalc(d,unit)
    if unit == 2
        if d <= 2
            kb = (d/0.3)^(-0.107);
        elseif d <= 10
            kb = 0.91*d^(-0.157);
        else
            kb = 0.91*10^(-0.157);
        end
    else
        if d <= 0.051
            kb = (d/7.62)^(-0.107);
        elseif d <= 0.254
            kb = 1.51*d^(-0.157);
        else
            kb = 1.51*(0.254)^(-0.157);
        end
    end
end