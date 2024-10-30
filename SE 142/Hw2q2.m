t = -90:1:90;

S = Slocal(140,10,7,0.3);

% equation 3.13 from the reader to find Sbar12 and Sbar22
S12 = S(1,2)*((sind(t)).^4 + (cosd(t)).^4) + (S(1,1)+S(2,2)-S(3,3))*(sind(t)).^2.*(cosd(t)).^2;
S22 = S(1,1)*(sind(t)).^4 + (2*S(1,2)+S(3,3))*(sind(t)).^2.*(cosd(t)).^2 + S(2,2)*(cosd(t)).^4;

% equation to solve for sigmaYY /sigma0
y = -S12 ./ S22;

plot(t,y);
ylabel('σ_y_y/σ_o');
xlabel('θ (degrees)');
title('σ_y_y/σ_o vs θ');