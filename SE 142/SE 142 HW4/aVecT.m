function alphaVec = aVecT(t,a1,a2)
    Ts = Tsigma(t);
    a = [a1;a2;0];
    alphaVec =(Ts')*a;
end