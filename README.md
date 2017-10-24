This project aims to explore the effects of several vibratory motor configuration variables on one's response to vibratory stimuli. During the experiment, the subject responds to motors' vibratory stimuli of various configurations by pressing a push button. An Arduino Uno microcontroller chip powers and controls the motors. The chip also receives signal from the push button. MATLAB provides the programming and control interface for the microcontroller chip.

This repository contains four code files for running the experiment, computing the outcome measures and plotting figures.
"fn-RunMotors" is a function for running motors in a configuration specified by several input variables.
"runExperiment" is a script for running the data collection session for a single subject.
"dataAnalysis" is a script for processing raw data and computing the outcome measures.
"createFigures" is a script plotting the outcome measures against the input variables explored in this experiment.

Each code file has an introduction in the first few lines and comments throughout.
