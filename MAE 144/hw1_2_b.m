b = RR_poly([-2 2 -5 5],1)
a = RR_poly([-1 1 -3 3 -6 6],1)
f6 = RR_poly([-1 -1 -3 -3 -6 -6 -20 -20 -20 -20 -20 -20],1)

[x,y,r,t] = RR_diophantine(a,b,f6)
test = trim(a*x + b*y)
residual = norm(f6-test)