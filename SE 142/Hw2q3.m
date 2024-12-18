% Question 3

% Part a
% sg is the given global stress, and slocal is the resulting local stress
% when the fiber angle is 20 degrees. The units for both are in ksi.
sg = [32; -2; -5];
slocal = Tsigma(20) * sg

% Part b
% sl is the given local stress, and sglobal is the resulting global stress
% when the fiber angle is 60 degrees. The units for both are in MPa.
sl = [2280; 0; 0];
Ts = Tsigma(60);
sglobal = inv(Ts) * sl

% this equation calculates [T]sigma given a fiber angle using trig
% relations
% NOTE: for plane stress only, and angle given in degrees
function Ts = Tsigma(t)
    Ts = [cosd(t).^2 sind(t).^2 2*sind(t).*cosd(t);
          sind(t).^2 cosd(t).^2 -2*sind(t).*cosd(t);
          -cosd(t).*sind(t) cosd(t).*sind(t) cosd(t).^2-sind(t).^2];
end