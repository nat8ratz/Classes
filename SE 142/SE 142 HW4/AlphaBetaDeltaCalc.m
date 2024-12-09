function [a,b,d] = AlphaBetaDeltaCalc(A,B,D)
    d = inv(D - B*inv(A)*B);
    b = -inv(A)*B*d;
    a = inv(A) + inv(A)*B*d*B*inv(A);
end