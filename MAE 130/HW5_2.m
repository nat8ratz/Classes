M = [1 0; 0 0.5]
K = [3 -1; -1 1]
syms a b l
C = a.*M + b.*K
ans = det(M.*l^2 + C.*l + K)

p = [0.5 a+5/2*b 0.5*a^2+5/2*a*b+2*b^2+5/2 5/2*a+4*b 2]
r = roots(p)
rt = r.^2