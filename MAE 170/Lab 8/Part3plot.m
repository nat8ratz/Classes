Rdist = [0.05 0.05 0.1 0.1 0.25 0.25 0.5 0.5 0.75 0.75 1 1 1.25 1.5 1.5 1.75 2 2 2.25 2.3 2.35 2.4 2.45 2.5 2.5 2.5 2.75 3 3 3.5 4 4.5 5];
Edist = [211 207 501 507 1350 1375 2772 2785 4221 4202 5464 5618 7084 8561 8571 9962 11415 11487 12862 13126 13438 13693 14052 14323 14363 14386 14490 14514 14487 14517 14515 14540 14541];
plot(Rdist,Edist, 'o')
hold on;

f = polyfit(Rdist(1:1:26),Edist(1:1:26),1)
mfit = polyval(f,Rdist(1:1:26));
plot(Rdist(1:1:26),mfit);
legend('Data Points','Line of Best Fit',Location='northwest');
xlabel('Distance (m)');
ylabel('Duration Quantity (μs)');