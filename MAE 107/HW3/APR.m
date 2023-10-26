function y = apr(i)
P = 57333;
A = 8240000;
n = 360;
y = A * ((i*(1+i)^n)/((1+i)^n-1)) - P;
end