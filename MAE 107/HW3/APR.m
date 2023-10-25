function y = APR(i)
P = 57333;
A = 8240000;
n = 360;
y = (P/A-i)*(1+i)^n-P/A;
end