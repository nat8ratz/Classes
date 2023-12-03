workingDir = pwd;
name = ['001.jpg']; % filename of the first frame
filename = fullfile(workingDir,'images',name); % 1st frame filename with path
testfig=imread(filename); % load the first frame into matlab
figure(01) % setup the first figure
imshow(testfig); % plot the first frame
h=gca; % get the handle for the current plot axes
h.Visible='On'; % get the handle for the current plot
title('Original Image'); % set the plot title

min = 250;
max = 1000;
sens = 0.99;
[circle.center,circle.radii] = imfindcircles(testfig,[min,max],'ObjectPolarity','bright','Sensitivity',sens);
viscircles(circle.center,circle.radii);

diskradius = 38;
pixdim = [720 960];
res = diskradius/circle.radii;
dim = pixdim * res;