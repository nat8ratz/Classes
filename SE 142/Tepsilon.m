% this equation calculates [T]epsilon given a fiber angle using trig
% relations
% NOTE: for plane stress only, and angle given in degrees
function Te = Tepsilon(t)
    Te = [cosd(t)^2 sind(t)^2 sind(t)*cosd(t);
          sind(t)^2 cosd(t)^2 -sind(t)*cosd(t);
          -2*cosd(t)*sind(t) 2*cosd(t)*sind(t) cosd(t)^2-sind(t)^2];
end