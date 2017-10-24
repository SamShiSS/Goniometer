This project aims to explore the effects of several vibratory motor configuration variables on one's response to the motor's vibratory stimuli. During the experiment, the subject responds to motors' vibratory stimuli under various parameter values, by pressing a push button. An Arduino Uno microcontroller chip powers and controls the four motors. The chip also receives signal from a push button. MATLAB provides the programming and contol interface for the experimenter.

This repository contains four code files for running the experiment, computing the outcome measures, and plotting figures.
"Function'fourmotors'" is a function for running four motors based on the input parameter values
"RunExperiment" is a script for running the data collection session for a single subject
"DataAnalysis" is a script for processing the raw data and calculating the outcome measures to be used for plotting
"CreateFigures" is a script plotting the outcome measures against input variables which are explored in this experiment

Each code file has an introduction in the first few lines and comments throughout
