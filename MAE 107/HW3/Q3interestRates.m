f = @APR;
L = 0.1;
P = 57333;
A = 8240000;
n = 360;
err = 0.0001
[i, n] = falsePosition(L,f,err)

function [xmax, n] = falsePosition(L,f,err)

% initialize (x,y) test points (left, right)
xl = 0.0000001;
yl = f(xl)
xr = L;
yr = f(xr)
e = L;

s = (yr-yl)/(xr-xl);
xm = -yr/s + xr;
ym = f(xm);

% count for number of iterations
n = 1;

while e > err
    if yl*ym < 0 % left side of zero
        e = xl-zm
        xr = xm;
        yr = ym;
        xm = xm - (xm-xl)/2; % subtract 1/2 distance from middle
    elseif ym*yr < 0
        e = xm-xr
        xl = xm;
        yl = ym;
        xm = xm + (xr-xm)/2; % add half distance from middle
    else
        % if there are no zeros on either side
        disp('error: no findable zeros via this method!');
        break
    end
    s = (yr-yl)/(xr-xl);
    xm = -yr/s + xr;
    ym = f(xm);
    n = n+1;
end

xmax = xm;
end