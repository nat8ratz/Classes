t = 0:(1/30):(193/30);

%setup an adjusted angle vector (for total accumulated angle)
frames = 194;
adjustedangle=angled;
for i=2:frames
if angled(i)<180 & angled(i-1)>180 % check for crossing from 360 to 0
adjustedangle(i:frames)=adjustedangle(i:frames)+360;
end
% check for >180 degree motion
if abs(adjustedangle(i)-adjustedangle(i-1))>180
% if so, undo the prior addition
adjustedangle(i:frames)=adjustedangle(i:frames)-360;
end
end
plot(t,adjustedangle);
hold on;
plot(t,angled);
%plot(t,slope);