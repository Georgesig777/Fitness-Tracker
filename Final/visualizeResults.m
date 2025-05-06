function visualizeResults(activityNames, stepCounts, calorieCounts)
% Creates bar and pie charts to visualize fitness tracker results.
% INPUTS:
%   activityNames  - cell array of strings (e.g., {'sitting','walking','running'})
%   stepCounts     - numeric array of steps [17, 350, 425]
%   calorieCounts  - numeric array of calories [15, 80, 110]

    % Bar Chart: Steps per Activity
    figure;
    subplot(1,2,1);
    bar(stepCounts);
    set(gca, 'xticklabel', activityNames);
    ylabel('Steps');
    title('Steps per Activity');

    % Pie Chart: Calories Burned Distribution
    subplot(1,2,2);
    pie(calorieCounts, activityNames);
    title('Calories Burned by Activity');
end