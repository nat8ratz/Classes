function [xmax, ymax, n] = bisection(L,E,I,w)

% set true value
xt = L/sqrt(5);

% initialize (x,y) derivative test points (left, right, middle)
xl = 0;
yl = -5*xl^4 + 6*L^2*xl^2 - L^4;
xr = L;
yr = -5*xr^4 + 6*L^2*xr^2 - L^4;
xm = L/2;
ym = -5*xm^4 + 6*L^2*xm^2 - L^4;

% number of iterations
n = 1;

while xm > 1.005*xt || xm < 0.995*xt
    if yl*ym < 0 % left side of zero
        xr = xm;
        yr = ym;
        xm = xm - (xm-xl)/2; % subtract 1/2 distance from middle
    elseif ym*yr < 0
        xl = xm;
        yl = ym;
        xm = xm + (xr-xm)/2; % add half distance from middle
    else
        % if there are no zeros on either side
        disp('error: no findable zeros via this method!');
        break
    end
    ym = -5*xm^4 + 6*L^2*xm^2 - L^4;
    n = n+1;
end

xmax = xm;
fprintf('ymax:');
ymax = w/(120*E*I*L)*(-xm^5 + 2*L^2*xm^3 - L^4*xm);

end

