x = 2*pi*f_vec;
y = sqrt(1./(transfer_vec.^2)-1);

% Get coefficients of a line fit through the data.
co = polyfit(x, y, 1);
m = co(1)
b = co(2)
% Create a new x axis with exactly 1000 points (or whatever you want).
xFit = linspace(min(x), max(x), 30);
% Get the estimated yFit value for each of those 1000 new x locations.
yFit = polyval(coefficients , xFit);
% Plot everything.
plot(x, y, 'ro', 'MarkerSize', 5); % Plot training data.
hold on; % Set hold on so the next plot does not blow away the one we just drew.
plot(xFit, yFit, 'b-', 'LineWidth', 0.75); % Plot fitted line.
xlabel('2*pi*f_v_e_c');
ylabel('(1/(T_v_e_c)^2 - 1)^1^/^2');
legend('raw data', 'polyfit');
txt = sprintf('y = %.4f * x + %.4f', m, b);
text(10, 1.7, txt);
title('Normalized TF');
grid on;
