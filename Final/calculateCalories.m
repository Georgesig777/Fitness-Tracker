 function calories = calculateCalories(activityName, positionTime_sec, weight_kg)
% Calculates calories burned based on activity and time vector in seconds.
% INPUTS:
%   activityName        - string ("sitting", "walking", "running")
%   positionTime_sec    - time vector in seconds (from timeElapsed)
%   weight_kg           - optional, default = 70 kg
% OUTPUT:
%   calories            - estimated calories burned

    if nargin < 3
        weight_kg = 70;  % default weight
    end

    % Duration in hours
    duration_sec = positionTime_sec(end) - positionTime_sec(1);
    duration_hr = duration_sec / 3600;

    % Set MET values
    switch lower(activityName)
        case "sitting"
            MET = 1.3;
        case "walking"
            MET = 3.5;
        case "running"
            MET = 7.0;
        otherwise
            MET = 2.0;  % generic fallback
    end

    % Calories formula
    calories = MET * weight_kg * duration_hr;
end