# Fitness Tracker – Activity Recognition and Analysis in MATLAB

This project is a MATLAB-based fitness tracker that uses machine learning to classify physical activities (e.g., sitting, walking, running) and estimates the number of steps taken and calories burned. It works on pre-recorded mobile sensor data (acceleration and GPS).

## 📁 Folder Contents

- `trainedModel.mat` — Pre-trained classification model for activity recognition.
- `StepCounterImperial.m` — Function to calculate steps using GPS coordinates (imperial units).
- `calculateCalories.m` — Estimates calories burned based on MET values and time duration.
- `timeElapsed.m` — Converts datetime vectors to elapsed seconds.
- `visualizeResults.m` — Visualizes steps and calories using bar and pie charts.
- `loadActivityData.m` — Loads `.mat` sensor files and prepares input data for analysis.
- `results.csv` — (Optional) Output file with summary statistics from recent analysis.

## 🔍 How It Works

1. **Sensor Data Input**  
   Sensor data is collected using MATLAB Mobile and saved in `.mat` files. Each file contains:
   - GPS data: `Position.latitude`, `Position.longitude`, `Position.Timestamp`
   - Accelerometer data: `Acceleration.X`, `Acceleration.Y`, `Acceleration.Z`, `Acceleration.Timestamp`

2. **Data Loading**  
   The `loadActivityData()` function reads each file and prepares:
   - Acceleration matrix (`Xacc`, `Yacc`, `Zacc`)
   - Position matrix (`lat`, `lon`)
   - Time vectors in seconds
   - Step estimation via `StepCounterImperial`

3. **Activity Classification**  
   Using a trained model stored in `trainedModel.mat`, acceleration data is used to classify each time window of activity (e.g., sitting, walking, running).

4. **Calories and Steps Calculation**  
   - Steps are estimated from GPS distance and stride length.
   - Calories are calculated based on MET values and time duration per activity using `calculateCalories`.

5. **Visualization**  
   The `visualizeResults()` function displays:
   - Steps per activity (bar chart)
   - Calories burned per activity (pie chart)

## ⚙️ Dependencies

- MATLAB (R2018b or newer recommended)
- Statistics and Machine Learning Toolbox
- MATLAB Mobile (for data collection)
- Pre-saved `.mat` files in `MobileSensorData/` directory

## 🚀 Usage

1. Save sensor data using MATLAB Mobile and place `.mat` files in `MobileSensorData/`.
2. Train or load a `trainedModel` that can classify activities from acceleration data.
3. Run a script like:

```matlab
[lat, lon, positionTime, Xacc, Yacc, Zacc, accelTime, steps] = loadActivityData("walking");
testData = table(Xacc, Yacc, Zacc, 'VariableNames', {'X','Y','Z'});
load("trainedModel.mat", "trainedModel");
predictedLabels = trainedModel.predictFcn(testData);
time_sec = timeElapsed(positionTime);
calories = calculateCalories("walking", time_sec);
visualizeResults({'walking'}, steps, calories);
