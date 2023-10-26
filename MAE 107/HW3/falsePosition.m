function [xmax, count] = falsePosition(x0,L,f,err)

% initialize (x,y) test points (left, right)
xl = x0;
xr = L;
yl = f(xl)
yr = f(xr)
e = xl-xr;

s = (yr-yl)/(xr-xl);
xm = -yr/s + xr;
ym = f(xm);

% count for number of iterations
count = 1;

while e > err
    if yl*ym < 0 % left side of zero
        xr = xm;
        yr = ym;
        disp('left');
    elseif ym*yr < 0
        xl = xm;
        yl = ym;
        disp('right');
    else
        % if there are no zeros on either side
        disp('error: no findable zeros via this method!');
        break
    end
    e = abs(xr-xl);
    s = (yr-yl)/(xr-xl);
    xm = xl-yl/s;
    ym = f(xm)
    count = count+1;
end

xmax = xm;
end