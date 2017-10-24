% This function is executed during each trial of the experiment to run the motors under a specified combination of input variable values
% "var1" and "var2" specify the active motors. "mode" specifies the vibratory pattern. "intensity" specifies the vibratory intensity
% The function outputs the subject's response time recorded by a push button switch.

function [responsetime] = fourmotors(var1,var2,mode,intensity)

% Assign Arduino output ports for the motors A, B, C, D
tactorA='D3';
tactorB='D5';
tactorC='D6';
tactorD='D9';

pushbutton='D8';    % Assign an Arduino input port for the push button

global amega;       % Declare the Arduino microcontroller chip as a global variable
amega= arduino('COM16','Uno');      % Initiate Arduino's connection with PC

responsetime=0;     % Initiate response time output variable

if mode == 1 || mode == 2       % Run the motors in the vibratory pattern specified by the function's input. And record the subject's response time.
    switch var1
        case 'A'
            writePWMDutyCycle(amega,tactorA,intensity);
        case 'B'
            writePWMDutyCycle(amega,tactorB,intensity);
        case 'C'
            writePWMDutyCycle(amega,tactorC,intensity);
        case 'D'
            writePWMDutyCycle(amega,tactorD,intensity);
    end
    switch var2
        case 'A'
            writePWMDutyCycle(amega,tactorA,intensity);
        case 'B'
            writePWMDutyCycle(amega,tactorB,intensity);
        case 'C'
            writePWMDutyCycle(amega,tactorC,intensity);
        case 'D'
            writePWMDutyCycle(amega,tactorD,intensity);
    end
    tic;
    while toc<3
        if responsetime==0 && readDigitalPin(amega,pushbutton)==1
            responsetime=toc;
        end
        pause(0.01);
    end
end

if mode == 3        % Run the motors in the vibratory pattern specified by the function's input. And record the subject's response time.
        switch var1
            case 'A'
                writePWMDutyCycle(amega,tactorA,intensity);
            case 'B'
                writePWMDutyCycle(amega,tactorB,intensity);
            case 'C'
                writePWMDutyCycle(amega,tactorC,intensity);
            case 'D'
                writePWMDutyCycle(amega,tactorD,intensity);
        end
        tic;
        while toc<1.5
            if responsetime==0 && readDigitalPin(amega,pushbutton)==1
                responsetime=toc;
            end
            pause(0.01);
        end
        switch var1
            case 'A'
                writePWMDutyCycle(amega,tactorA,0);
            case 'B'
                writePWMDutyCycle(amega,tactorB,0);
            case 'C'
                writePWMDutyCycle(amega,tactorC,0);
            case 'D'
                writePWMDutyCycle(amega,tactorD,0);
        end
        switch var2
            case 'A'
                writePWMDutyCycle(amega,tactorA,intensity);
            case 'B'
                writePWMDutyCycle(amega,tactorB,intensity);
            case 'C'
                writePWMDutyCycle(amega,tactorC,intensity);
            case 'D'
                writePWMDutyCycle(amega,tactorD,intensity);
        end
        while toc<3
            if responsetime==0 && readDigitalPin(amega,pushbutton)==1
                responsetime=toc;
            end
            pause(0.01);
        end
end
display(responsetime);      % Display the response time in the command window
clear global amega          % Reset after the completion of each trial

end
