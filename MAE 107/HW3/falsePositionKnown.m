function [xmax, n] = falsePositionKnown(L,f,xt,err)

% initialize (x,y) test points (left, right)
xl = 0
yl = f(xl,L);
xr = L;
yr = f(xr,L);

xm = L/2;
ym = f(xm,L);

% count for number of iterations
n = 1;

while xm > (1+err)*xt || xm < (1-err)*xt
    if yl*ym < 0 % left side of zero
        xr = xm;
        yr = ym;
    elseif ym*yr < 0
        xl = xm;
        yl = ym;
    else
        % if there are no zeros on either side
        disp('error: no findable zeros via this method!');
        break
    end
    s = (yr-yl)/(xr-xl);
    xm = -yr/s + xr;
    ym = f(xm,L);
    n = n+1;
end

xmax = xm;
end
