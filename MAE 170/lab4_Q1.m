x = 2*pi*f_vec;
y = sqrt(1./(transfer_vec.^2)-1);

% Get coefficients of a line fit through the data.
coefficients = polyfit(x, y, 1)
% Create a new x axis with exactly 1000 points (or whatever you want).
xFit = linspace(min(x), max(x), 30);
% Get the estimated yFit value for each of those 1000 new x locations.
yFit = polyval(coefficients , xFit);
% Plot everything.
plot(x, y, 'r.', 'MarkerSize', 15); % Plot training data.
hold on; % Set hold on so the next plot does not blow away the one we just drew.
plot(xFit, yFit, 'b-', 'LineWidth', 1); % Plot fitted line.
grid on;
