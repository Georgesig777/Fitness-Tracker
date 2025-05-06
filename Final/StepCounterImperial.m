function steps = StepCounterImperial(lat, lon)
% StepCounterImperial estimates the number of steps using latitude and longitude in imperial units.
% Inputs:
%   lat - vector of latitude values
%   lon - vector of longitude values
% Output:
%   steps - estimated number of steps (using GPS distance in miles, stride in feet)

    % Earth's circumference in miles
    earthCirc = 24901;  
    totaldis = 0;  % Total distance in miles

    % Loop through GPS points to calculate total distance
    for i = 1:(length(lat)-1)
        % Get current and next GPS coordinates
        lat1 = lat(i);    
        lat2 = lat(i+1);  
        lon1 = lon(i);    
        lon2 = lon(i+1);

        % Compute the difference in degrees
        degDis = distance(lat1, lon1, lat2, lon2);

        % Convert degrees to miles (proportional to earth’s circumference)
        dis = (degDis / 360) * earthCirc;

        % Add to total distance
        totaldis = totaldis + dis;
    end

    % Calculate steps
    stride = 2.5;                   % Average stride in feet
    totaldis_ft = totaldis * 5280; % Convert miles to feet
    steps = totaldis_ft / stride;

    % Display output
    disp(['The total distance traveled is: ', num2str(totaldis), ' miles'])
    disp(['You took ', num2str(steps), ' steps'])
end