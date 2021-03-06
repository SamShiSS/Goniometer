% This is the MATLAB script for running a single subject's data collection session. The session consists of 6 sets of 28 trials.
% Each of the 6x28=168 trials examines the subject's response time to vibratory stimuli generated by motors.
% Each trial is performed with the motors' configuration variables set at specified values, which are randomized and stored in an Excel spreadsheet.
% Below is the order of the 6 sets. The order is randomized for each subject.
% 1. outso2
% 2. outso4
% 3. linso4
% 4. linso2
% 5. linsk2
% 6. linsk4

condition='linsk4';   % Enter the current set before the start of each set.

switch condition    % Assign input and output range in the Excel spreadsheet based on the current set.
    case 'linsk4'
        readRange='B3:C30'; writeRange='D3:D30';
    case 'linsk2'
        readRange='F3:G30'; writeRange='H3:H30';
    case 'linso4'
        readRange='J3:K30'; writeRange='L3:L30';
    case 'linso2'
        readRange='N3:O30'; writeRange='P3:P30';
    case 'outso4'
        readRange='R3:S30'; writeRange='T3:T30';
    case 'outso2'
        readRange='V3:W30'; writeRange='X3:X30';
end

start=1;    % Enter the starting trial number of the set of 28 trials. The default is 1

if start==1     % Load motors' configuration variable values if and only if starting from the beginning
[num,txt]=xlsread('data.xlsx','Response Time',readRange);   % Read the values from the Excel spreadsheet

% Initialize vertical matrices for storing the values
responsetime=zeros(28,1);
mode=zeros(28,1);

% Assign the motors' configuration variable values read from the Excel spreadsheet to appropriate matrices
motors=char(txt);
motor1=motors(:,1);
motor2=motors(:,3);
for i=1:28
    switch motors(i,2)
        case ' '
            mode(i)=1;
        case '&'
            mode(i)=2;
        case '/'
            mode(i)=3;
    end
end
intensity=num;
end

% For each trial, call function "fn-RunMotors".
% "fn-RunMotors" runs the motors in a configuration specified by its input variables, and outputs the subject's response time for each trial.
for i=start:28
responsetime(i)=fourmotors(motor1(i),motor2(i),mode(i),intensity(i));
disp(i);
    keyboard;
end

% If the subject fails to respond in a trial, assign a blank space to the response time variable
for i=1:28
    if responsetime(i)==0
        responsetime(i)=' ';
    end
end

xlswrite('data.xlsx',responsetime,'Response Time',writeRange);  % Export the subject's response time matrix to the Excel spreadsheet
