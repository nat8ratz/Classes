A = load("SD_temperature.dat");
years = A(:,1).';
octTemp = A(:,11).';
avgOct = mean(octTemp);
maxT = max(octTemp);
minT = min(octTemp);
maxYr = years(octTemp == maxT);
minYr = years(octTemp == minT);

warm = 0;
cold = 0;
for i = 1:length(octTemp)
    if octTemp(i) >= 70
        warm = warm+1;
    elseif octTemp(i) <= 62
        cold = cold+1;
    end
end

hold on;
figure(1);
plot(years,octTemp,'k-');
yline(avgOct,'b-');
plot(maxYr,maxT,'rsquare');
plot(minYr,minT,'gdiamond');
xlabel('Years');
ylabel('Temp (F)');
legend('Temp','Avg Temp','Max Temp','Min Temp','Location','northwest');
title('October Temperatures vs Years')

figure(2);
histogram(octTemp,59:73)