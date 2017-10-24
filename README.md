This project aims to explore the effects of several vibratory motor configuration variables on one's response to vibratory stimuli. During the experiment, the subject responds to motors' vibratory stimuli of various configurations by pressing a push button. An Arduino Uno microcontroller chip powers and controls the motors, and receives signal from the push button. MATLAB provides the programming and control interface for the microcontroller chip.

This repository contains five code files for running the experiment, computing the outcome measures and generating plots.
"fn-RunMotors.m" is a function for activating the motors in a configuration specified by several input variables.
"runExperiment.m" is a script for running the data collection session for a single subject.
"dataAnalysis.m" is a script for processing raw data and computing the outcome measures for a single subject.
"dataConsolidation.m" is a script for consolidating outcome measure results from all subjects.
"createFigures.m" is a script for plotting the outcome measures vs. vibratory motor configuration variables explored in this project.

Each code file has an introduction in the first few lines as well as comments throughout.
