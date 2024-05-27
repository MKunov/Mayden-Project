T = readtable('Bris.csv');

rowOfInterest = 142; % Row from table corresponding to the metric we've 
                     % decided to care about, 207 and 208 are leng
measureTitle = T{rowOfInterest-1, 1};
measureTitle = measureTitle{1, 1};
measureTitle = strrep(measureTitle, '_', ' ');

measure = T(rowOfInterest-1, 2:end);
measure = table2array(measure);

months = 1:length(measure);


% plot time series data
boundaries = [4.5, 16.5, 28.5];

plot(months, measure)
hold on
title([measureTitle, ' time series'])
xlabel('Month (from September 2020)')
ylabel(measureTitle)
% Add vertical lines to mark section boundaries
for i = 1:length(boundaries)
    xline(boundaries(i), '--', 'LineWidth', 0.5);  % You can adjust the line style and color
end
hold off

% autocorrelations
[acf, h] = autocorr(measure);
% confidence interval
c = 2 / (length(measure)).^(0.5);
% Plot autocorrelation graph
figure
stem(h, acf, 'filled');
hold on
title(['Autocorrelation of ', measureTitle]);
xlabel('Lag');
ylabel('Autocorrelation');
plot([0, length(h)], [c, c], '--r');
plot([0, length(h)], [-c, -c], '--r');
hold off



