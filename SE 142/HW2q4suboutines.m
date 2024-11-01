% Question 4

t = 20;
% Properties from appendix for AS4/3501-6 in english units
E1 = 21.3;
E2 = 1.50;
G12 = 1.00;
v12 = 0.27;

% Part a
Qb = Qbar(t,E1,E2,G12,v12)
Sb = Sbar(t,E1,E2,G12,v12)

% Part b
BglobalStress = [0.032; -0.002; -0.005];

BlocalStrain = sG2eL(BglobalStress,t,E1,E2,G12,v12)
BglobalStrain = sG2eG(BglobalStress,t,E1,E2,G12,v12)

% Part c
Ct = -25;
ClocalStress = [330; 0; 0];
CglobalStrain = sL2eG(ClocalStress,t,E1,E2,G12,v12)

% The following subroutines reference functions with equations below them,
% and the naming convention for each subroutine is 'sL' for strss, local,
% 'sG' for stress, global, 'eL' for strain, local, and 'eG' for strain,
% global. The first name is the input type, and the second name after the 2
% is the output type.

% local stress to global stress
function globalStress = sL2sG(slocal,t)
    Te = Tepsilon(t);
    globalStress = (Te')*slocal;
end

% local stress to global strain
function globalStrain = sL2eG(slocal,t,E1,E2,G12,v12)
    S = Slocal(E1,E2,G12,v12);
    Te = Tepsilon(t);
    globalStrain = (Te')*S*slocal;
end

% local stress to local strain
function localStrain = sL2eL(slocal,E1,E2,G12,v12)
    S = Slocal(E1,E2,G12,v12);
    localStrain = S*slocal;
end

% local strain to global stress
function globalStress = eL2sG(elocal,t,E1,E2,G12,v12)
    Q = Qlocal(E1,E2,G12,v12);
    Ts = Tsigma(t);
    globalStress = (Ts')*Q*elocal;
end

% local strain to global strain
function globalStrain = eL2eG(elocal,t)
    Ts = Tsigma(t);
    globalStrain = (Ts')*elocal;
end

% local strain to local stress
function localStress = eL2sL(elocal,E1,E2,G12,v12)
    Q = Qlocal(E1,E2,G12,v12);
    localStress = Q*elocal;
end

% global stress to local stress
function localStress = sG2sL(sglobal,t)
    Ts = Tsigma(t);
    localStress = Ts*sglobal;
end

% global stress to global strain
function globalStrain = sG2eG(sglobal,t,E1,E2,G12,v12)
    Sb = Sbar(t,E1,E2,G12,v12);
    globalStrain = Sb*sglobal;
end

% global stress to local strain
function localStrain = sG2eL(sglobal,t,E1,E2,G12,v12)
    Ts = Tsigma(t);
    S = Slocal(E1,E2,G12,v12);
    localStrain = Ts*S*sglobal;
end

% global strain to local strain
function localStrain = eG2eL(eglobal,t)
    Te = Tepsilon(t);
    localStrain = Te*eglobal;
end

% global strain to global stress
function globalStress = eG2sG(eglobal,t,E1,E2,G12,v12)
    Qb = Qbar(t,E1,E2,G12,v12)
    globalStress = Qb*eglobal;
end

% global strain to local stress
function localStress = eG2sL(eglobal,t,E1,E2,G12,v12)
    Te = Tepsilon(t);
    Q = Qlocal(E1,E2,G12,v12);
    localStress = Te*Q*eglobal;
end

% The below functions are used for calculations in the subroutines.

% this equation finds the global [S] matrix given the fiber angle t, as well
% as material properties E1, E2, G12, and v12
% [S] matrix converts stress (sigma) to strain (epslion)
% NOTE: this function is for plane stress (3x3 matrix) only
function Sbar = Sbar(t,E1,E2,G12,v12)
Ts = Tsigma(t);
S = Slocal(E1,E2,G12,v12);
Sbar = (Ts')*S*Ts;
end

% this equation finds the global [Q] matrix given the fiber angle t, as well
% as material properties E1, E2, G12, and v12
% [Q] matrix converts strain (epsilon) to stress (sigma)
% NOTE: this function is for plane stress (3x3 matrix) only
function Qbar = Qbar(t,E1,E2,G12,v12)
    Te = Tepsilon(t);
    Q = Qlocal(E1,E2,G12,v12);
    Qbar = (Te')*Q*Te;
end

% this function finds the local [S] matrix given material properties 
% E1, E2, G12, and v12
% [S] matrix converts stress (sigma) to strain (epslion)
% NOTE: this function is for plane stress (3x3 matrix) only
function S = Slocal(E1,E2,G12,v12)
    S = [1/E1 -v12/E1 0;
         -v12/E1 1/E2 0;
          0 0 1/G12];
end

% this function finds the local [S] matrix given material properties 
% E1, E2, G12, and v12
% [Q] matrix converts strain (epsilon) to stress (sigma)
% NOTE: this function is for plane stress (3x3 matrix) only
function Q = Qlocal(E1,E2,G12,v12)
    S = Slocal(E1,E2,G12,v12);
    Q = inv(S);
end

% this equation calculates [T]sigma given a fiber angle using trig
% relations
% NOTE: for plane stress only, and angle given in degrees
function Ts = Tsigma(t)
    Ts = [cosd(t).^2 sind(t).^2 2*sind(t).*cosd(t);
          sind(t).^2 cosd(t).^2 -2*sind(t).*cosd(t);
          -cosd(t).*sind(t) cosd(t).*sind(t) cosd(t).^2-sind(t).^2];
end

% this equation calculates [T]epsilon given a fiber angle using trig
% relations
% NOTE: for plane stress only, and angle given in degrees
function Te = Tepsilon(t)
    Te = [cosd(t)^2 sind(t)^2 sind(t)*cosd(t);
          sind(t)^2 cosd(t)^2 -sind(t)*cosd(t);
          -2*cosd(t)*sind(t) 2*cosd(t)*sind(t) cosd(t)^2-sind(t)^2];
end