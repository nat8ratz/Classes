function d = gerberd(A,B,Sut,Se,n)
    d =((8*n*A)/(pi()*Se)*(1+(1+((2*B*Se)/(A*Sut))^2)^(0.5)))^(1/3);
end