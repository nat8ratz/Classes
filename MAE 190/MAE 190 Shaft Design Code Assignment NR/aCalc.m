function [a, as] = aCalc(Sut)
    a = (0.246 - 3.08*(10^(-3))*Sut + 1.51*(10^(-5))*Sut^2 - 2.67*(10^(-8))*Sut^3)^2;
    as = (0.190 - 2.51*(10^(-3))*Sut + 1.35*(10^(-5))*Sut^2 - 2.67*(10^(-8))*Sut^3)^2;
end