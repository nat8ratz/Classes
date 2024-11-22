function n = gerbern(A,B,Sut,Se,d)
    ninv = (8*A)/(pi()*d^3*Se)*(1+(1+((2*B*Se)/(A*Sut))^2)^(0.5));
    n = 1/ninv;
end