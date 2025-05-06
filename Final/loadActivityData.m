function [lat, lon, positionTime, Xacc, Yacc, Zacc, accelTime, steps] = loadActivityData(activityName)
% loadActivityData loads and processes sensor data from a named activity file.
%
% INPUT:
%   activityName - string, name of the activity (e.g., "sitting", "walking")
%
% OUTPUT:
%   lat, lon         - latitude and longitude vectors
%   positionTime     - time vector (seconds) for GPS
%   Xacc, Yacc, Zacc - acceleration components
%   accelTime        - time vector (seconds) for acceleration
%   steps            - estimated number of steps

    % Construct path to .mat file
    filename = fullfile("MobileSensorData", activityName + ".mat");

    % Load data
    load(filename, "Position", "Acceleration");

    % Extract GPS data
    lat = Position.latitude;
    lon = Position.longitude;
    positionDatetime = Position.Timestamp;

    % Extract acceleration data
    Xacc = Acceleration.X;
    Yacc = Acceleration.Y;
    Zacc = Acceleration.Z;
    accelDatetime = Acceleration.Timestamp;

    % Convert datetime to elapsed seconds
    positionTime = timeElapsed(positionDatetime);
    accelTime = timeElapsed(accelDatetime);

    % Calculate steps
    steps = StepCounterImperial(lat, lon);
end