K = [3 -1 -1; -1 2 -1; -1 -1 3]
C = 0.1.*K
I = eye(3)
syms l
ans = det(l^2.*I + l.*C + K)

p = [1 4/5 409/50 451/125 456/25 12/5 8]
r = roots(p)

rt = abs(r).^2
