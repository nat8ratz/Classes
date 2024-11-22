function [Kf, Kfs] = KfCalc(Kt, Kts, rd, d, a, as)
    r = rd*d;
    Kf = 1 + (Kt-1)/(1+sqrt(a/r));
    Kfs = 1 + (Kts-1)/(1+sqrt(as/r));
end
