function [sa, sb] = pStress(sx,sy,txy)
    savg = (sx+sy)/2
    tmax = sqrt(((sx-sy)/2)^2 + txy^2)
    sa = savg + tmax;
    sb = savg - tmax;
end