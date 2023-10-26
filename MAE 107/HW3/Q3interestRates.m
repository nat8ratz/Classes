x0 = 0.000000001;
L = 1;
f = @apr;
err = 0.0001;
[i, count] = falsePosition(x0,L,f,err)

APR = 12*i

function y = apr(i)
P = 57333;
A = 8240000;
n = 360;
y = A * ((i*(1+i)^n)/((1+i)^n-1)) - P;
end

function [xmax, count] = falsePosition(x0,L,f,err)

% initialize (x,y) test points (left, right) & approx error (e)
xl = x0;
xr = L;
yl = f(xl);
yr = f(xr);
e = abs(xl-xr);

% first slope iteration and middle point
s = (yr-yl)/(xr-xl);
xm = -yr/s + xr;
ym = f(xm);

% count for number of iterations
count = 1;

while e > err
    if yl*ym < 0 % zero on left side of xm
        xr = xm;
        yr = ym;
    elseif ym*yr < 0 % zero on right side of xm
        xl = xm;
        yl = ym;
    else % no zeros on either side
        disp('error: no findable zeros via this method!');
        break
    end
    % update error, count, slope, and middle point values
    e = abs(xr-xl);
    s = (yr-yl)/(xr-xl);
    xm = xl-yl/s;
    ym = f(xm);
    count = count+1;
end

xmax = xm;
end