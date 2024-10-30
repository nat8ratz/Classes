% this equation calculates [T]sigma given a fiber angle using trig
% relations
% NOTE: for plane stress only, and angle given in degrees
function Ts = Tsigma(t)
    Ts = [cosd(t)^2 sind(t)^2 2*sind(t)*cosd(t);
          sind(t)^2 cosd(t)^2 -2*sind(t)*cosd(t);
          -cosd(t)*sind(t) cosd(t)*sind(t) cosd(t)^2-sind(t)^2];
end