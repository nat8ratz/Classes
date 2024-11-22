function [A,B] = gerberAB(Ma,Mm,Ta,Tm,Kf,Kfs)
    A = sqrt(4*(Kf*Ma)^2 + 3*(Kfs*Ta)^2);
    B = sqrt(4*(Kf*Mm)^2 + 3*(Kfs*Tm)^2);
end