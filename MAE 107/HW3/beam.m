function y = beam(L,E,I,w,x)
y = w/(120*E*I*L)*(-x^5 + 2*L^2*x^3 - L^4*x);
end