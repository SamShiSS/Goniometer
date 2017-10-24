% This MATLAB script computes the outcome measures for perception of vibratory stimuli for a single subject based on raw data from the experiment.

% Summary of the data analysis script
% Step 1: Load experimental conditions data
% Step 2: Load response time data
% Step 3: Load perceived vibration pattern and locating response data
% Step 4: Sort data to the default order
% Step 5: Determine vibration pattern for each exp. condition
% Step 6: Calculate response accuracy for each exp. condition
% Step 7: Determine distance between tactors for each exp. condition
% Step 8: Calculate distance error of locating response for each exp. condition
% Step 9: Calculate Mean and Standard Deviation of Response Time
% Step 10: Calculate Mean and Standard Deviation of Response Accuracy
% Step 11: Splits of trials with incorrect response
% Step 12: Count the number of missed responses
% Step 13: Calculate and compare response times for correct and incorrect response
% Step 14: Calculate Mean and Standard Deviation of Locating Error
% Step 15: Locating Error Breakdown
% Step 16: Locating Error Direction


% Step 1: Load experimental conditions data
[num,txt]=xlsread('data.xlsx','Experimental Order','B3:D30');
linsk4.tac=char(txt); linsk4.int=num(:,3); linsk4.ord=num(:,1);
[num,txt]=xlsread('data.xlsx','Experimental Order','F3:H30');
linsk2.tac=char(txt); linsk2.int=num(:,3); linsk2.ord=num(:,1);
[num,txt]=xlsread('data.xlsx','Experimental Order','J3:L30');
linso4.tac=char(txt); linso4.int=num(:,3); linso4.ord=num(:,1);
[num,txt]=xlsread('data.xlsx','Experimental Order','N3:P30');
linso2.tac=char(txt); linso2.int=num(:,3); linso2.ord=num(:,1);
[num,txt]=xlsread('data.xlsx','Experimental Order','R3:T30');
outso4.tac=char(txt); outso4.int=num(:,3); outso4.ord=num(:,1);
[num,txt]=xlsread('data.xlsx','Experimental Order','V3:X30');
outso2.tac=char(txt); outso2.int=num(:,3); outso2.ord=num(:,1);

% Step 2: Load response time data
num=xlsread('data.xlsx','Response Time','D3:D30'); linsk4.rt=num;
num=xlsread('data.xlsx','Response Time','H3:H30'); linsk2.rt=num;
num=xlsread('data.xlsx','Response Time','L3:L30'); linso4.rt=num;
num=xlsread('data.xlsx','Response Time','P3:P30'); linso2.rt=num;
num=xlsread('data.xlsx','Response Time','T3:T30'); outso4.rt=num;
num=xlsread('data.xlsx','Response Time','X3:X30'); outso2.rt=num;

% Step 3: Load Perceived Vibration Pattern and Locating Response data
[num,txt]=xlsread('data.xlsx','Accuracy and Locating','D3:F30');
linsk4.rp=num; linsk4.loc1=char(txt(:,1)); linsk4.loc2=char(txt(:,2));
[num,txt]=xlsread('data.xlsx','Accuracy and Locating','J3:L30'); 
linsk2.rp=num; linsk2.loc1=char(txt(:,1)); linsk2.loc2=char(txt(:,2));
[num,txt]=xlsread('data.xlsx','Accuracy and Locating','P3:R30');
linso4.rp=num; linso4.loc1=char(txt(:,1)); linso4.loc2=char(txt(:,2));
[num,txt]=xlsread('data.xlsx','Accuracy and Locating','V3:X30');
linso2.rp=num; linso2.loc1=char(txt(:,1)); linso2.loc2=char(txt(:,2));
[num,txt]=xlsread('data.xlsx','Accuracy and Locating','AB3:AD30');
outso4.rp=num; outso4.loc1=char(txt(:,1)); outso4.loc2=char(txt(:,2));
[num,txt]=xlsread('data.xlsx','Accuracy and Locating','AH3:AJ30');
outso2.rp=num; outso2.loc1=char(txt(:,1)); outso2.loc2=char(txt(:,2));

% Step 4: Sort data to the default order
% first append the order column to each data matrix
% then sort the matrix in ascending order based on the order column
% finally remove the order column
% default order:
% 1 to 4--100%,one vibration(tactor A,B,C,D)
% 5 to 9--100%,two simultaneous(2,4,6,8,10cm)
% 10 to 14--100%,two sequential(2,4,6,8,10cm)
% 15 to 18--50%,one vibration(tactor A,B,C,D)
% 19 to 23--50%,two simultaneous(2,4,6,8,10cm)
% 24 to 28--50%,two sequential(2,4,6,8,10cm)

linsk4.tac(:,4)=linsk4.ord; linsk4.int(:,2)=linsk4.ord; linsk4.rt(:,2)=linsk4.ord; linsk4.rp(:,2)=linsk4.ord; linsk4.loc1(:,4)=linsk4.ord; linsk4.loc2(:,4)=linsk4.ord;
linsk2.tac(:,4)=linsk2.ord; linsk2.int(:,2)=linsk2.ord; linsk2.rt(:,2)=linsk2.ord; linsk2.rp(:,2)=linsk2.ord; linsk2.loc1(:,4)=linsk2.ord; linsk2.loc2(:,4)=linsk2.ord;
linso4.tac(:,4)=linso4.ord; linso4.int(:,2)=linso4.ord; linso4.rt(:,2)=linso4.ord; linso4.rp(:,2)=linso4.ord; linso4.loc1(:,4)=linso4.ord; linso4.loc2(:,4)=linso4.ord;
linso2.tac(:,4)=linso2.ord; linso2.int(:,2)=linso2.ord; linso2.rt(:,2)=linso2.ord; linso2.rp(:,2)=linso2.ord; linso2.loc1(:,4)=linso2.ord; linso2.loc2(:,4)=linso2.ord;
outso4.tac(:,4)=outso4.ord; outso4.int(:,2)=outso4.ord; outso4.rt(:,2)=outso4.ord; outso4.rp(:,2)=outso4.ord; outso4.loc1(:,4)=outso4.ord; outso4.loc2(:,4)=outso4.ord;
outso2.tac(:,4)=outso2.ord; outso2.int(:,2)=outso2.ord; outso2.rt(:,2)=outso2.ord; outso2.rp(:,2)=outso2.ord; outso2.loc1(:,4)=outso2.ord; outso2.loc2(:,4)=outso2.ord;

linsk4.tac=sortrows(linsk4.tac,4); linsk4.int=sortrows(linsk4.int,2); linsk4.rt=sortrows(linsk4.rt,2); linsk4.rp=sortrows(linsk4.rp,2); linsk4.loc1=sortrows(linsk4.loc1,4); linsk4.loc2=sortrows(linsk4.loc2,4);
linsk2.tac=sortrows(linsk2.tac,4); linsk2.int=sortrows(linsk2.int,2); linsk2.rt=sortrows(linsk2.rt,2); linsk2.rp=sortrows(linsk2.rp,2); linsk2.loc1=sortrows(linsk2.loc1,4); linsk2.loc2=sortrows(linsk2.loc2,4);
linso4.tac=sortrows(linso4.tac,4); linso4.int=sortrows(linso4.int,2); linso4.rt=sortrows(linso4.rt,2); linso4.rp=sortrows(linso4.rp,2); linso4.loc1=sortrows(linso4.loc1,4); linso4.loc2=sortrows(linso4.loc2,4);
linso2.tac=sortrows(linso2.tac,4); linso2.int=sortrows(linso2.int,2); linso2.rt=sortrows(linso2.rt,2); linso2.rp=sortrows(linso2.rp,2); linso2.loc1=sortrows(linso2.loc1,4); linso2.loc2=sortrows(linso2.loc2,4);
outso4.tac=sortrows(outso4.tac,4); outso4.int=sortrows(outso4.int,2); outso4.rt=sortrows(outso4.rt,2); outso4.rp=sortrows(outso4.rp,2); outso4.loc1=sortrows(outso4.loc1,4); outso4.loc2=sortrows(outso4.loc2,4);
outso2.tac=sortrows(outso2.tac,4); outso2.int=sortrows(outso2.int,2); outso2.rt=sortrows(outso2.rt,2); outso2.rp=sortrows(outso2.rp,2); outso2.loc1=sortrows(outso2.loc1,4); outso2.loc2=sortrows(outso2.loc2,4);

linsk4.tac(:,4)=[]; linsk4.int(:,2)=[]; linsk4.rt(:,2)=[]; linsk4.rp(:,2)=[]; linsk4.loc1(:,4)=[]; linsk4.loc2(:,4)=[];
linsk2.tac(:,4)=[]; linsk2.int(:,2)=[]; linsk2.rt(:,2)=[]; linsk2.rp(:,2)=[]; linsk2.loc1(:,4)=[]; linsk2.loc2(:,4)=[];
linso4.tac(:,4)=[]; linso4.int(:,2)=[]; linso4.rt(:,2)=[]; linso4.rp(:,2)=[]; linso4.loc1(:,4)=[]; linso4.loc2(:,4)=[];
linso2.tac(:,4)=[]; linso2.int(:,2)=[]; linso2.rt(:,2)=[]; linso2.rp(:,2)=[]; linso2.loc1(:,4)=[]; linso2.loc2(:,4)=[];
outso4.tac(:,4)=[]; outso4.int(:,2)=[]; outso4.rt(:,2)=[]; outso4.rp(:,2)=[]; outso4.loc1(:,4)=[]; outso4.loc2(:,4)=[];
outso2.tac(:,4)=[]; outso2.int(:,2)=[]; outso2.rt(:,2)=[]; outso2.rp(:,2)=[]; outso2.loc1(:,4)=[]; outso2.loc2(:,4)=[];

% Step 5: Determine vibration pattern for each exp. condition
% one vibration--1; two simultaneous--2; two sequential--3

linsk4.pat=zeros(28,1); linsk2.pat=zeros(28,1);
linso4.pat=zeros(28,1); linso2.pat=zeros(28,1);
outso4.pat=zeros(28,1); outso2.pat=zeros(28,1);

for i=1:28
    switch linsk4.tac(i,2)
        case ' '
            linsk4.pat(i)=1;
        case '&'
            linsk4.pat(i)=2;
        case '/'
            linsk4.pat(i)=3;
    end
    switch linsk2.tac(i,2)
        case ' '
            linsk2.pat(i)=1;
        case '&'
            linsk2.pat(i)=2;
        case '/'
            linsk2.pat(i)=3;
    end
    switch linso4.tac(i,2)
        case ' '
            linso4.pat(i)=1;
        case '&'
            linso4.pat(i)=2;
        case '/'
            linso4.pat(i)=3;
    end
    switch linso2.tac(i,2)
        case ' '
            linso2.pat(i)=1;
        case '&'
            linso2.pat(i)=2;
        case '/'
            linso2.pat(i)=3;
    end
    switch outso4.tac(i,2)
        case ' '
            outso4.pat(i)=1;
        case '&'
            outso4.pat(i)=2;
        case '/'
            outso4.pat(i)=3;
    end
    switch outso2.tac(i,2)
        case ' '
            outso2.pat(i)=1;
        case '&'
            outso2.pat(i)=2;
        case '/'
            outso2.pat(i)=3;
    end
end

% Step 6: Calculate response accuracy for each exp. condition
% incorrect response--0; correct response--1;

linsk4.ra=zeros(28,1); linsk2.ra=zeros(28,1);
linso4.ra=zeros(28,1); linso2.ra=zeros(28,1);
outso4.ra=zeros(28,1); outso2.ra=zeros(28,1);

for i=1:28
    if linsk4.pat(i)==linsk4.rp(i)
        linsk4.ra(i)=1;
    end
    if linsk2.pat(i)==linsk2.rp(i)
        linsk2.ra(i)=1;
    end
    if linso4.pat(i)==linso4.rp(i)
        linso4.ra(i)=1;
    end
    if linso2.pat(i)==linso2.rp(i)
        linso2.ra(i)=1;
    end
    if outso4.pat(i)==outso4.rp(i)
        outso4.ra(i)=1;
    end
    if outso2.pat(i)==outso2.rp(i)
        outso2.ra(i)=1;
    end
end

% Step 7: Calculate distance between tactors for each exp. condition
% B&D(4488)--2cm; A&D(4420)--4cm; A&B(4290)--6cm; B&C(4422)--8cm; A&C(4355)--10cm;

linsk4.dis=zeros(28,1); linsk2.dis=zeros(28,1);
linso4.dis=zeros(28,1); linso2.dis=zeros(28,1);
outso4.dis=zeros(28,1); outso2.dis=zeros(28,1);

for i=1:28
    switch linsk4.tac(i,1)*linsk4.tac(i,3)
        case 4488
            linsk4.dis(i)=2;
        case 4420
            linsk4.dis(i)=4;
        case 4290
            linsk4.dis(i)=6;
        case 4422
            linsk4.dis(i)=8;
        case 4355
            linsk4.dis(i)=10;
    end
    switch linsk2.tac(i,1)*linsk2.tac(i,3)
        case 4488
            linsk2.dis(i)=2;
        case 4420
            linsk2.dis(i)=4;
        case 4290
            linsk2.dis(i)=6;
        case 4422
            linsk2.dis(i)=8;
        case 4355
            linsk2.dis(i)=10;
    end
    switch linso4.tac(i,1)*linso4.tac(i,3)
        case 4488
            linso4.dis(i)=2;
        case 4420
            linso4.dis(i)=4;
        case 4290
            linso4.dis(i)=6;
        case 4422
            linso4.dis(i)=8;
        case 4355
            linso4.dis(i)=10;
    end
    switch linso2.tac(i,1)*linso2.tac(i,3)
        case 4488
            linso2.dis(i)=2;
        case 4420
            linso2.dis(i)=4;
        case 4290
            linso2.dis(i)=6;
        case 4422
            linso2.dis(i)=8;
        case 4355
            linso2.dis(i)=10;
    end
    switch outso4.tac(i,1)*outso4.tac(i,3)
        case 4488
            outso4.dis(i)=2;
        case 4420
            outso4.dis(i)=4;
        case 4290
            outso4.dis(i)=6;
        case 4422
            outso4.dis(i)=8;
        case 4355
            outso4.dis(i)=10;
    end
    switch outso2.tac(i,1)*outso2.tac(i,3)
        case 4488
            outso2.dis(i)=2;
        case 4420
            outso2.dis(i)=4;
        case 4290
            outso2.dis(i)=6;
        case 4422
            outso2.dis(i)=8;
        case 4355
            outso2.dis(i)=10;
    end
end

% Step 8: Calculate distance error of locating response for each exp. condition
% Location of tactors A: K6, B: E6, C: E14, D: G6
% letter difference +: lateral shift; -: medial shift
% number difference +: distal shift; -: proximal shift
% if one vibration, one response, locating error is the straight line distance
% if one vibration, two responses, the average straight line distances count
% if two vibrations, one response, the shortest straight line distances count
% if two vibrations, two responses, the shortest straight line distances count
% if no response, mark locating error as NaN

tactor.A.let='K'; tactor.A.num=6;
tactor.B.let='E'; tactor.B.num=6;
tactor.C.let='E'; tactor.C.num=14;
tactor.D.let='G'; tactor.D.num=6;

linsk4.let1=zeros(28,1);linsk4.num1=zeros(28,1);linsk4.let2=zeros(28,1);linsk4.num2=zeros(28,1);
linsk2.let1=zeros(28,1);linsk2.num1=zeros(28,1);linsk2.let2=zeros(28,1);linsk2.num2=zeros(28,1);
linso4.let1=zeros(28,1);linso4.num1=zeros(28,1);linso4.let2=zeros(28,1);linso4.num2=zeros(28,1);
linso2.let1=zeros(28,1);linso2.num1=zeros(28,1);linso2.let2=zeros(28,1);linso2.num2=zeros(28,1);
outso4.let1=zeros(28,1);outso4.num1=zeros(28,1);outso4.let2=zeros(28,1);outso4.num2=zeros(28,1);
outso2.let1=zeros(28,1);outso2.num1=zeros(28,1);outso2.let2=zeros(28,1);outso2.num2=zeros(28,1);

for i=1:28
    if linsk4.loc1(i,2)==' '
        linsk4.let1(i)=NaN; linsk4.num1(i)=NaN;
    elseif linsk4.loc1(i,3)==' '
        linsk4.let1(i)=linsk4.loc1(i,1); linsk4.num1(i)=linsk4.loc1(i,2)-'0';
    else
        linsk4.let1(i)=linsk4.loc1(i,1); linsk4.num1(i)=(linsk4.loc1(i,2)-'0')*10+linsk4.loc1(i,3)-'0';    
    end
    if linsk4.loc2(i,2)==' '
        linsk4.let2(i)=NaN; linsk4.num2(i)=NaN;
    elseif linsk4.loc2(i,3)==' '
        linsk4.let2(i)=linsk4.loc2(i,1); linsk4.num2(i)=linsk4.loc2(i,2)-'0';
    else
        linsk4.let2(i)=linsk4.loc2(i,1); linsk4.num2(i)=(linsk4.loc2(i,2)-'0')*10+linsk4.loc2(i,3)-'0';    
    end
    
    if linsk2.loc1(i,2)==' '
        linsk2.let1(i)=NaN; linsk2.num1(i)=NaN;
    elseif linsk2.loc1(i,3)==' '
        linsk2.let1(i)=linsk2.loc1(i,1); linsk2.num1(i)=linsk2.loc1(i,2)-'0';
    else
        linsk2.let1(i)=linsk2.loc1(i,1); linsk2.num1(i)=(linsk2.loc1(i,2)-'0')*10+linsk2.loc1(i,3)-'0';    
    end
    if linsk2.loc2(i,2)==' '
        linsk2.let2(i)=NaN; linsk2.num2(i)=NaN;
    elseif linsk2.loc2(i,3)==' '
        linsk2.let2(i)=linsk2.loc2(i,1); linsk2.num2(i)=linsk2.loc2(i,2)-'0';
    else
        linsk2.let2(i)=linsk2.loc2(i,1); linsk2.num2(i)=(linsk2.loc2(i,2)-'0')*10+linsk2.loc2(i,3)-'0';    
    end

    if linso4.loc1(i,2)==' '
        linso4.let1(i)=NaN; linso4.num1(i)=NaN;
    elseif linso4.loc1(i,3)==' '
        linso4.let1(i)=linso4.loc1(i,1); linso4.num1(i)=linso4.loc1(i,2)-'0';
    else
        linso4.let1(i)=linso4.loc1(i,1); linso4.num1(i)=(linso4.loc1(i,2)-'0')*10+linso4.loc1(i,3)-'0';    
    end
    if linso4.loc2(i,2)==' '
        linso4.let2(i)=NaN; linso4.num2(i)=NaN;
    elseif linso4.loc2(i,3)==' '
        linso4.let2(i)=linso4.loc2(i,1); linso4.num2(i)=linso4.loc2(i,2)-'0';
    else
        linso4.let2(i)=linso4.loc2(i,1); linso4.num2(i)=(linso4.loc2(i,2)-'0')*10+linso4.loc2(i,3)-'0';    
    end

    if linso2.loc1(i,2)==' '
        linso2.let1(i)=NaN; linso2.num1(i)=NaN;
    elseif linso2.loc1(i,3)==' '
        linso2.let1(i)=linso2.loc1(i,1); linso2.num1(i)=linso2.loc1(i,2)-'0';
    else
        linso2.let1(i)=linso2.loc1(i,1); linso2.num1(i)=(linso2.loc1(i,2)-'0')*10+linso2.loc1(i,3)-'0';    
    end
    if linso2.loc2(i,2)==' '
        linso2.let2(i)=NaN; linso2.num2(i)=NaN;
    elseif linso2.loc2(i,3)==' '
        linso2.let2(i)=linso2.loc2(i,1); linso2.num2(i)=linso2.loc2(i,2)-'0';
    else
        linso2.let2(i)=linso2.loc2(i,1); linso2.num2(i)=(linso2.loc2(i,2)-'0')*10+linso2.loc2(i,3)-'0';    
    end

    if outso4.loc1(i,2)==' '
        outso4.let1(i)=NaN; outso4.num1(i)=NaN;
    elseif outso4.loc1(i,3)==' '
        outso4.let1(i)=outso4.loc1(i,1); outso4.num1(i)=outso4.loc1(i,2)-'0';
    else
        outso4.let1(i)=outso4.loc1(i,1); outso4.num1(i)=(outso4.loc1(i,2)-'0')*10+outso4.loc1(i,3)-'0';    
    end
    if outso4.loc2(i,2)==' '
        outso4.let2(i)=NaN; outso4.num2(i)=NaN;
    elseif outso4.loc2(i,3)==' '
        outso4.let2(i)=outso4.loc2(i,1); outso4.num2(i)=outso4.loc2(i,2)-'0';
    else
        outso4.let2(i)=outso4.loc2(i,1); outso4.num2(i)=(outso4.loc2(i,2)-'0')*10+outso4.loc2(i,3)-'0';    
    end

    if outso2.loc1(i,2)==' '
        outso2.let1(i)=NaN; outso2.num1(i)=NaN;
    elseif outso2.loc1(i,3)==' '
        outso2.let1(i)=outso2.loc1(i,1); outso2.num1(i)=outso2.loc1(i,2)-'0';
    else
        outso2.let1(i)=outso2.loc1(i,1); outso2.num1(i)=(outso2.loc1(i,2)-'0')*10+outso2.loc1(i,3)-'0';    
    end
    if outso2.loc2(i,2)==' '
        outso2.let2(i)=NaN; outso2.num2(i)=NaN;
    elseif outso2.loc2(i,3)==' '
        outso2.let2(i)=outso2.loc2(i,1); outso2.num2(i)=outso2.loc2(i,2)-'0';
    else
        outso2.let2(i)=outso2.loc2(i,1); outso2.num2(i)=(outso2.loc2(i,2)-'0')*10+outso2.loc2(i,3)-'0';    
    end
end

linsk4.letd=zeros(28,1); linsk4.numd=zeros(28,1); linsk4.le=zeros(28,1);
linsk2.letd=zeros(28,1); linsk2.numd=zeros(28,1); linsk2.le=zeros(28,1);
linso4.letd=zeros(28,1); linso4.numd=zeros(28,1); linso4.le=zeros(28,1);
linso2.letd=zeros(28,1); linso2.numd=zeros(28,1); linso2.le=zeros(28,1);
outso4.letd=zeros(28,1); outso4.numd=zeros(28,1); outso4.le=zeros(28,1);
outso2.letd=zeros(28,1); outso2.numd=zeros(28,1); outso2.le=zeros(28,1);

for i=1:28
    if linsk4.pat(i)==1 && linsk4.rp(i)==1
        switch linsk4.tac(i,1)
            case 'A'
                linsk4.letd(i)=linsk4.let1(i)-tactor.A.let; linsk4.numd(i)=linsk4.num1(i)-tactor.A.num;
            case 'B'
                linsk4.letd(i)=linsk4.let1(i)-tactor.B.let; linsk4.numd(i)=linsk4.num1(i)-tactor.B.num;
            case 'C'
                linsk4.letd(i)=linsk4.let1(i)-tactor.C.let; linsk4.numd(i)=linsk4.num1(i)-tactor.C.num;
            case 'D'
                linsk4.letd(i)=linsk4.let1(i)-tactor.D.let; linsk4.numd(i)=linsk4.num1(i)-tactor.D.num;
        end
        linsk4.le(i)=sqrt(linsk4.letd(i)^2+linsk4.numd(i)^2);
        
    elseif linsk4.pat(i)==1 && (linsk4.rp(i)==2 || linsk4.rp(i)==3)
        switch linsk4.tac(i,1)
            case 'A'
                linsk4.letd(i)=mean([linsk4.let1(i) linsk4.let2(i)])-tactor.A.let; linsk4.numd(i)=mean([linsk4.num1(i) linsk4.num2(i)])-tactor.A.num;
                linsk4.le(i)=mean([sqrt((linsk4.let1(i)-tactor.A.let)^2+(linsk4.num1(i)-tactor.A.num)^2),sqrt((linsk4.let2(i)-tactor.A.let)^2+(linsk4.num2(i)-tactor.A.num)^2)]);
            case 'B'
                linsk4.letd(i)=mean([linsk4.let1(i) linsk4.let2(i)])-tactor.B.let; linsk4.numd(i)=mean([linsk4.num1(i) linsk4.num2(i)])-tactor.B.num;
                linsk4.le(i)=mean([sqrt((linsk4.let1(i)-tactor.B.let)^2+(linsk4.num1(i)-tactor.B.num)^2),sqrt((linsk4.let2(i)-tactor.B.let)^2+(linsk4.num2(i)-tactor.B.num)^2)]);
            case 'C'
                linsk4.letd(i)=mean([linsk4.let1(i) linsk4.let2(i)])-tactor.C.let; linsk4.numd(i)=mean([linsk4.num1(i) linsk4.num2(i)])-tactor.C.num;
                linsk4.le(i)=mean([sqrt((linsk4.let1(i)-tactor.C.let)^2+(linsk4.num1(i)-tactor.C.num)^2),sqrt((linsk4.let2(i)-tactor.C.let)^2+(linsk4.num2(i)-tactor.C.num)^2)]);
            case 'D'
                linsk4.letd(i)=mean([linsk4.let1(i) linsk4.let2(i)])-tactor.D.let; linsk4.numd(i)=mean([linsk4.num1(i) linsk4.num2(i)])-tactor.D.num;
                linsk4.le(i)=mean([sqrt((linsk4.let1(i)-tactor.D.let)^2+(linsk4.num1(i)-tactor.D.num)^2),sqrt((linsk4.let2(i)-tactor.D.let)^2+(linsk4.num2(i)-tactor.D.num)^2)]);
        end
        
    elseif linsk4.pat(i)==2 && linsk4.rp(i)==1
        switch linsk4.tac(i,1)*linsk4.tac(i,3)
            case 4488
                [linsk4.le(i),inx]=min([sqrt((linsk4.let1(i)-tactor.B.let)^2+(linsk4.num1(i)-tactor.B.num)^2),sqrt((linsk4.let1(i)-tactor.D.let)^2+(linsk4.num1(i)-tactor.D.num)^2)]);
                if sqrt((linsk4.let1(i)-tactor.B.let)^2+(linsk4.num1(i)-tactor.B.num)^2)==sqrt((linsk4.let1(i)-tactor.D.let)^2+(linsk4.num1(i)-tactor.D.num)^2)
                linsk4.letd(i)=linsk4.let1(i)-mean([tactor.B.let tactor.D.let]); linsk4.numd(i)=linsk4.num1(i)-mean([tactor.B.num tactor.D.num]);   
                elseif inx==1
                    linsk4.letd(i)=linsk4.let1(i)-tactor.B.let; linsk4.numd(i)=linsk4.num1(i)-tactor.B.num;
                else
                    linsk4.letd(i)=linsk4.let1(i)-tactor.D.let; linsk4.numd(i)=linsk4.num1(i)-tactor.D.num;
                end
            case 4420
                [linsk4.le(i),inx]=min([sqrt((linsk4.let1(i)-tactor.A.let)^2+(linsk4.num1(i)-tactor.A.num)^2),sqrt((linsk4.let1(i)-tactor.D.let)^2+(linsk4.num1(i)-tactor.D.num)^2)]);
                if sqrt((linsk4.let1(i)-tactor.A.let)^2+(linsk4.num1(i)-tactor.A.num)^2)==sqrt((linsk4.let1(i)-tactor.D.let)^2+(linsk4.num1(i)-tactor.D.num)^2)
                linsk4.letd(i)=linsk4.let1(i)-mean([tactor.A.let tactor.D.let]); linsk4.numd(i)=linsk4.num1(i)-mean([tactor.A.num tactor.D.num]);   
                elseif inx==1
                    linsk4.letd(i)=linsk4.let1(i)-tactor.A.let; linsk4.numd(i)=linsk4.num1(i)-tactor.A.num;
                else
                    linsk4.letd(i)=linsk4.let1(i)-tactor.D.let; linsk4.numd(i)=linsk4.num1(i)-tactor.D.num;
                end
            case 4290
                [linsk4.le(i),inx]=min([sqrt((linsk4.let1(i)-tactor.A.let)^2+(linsk4.num1(i)-tactor.A.num)^2),sqrt((linsk4.let1(i)-tactor.B.let)^2+(linsk4.num1(i)-tactor.B.num)^2)]);
                if sqrt((linsk4.let1(i)-tactor.A.let)^2+(linsk4.num1(i)-tactor.A.num)^2)==sqrt((linsk4.let1(i)-tactor.B.let)^2+(linsk4.num1(i)-tactor.B.num)^2)
                linsk4.letd(i)=linsk4.let1(i)-mean([tactor.A.let tactor.B.let]); linsk4.numd(i)=linsk4.num1(i)-mean([tactor.A.num tactor.B.num]);   
                elseif inx==1
                    linsk4.letd(i)=linsk4.let1(i)-tactor.A.let; linsk4.numd(i)=linsk4.num1(i)-tactor.A.num;
                else
                    linsk4.letd(i)=linsk4.let1(i)-tactor.B.let; linsk4.numd(i)=linsk4.num1(i)-tactor.B.num;
                end
            case 4422
                [linsk4.le(i),inx]=min([sqrt((linsk4.let1(i)-tactor.B.let)^2+(linsk4.num1(i)-tactor.B.num)^2),sqrt((linsk4.let1(i)-tactor.C.let)^2+(linsk4.num1(i)-tactor.C.num)^2)]);
                if sqrt((linsk4.let1(i)-tactor.B.let)^2+(linsk4.num1(i)-tactor.B.num)^2)==sqrt((linsk4.let1(i)-tactor.C.let)^2+(linsk4.num1(i)-tactor.C.num)^2)
                linsk4.letd(i)=linsk4.let1(i)-mean([tactor.B.let tactor.C.let]); linsk4.numd(i)=linsk4.num1(i)-mean([tactor.B.num tactor.C.num]);   
                elseif inx==1
                    linsk4.letd(i)=linsk4.let1(i)-tactor.B.let; linsk4.numd(i)=linsk4.num1(i)-tactor.B.num;
                else
                    linsk4.letd(i)=linsk4.let1(i)-tactor.C.let; linsk4.numd(i)=linsk4.num1(i)-tactor.C.num;
                end
            case 4355
                [linsk4.le(i),inx]=min([sqrt((linsk4.let1(i)-tactor.A.let)^2+(linsk4.num1(i)-tactor.A.num)^2),sqrt((linsk4.let1(i)-tactor.C.let)^2+(linsk4.num1(i)-tactor.C.num)^2)]);
                if sqrt((linsk4.let1(i)-tactor.A.let)^2+(linsk4.num1(i)-tactor.A.num)^2)==sqrt((linsk4.let1(i)-tactor.C.let)^2+(linsk4.num1(i)-tactor.C.num)^2)
                linsk4.letd(i)=linsk4.let1(i)-mean([tactor.A.let tactor.C.let]); linsk4.numd(i)=linsk4.num1(i)-mean([tactor.A.num tactor.C.num]);   
                elseif inx==1
                    linsk4.letd(i)=linsk4.let1(i)-tactor.A.let; linsk4.numd(i)=linsk4.num1(i)-tactor.A.num;
                else
                    linsk4.letd(i)=linsk4.let1(i)-tactor.C.let; linsk4.numd(i)=linsk4.num1(i)-tactor.C.num;
                end
        end
        
    elseif linsk4.pat(i)==3 && linsk4.rp(i)==1
        if linsk4.rt(i)<=1.75
            switch linsk4.tac(i,1)
                case 'A'
                    linsk4.letd(i)=linsk4.let1(i)-tactor.A.let; linsk4.numd(i)=linsk4.num1(i)-tactor.A.num;
                case 'B'
                    linsk4.letd(i)=linsk4.let1(i)-tactor.B.let; linsk4.numd(i)=linsk4.num1(i)-tactor.B.num;
                case 'C'
                    linsk4.letd(i)=linsk4.let1(i)-tactor.C.let; linsk4.numd(i)=linsk4.num1(i)-tactor.C.num;
                case 'D'
                    linsk4.letd(i)=linsk4.let1(i)-tactor.D.let; linsk4.numd(i)=linsk4.num1(i)-tactor.D.num;
            end
        else
            switch linsk4.tac(i,3)
                case 'A'
                    linsk4.letd(i)=linsk4.let1(i)-tactor.A.let; linsk4.numd(i)=linsk4.num1(i)-tactor.A.num;
                case 'B'
                    linsk4.letd(i)=linsk4.let1(i)-tactor.B.let; linsk4.numd(i)=linsk4.num1(i)-tactor.B.num;
                case 'C'
                    linsk4.letd(i)=linsk4.let1(i)-tactor.C.let; linsk4.numd(i)=linsk4.num1(i)-tactor.C.num;
                case 'D'
                    linsk4.letd(i)=linsk4.let1(i)-tactor.D.let; linsk4.numd(i)=linsk4.num1(i)-tactor.D.num;
            end
        end
        linsk4.le(i)=sqrt(linsk4.letd(i)^2+linsk4.numd(i)^2);

    elseif (linsk4.pat(i)==2 || linsk4.pat(i)==3) && (linsk4.rp(i)==2 || linsk4.rp(i)==3)
        switch linsk4.tac(i,1)*linsk4.tac(i,3)
            case 4488
                [linsk4.le(i),inx]=min([sqrt((linsk4.let1(i)-tactor.B.let)^2+(linsk4.num1(i)-tactor.B.num)^2)+sqrt((linsk4.let2(i)-tactor.D.let)^2+(linsk4.num2(i)-tactor.D.num)^2),sqrt((linsk4.let1(i)-tactor.D.let)^2+(linsk4.num1(i)-tactor.D.num)^2)+sqrt((linsk4.let2(i)-tactor.B.let)^2+(linsk4.num2(i)-tactor.B.num)^2)]);
                linsk4.le(i)=0.5*linsk4.le(i);
                if inx==1
                    linsk4.letd(i)=mean([linsk4.let1(i)-tactor.B.let,linsk4.let2(i)-tactor.D.let]); linsk4.numd(i)=mean([linsk4.num1(i)-tactor.B.num,linsk4.num2(i)-tactor.D.num]);
                else
                    linsk4.letd(i)=mean([linsk4.let1(i)-tactor.D.let,linsk4.let2(i)-tactor.B.let]); linsk4.numd(i)=mean([linsk4.num1(i)-tactor.D.num,linsk4.num2(i)-tactor.B.num]);
                end
            case 4420
                [linsk4.le(i),inx]=min([sqrt((linsk4.let1(i)-tactor.A.let)^2+(linsk4.num1(i)-tactor.A.num)^2)+sqrt((linsk4.let2(i)-tactor.D.let)^2+(linsk4.num2(i)-tactor.D.num)^2),sqrt((linsk4.let1(i)-tactor.D.let)^2+(linsk4.num1(i)-tactor.D.num)^2)+sqrt((linsk4.let2(i)-tactor.A.let)^2+(linsk4.num2(i)-tactor.A.num)^2)]);
                linsk4.le(i)=0.5*linsk4.le(i);
                if inx==1
                    linsk4.letd(i)=mean([linsk4.let1(i)-tactor.A.let,linsk4.let2(i)-tactor.D.let]); linsk4.numd(i)=mean([linsk4.num1(i)-tactor.A.num,linsk4.num2(i)-tactor.D.num]);
                else
                    linsk4.letd(i)=mean([linsk4.let1(i)-tactor.D.let,linsk4.let2(i)-tactor.A.let]); linsk4.numd(i)=mean([linsk4.num1(i)-tactor.D.num,linsk4.num2(i)-tactor.A.num]);
                end
            case 4290
                [linsk4.le(i),inx]=min([sqrt((linsk4.let1(i)-tactor.A.let)^2+(linsk4.num1(i)-tactor.A.num)^2)+sqrt((linsk4.let2(i)-tactor.B.let)^2+(linsk4.num2(i)-tactor.B.num)^2),sqrt((linsk4.let1(i)-tactor.B.let)^2+(linsk4.num1(i)-tactor.B.num)^2)+sqrt((linsk4.let2(i)-tactor.A.let)^2+(linsk4.num2(i)-tactor.A.num)^2)]);
                linsk4.le(i)=0.5*linsk4.le(i);
                if inx==1
                    linsk4.letd(i)=mean([linsk4.let1(i)-tactor.A.let,linsk4.let2(i)-tactor.B.let]); linsk4.numd(i)=mean([linsk4.num1(i)-tactor.A.num,linsk4.num2(i)-tactor.B.num]);
                else
                    linsk4.letd(i)=mean([linsk4.let1(i)-tactor.B.let,linsk4.let2(i)-tactor.A.let]); linsk4.numd(i)=mean([linsk4.num1(i)-tactor.B.num,linsk4.num2(i)-tactor.A.num]);
                end
            case 4422
                [linsk4.le(i),inx]=min([sqrt((linsk4.let1(i)-tactor.B.let)^2+(linsk4.num1(i)-tactor.B.num)^2)+sqrt((linsk4.let2(i)-tactor.C.let)^2+(linsk4.num2(i)-tactor.C.num)^2),sqrt((linsk4.let1(i)-tactor.C.let)^2+(linsk4.num1(i)-tactor.C.num)^2)+sqrt((linsk4.let2(i)-tactor.B.let)^2+(linsk4.num2(i)-tactor.B.num)^2)]);
                linsk4.le(i)=0.5*linsk4.le(i);
                if inx==1
                    linsk4.letd(i)=mean([linsk4.let1(i)-tactor.B.let,linsk4.let2(i)-tactor.C.let]); linsk4.numd(i)=mean([linsk4.num1(i)-tactor.B.num,linsk4.num2(i)-tactor.C.num]);
                else
                    linsk4.letd(i)=mean([linsk4.let1(i)-tactor.C.let,linsk4.let2(i)-tactor.B.let]); linsk4.numd(i)=mean([linsk4.num1(i)-tactor.C.num,linsk4.num2(i)-tactor.B.num]);
                end
            case 4355
                [linsk4.le(i),inx]=min([sqrt((linsk4.let1(i)-tactor.A.let)^2+(linsk4.num1(i)-tactor.A.num)^2)+sqrt((linsk4.let2(i)-tactor.C.let)^2+(linsk4.num2(i)-tactor.C.num)^2),sqrt((linsk4.let1(i)-tactor.C.let)^2+(linsk4.num1(i)-tactor.C.num)^2)+sqrt((linsk4.let2(i)-tactor.A.let)^2+(linsk4.num2(i)-tactor.A.num)^2)]);
                linsk4.le(i)=0.5*linsk4.le(i);
                if inx==1
                    linsk4.letd(i)=mean([linsk4.let1(i)-tactor.A.let,linsk4.let2(i)-tactor.C.let]); linsk4.numd(i)=mean([linsk4.num1(i)-tactor.A.num,linsk4.num2(i)-tactor.C.num]);
                else
                    linsk4.letd(i)=mean([linsk4.let1(i)-tactor.C.let,linsk4.let2(i)-tactor.A.let]); linsk4.numd(i)=mean([linsk4.num1(i)-tactor.C.num,linsk4.num2(i)-tactor.A.num]);
                end
        end
    else
        linsk4.le(i)=NaN; linsk4.letd(i)=NaN; linsk4.numd(i)=NaN;
    end
    
        if linsk2.pat(i)==1 && linsk2.rp(i)==1
        switch linsk2.tac(i,1)
            case 'A'
                linsk2.letd(i)=linsk2.let1(i)-tactor.A.let; linsk2.numd(i)=linsk2.num1(i)-tactor.A.num;
            case 'B'
                linsk2.letd(i)=linsk2.let1(i)-tactor.B.let; linsk2.numd(i)=linsk2.num1(i)-tactor.B.num;
            case 'C'
                linsk2.letd(i)=linsk2.let1(i)-tactor.C.let; linsk2.numd(i)=linsk2.num1(i)-tactor.C.num;
            case 'D'
                linsk2.letd(i)=linsk2.let1(i)-tactor.D.let; linsk2.numd(i)=linsk2.num1(i)-tactor.D.num;
        end
        linsk2.le(i)=sqrt(linsk2.letd(i)^2+linsk2.numd(i)^2);
        
    elseif linsk2.pat(i)==1 && (linsk2.rp(i)==2 || linsk2.rp(i)==3)
        switch linsk2.tac(i,1)
            case 'A'
                linsk2.letd(i)=mean([linsk2.let1(i) linsk2.let2(i)])-tactor.A.let; linsk2.numd(i)=mean([linsk2.num1(i) linsk2.num2(i)])-tactor.A.num;
                linsk2.le(i)=mean([sqrt((linsk2.let1(i)-tactor.A.let)^2+(linsk2.num1(i)-tactor.A.num)^2),sqrt((linsk2.let2(i)-tactor.A.let)^2+(linsk2.num2(i)-tactor.A.num)^2)]);
            case 'B'
                linsk2.letd(i)=mean([linsk2.let1(i) linsk2.let2(i)])-tactor.B.let; linsk2.numd(i)=mean([linsk2.num1(i) linsk2.num2(i)])-tactor.B.num;
                linsk2.le(i)=mean([sqrt((linsk2.let1(i)-tactor.B.let)^2+(linsk2.num1(i)-tactor.B.num)^2),sqrt((linsk2.let2(i)-tactor.B.let)^2+(linsk2.num2(i)-tactor.B.num)^2)]);
            case 'C'
                linsk2.letd(i)=mean([linsk2.let1(i) linsk2.let2(i)])-tactor.C.let; linsk2.numd(i)=mean([linsk2.num1(i) linsk2.num2(i)])-tactor.C.num;
                linsk2.le(i)=mean([sqrt((linsk2.let1(i)-tactor.C.let)^2+(linsk2.num1(i)-tactor.C.num)^2),sqrt((linsk2.let2(i)-tactor.C.let)^2+(linsk2.num2(i)-tactor.C.num)^2)]);
            case 'D'
                linsk2.letd(i)=mean([linsk2.let1(i) linsk2.let2(i)])-tactor.D.let; linsk2.numd(i)=mean([linsk2.num1(i) linsk2.num2(i)])-tactor.D.num;
                linsk2.le(i)=mean([sqrt((linsk2.let1(i)-tactor.D.let)^2+(linsk2.num1(i)-tactor.D.num)^2),sqrt((linsk2.let2(i)-tactor.D.let)^2+(linsk2.num2(i)-tactor.D.num)^2)]);
        end
        
    elseif linsk2.pat(i)==2 && linsk2.rp(i)==1
        switch linsk2.tac(i,1)*linsk2.tac(i,3)
            case 4488
                [linsk2.le(i),inx]=min([sqrt((linsk2.let1(i)-tactor.B.let)^2+(linsk2.num1(i)-tactor.B.num)^2),sqrt((linsk2.let1(i)-tactor.D.let)^2+(linsk2.num1(i)-tactor.D.num)^2)]);
                if sqrt((linsk2.let1(i)-tactor.B.let)^2+(linsk2.num1(i)-tactor.B.num)^2)==sqrt((linsk2.let1(i)-tactor.D.let)^2+(linsk2.num1(i)-tactor.D.num)^2)
                linsk2.letd(i)=linsk2.let1(i)-mean([tactor.B.let tactor.D.let]); linsk2.numd(i)=linsk2.num1(i)-mean([tactor.B.num tactor.D.num]);   
                elseif inx==1
                    linsk2.letd(i)=linsk2.let1(i)-tactor.B.let; linsk2.numd(i)=linsk2.num1(i)-tactor.B.num;
                else
                    linsk2.letd(i)=linsk2.let1(i)-tactor.D.let; linsk2.numd(i)=linsk2.num1(i)-tactor.D.num;
                end
            case 4420
                [linsk2.le(i),inx]=min([sqrt((linsk2.let1(i)-tactor.A.let)^2+(linsk2.num1(i)-tactor.A.num)^2),sqrt((linsk2.let1(i)-tactor.D.let)^2+(linsk2.num1(i)-tactor.D.num)^2)]);
                if sqrt((linsk2.let1(i)-tactor.A.let)^2+(linsk2.num1(i)-tactor.A.num)^2)==sqrt((linsk2.let1(i)-tactor.D.let)^2+(linsk2.num1(i)-tactor.D.num)^2)
                linsk2.letd(i)=linsk2.let1(i)-mean([tactor.A.let tactor.D.let]); linsk2.numd(i)=linsk2.num1(i)-mean([tactor.A.num tactor.D.num]);   
                elseif inx==1
                    linsk2.letd(i)=linsk2.let1(i)-tactor.A.let; linsk2.numd(i)=linsk2.num1(i)-tactor.A.num;
                else
                    linsk2.letd(i)=linsk2.let1(i)-tactor.D.let; linsk2.numd(i)=linsk2.num1(i)-tactor.D.num;
                end
            case 4290
                [linsk2.le(i),inx]=min([sqrt((linsk2.let1(i)-tactor.A.let)^2+(linsk2.num1(i)-tactor.A.num)^2),sqrt((linsk2.let1(i)-tactor.B.let)^2+(linsk2.num1(i)-tactor.B.num)^2)]);
                if sqrt((linsk2.let1(i)-tactor.A.let)^2+(linsk2.num1(i)-tactor.A.num)^2)==sqrt((linsk2.let1(i)-tactor.B.let)^2+(linsk2.num1(i)-tactor.B.num)^2)
                linsk2.letd(i)=linsk2.let1(i)-mean([tactor.A.let tactor.B.let]); linsk2.numd(i)=linsk2.num1(i)-mean([tactor.A.num tactor.B.num]);   
                elseif inx==1
                    linsk2.letd(i)=linsk2.let1(i)-tactor.A.let; linsk2.numd(i)=linsk2.num1(i)-tactor.A.num;
                else
                    linsk2.letd(i)=linsk2.let1(i)-tactor.B.let; linsk2.numd(i)=linsk2.num1(i)-tactor.B.num;
                end
            case 4422
                [linsk2.le(i),inx]=min([sqrt((linsk2.let1(i)-tactor.B.let)^2+(linsk2.num1(i)-tactor.B.num)^2),sqrt((linsk2.let1(i)-tactor.C.let)^2+(linsk2.num1(i)-tactor.C.num)^2)]);
                if sqrt((linsk2.let1(i)-tactor.B.let)^2+(linsk2.num1(i)-tactor.B.num)^2)==sqrt((linsk2.let1(i)-tactor.C.let)^2+(linsk2.num1(i)-tactor.C.num)^2)
                linsk2.letd(i)=linsk2.let1(i)-mean([tactor.B.let tactor.C.let]); linsk2.numd(i)=linsk2.num1(i)-mean([tactor.B.num tactor.C.num]);   
                elseif inx==1
                    linsk2.letd(i)=linsk2.let1(i)-tactor.B.let; linsk2.numd(i)=linsk2.num1(i)-tactor.B.num;
                else
                    linsk2.letd(i)=linsk2.let1(i)-tactor.C.let; linsk2.numd(i)=linsk2.num1(i)-tactor.C.num;
                end
            case 4355
                [linsk2.le(i),inx]=min([sqrt((linsk2.let1(i)-tactor.A.let)^2+(linsk2.num1(i)-tactor.A.num)^2),sqrt((linsk2.let1(i)-tactor.C.let)^2+(linsk2.num1(i)-tactor.C.num)^2)]);
                if sqrt((linsk2.let1(i)-tactor.A.let)^2+(linsk2.num1(i)-tactor.A.num)^2)==sqrt((linsk2.let1(i)-tactor.C.let)^2+(linsk2.num1(i)-tactor.C.num)^2)
                linsk2.letd(i)=linsk2.let1(i)-mean([tactor.A.let tactor.C.let]); linsk2.numd(i)=linsk2.num1(i)-mean([tactor.A.num tactor.C.num]);   
                elseif inx==1
                    linsk2.letd(i)=linsk2.let1(i)-tactor.A.let; linsk2.numd(i)=linsk2.num1(i)-tactor.A.num;
                else
                    linsk2.letd(i)=linsk2.let1(i)-tactor.C.let; linsk2.numd(i)=linsk2.num1(i)-tactor.C.num;
                end
        end
        
    elseif linsk2.pat(i)==3 && linsk2.rp(i)==1
        if linsk2.rt(i)<=1.75
            switch linsk2.tac(i,1)
                case 'A'
                    linsk2.letd(i)=linsk2.let1(i)-tactor.A.let; linsk2.numd(i)=linsk2.num1(i)-tactor.A.num;
                case 'B'
                    linsk2.letd(i)=linsk2.let1(i)-tactor.B.let; linsk2.numd(i)=linsk2.num1(i)-tactor.B.num;
                case 'C'
                    linsk2.letd(i)=linsk2.let1(i)-tactor.C.let; linsk2.numd(i)=linsk2.num1(i)-tactor.C.num;
                case 'D'
                    linsk2.letd(i)=linsk2.let1(i)-tactor.D.let; linsk2.numd(i)=linsk2.num1(i)-tactor.D.num;
            end
        else
            switch linsk2.tac(i,3)
                case 'A'
                    linsk2.letd(i)=linsk2.let1(i)-tactor.A.let; linsk2.numd(i)=linsk2.num1(i)-tactor.A.num;
                case 'B'
                    linsk2.letd(i)=linsk2.let1(i)-tactor.B.let; linsk2.numd(i)=linsk2.num1(i)-tactor.B.num;
                case 'C'
                    linsk2.letd(i)=linsk2.let1(i)-tactor.C.let; linsk2.numd(i)=linsk2.num1(i)-tactor.C.num;
                case 'D'
                    linsk2.letd(i)=linsk2.let1(i)-tactor.D.let; linsk2.numd(i)=linsk2.num1(i)-tactor.D.num;
            end
        end
        linsk2.le(i)=sqrt(linsk2.letd(i)^2+linsk2.numd(i)^2);
 
    elseif (linsk2.pat(i)==2 || linsk2.pat(i)==3) && (linsk2.rp(i)==2 || linsk2.rp(i)==3)
        switch linsk2.tac(i,1)*linsk2.tac(i,3)
            case 4488
                [linsk2.le(i),inx]=min([sqrt((linsk2.let1(i)-tactor.B.let)^2+(linsk2.num1(i)-tactor.B.num)^2)+sqrt((linsk2.let2(i)-tactor.D.let)^2+(linsk2.num2(i)-tactor.D.num)^2),sqrt((linsk2.let1(i)-tactor.D.let)^2+(linsk2.num1(i)-tactor.D.num)^2)+sqrt((linsk2.let2(i)-tactor.B.let)^2+(linsk2.num2(i)-tactor.B.num)^2)]);
                linsk2.le(i)=0.5*linsk2.le(i);
                if inx==1
                    linsk2.letd(i)=mean([linsk2.let1(i)-tactor.B.let,linsk2.let2(i)-tactor.D.let]); linsk2.numd(i)=mean([linsk2.num1(i)-tactor.B.num,linsk2.num2(i)-tactor.D.num]);
                else
                    linsk2.letd(i)=mean([linsk2.let1(i)-tactor.D.let,linsk2.let2(i)-tactor.B.let]); linsk2.numd(i)=mean([linsk2.num1(i)-tactor.D.num,linsk2.num2(i)-tactor.B.num]);
                end
            case 4420
                [linsk2.le(i),inx]=min([sqrt((linsk2.let1(i)-tactor.A.let)^2+(linsk2.num1(i)-tactor.A.num)^2)+sqrt((linsk2.let2(i)-tactor.D.let)^2+(linsk2.num2(i)-tactor.D.num)^2),sqrt((linsk2.let1(i)-tactor.D.let)^2+(linsk2.num1(i)-tactor.D.num)^2)+sqrt((linsk2.let2(i)-tactor.A.let)^2+(linsk2.num2(i)-tactor.A.num)^2)]);
                linsk2.le(i)=0.5*linsk2.le(i);
                if inx==1
                    linsk2.letd(i)=mean([linsk2.let1(i)-tactor.A.let,linsk2.let2(i)-tactor.D.let]); linsk2.numd(i)=mean([linsk2.num1(i)-tactor.A.num,linsk2.num2(i)-tactor.D.num]);
                else
                    linsk2.letd(i)=mean([linsk2.let1(i)-tactor.D.let,linsk2.let2(i)-tactor.A.let]); linsk2.numd(i)=mean([linsk2.num1(i)-tactor.D.num,linsk2.num2(i)-tactor.A.num]);
                end
            case 4290
                [linsk2.le(i),inx]=min([sqrt((linsk2.let1(i)-tactor.A.let)^2+(linsk2.num1(i)-tactor.A.num)^2)+sqrt((linsk2.let2(i)-tactor.B.let)^2+(linsk2.num2(i)-tactor.B.num)^2),sqrt((linsk2.let1(i)-tactor.B.let)^2+(linsk2.num1(i)-tactor.B.num)^2)+sqrt((linsk2.let2(i)-tactor.A.let)^2+(linsk2.num2(i)-tactor.A.num)^2)]);
                linsk2.le(i)=0.5*linsk2.le(i);
                if inx==1
                    linsk2.letd(i)=mean([linsk2.let1(i)-tactor.A.let,linsk2.let2(i)-tactor.B.let]); linsk2.numd(i)=mean([linsk2.num1(i)-tactor.A.num,linsk2.num2(i)-tactor.B.num]);
                else
                    linsk2.letd(i)=mean([linsk2.let1(i)-tactor.B.let,linsk2.let2(i)-tactor.A.let]); linsk2.numd(i)=mean([linsk2.num1(i)-tactor.B.num,linsk2.num2(i)-tactor.A.num]);
                end
            case 4422
                [linsk2.le(i),inx]=min([sqrt((linsk2.let1(i)-tactor.B.let)^2+(linsk2.num1(i)-tactor.B.num)^2)+sqrt((linsk2.let2(i)-tactor.C.let)^2+(linsk2.num2(i)-tactor.C.num)^2),sqrt((linsk2.let1(i)-tactor.C.let)^2+(linsk2.num1(i)-tactor.C.num)^2)+sqrt((linsk2.let2(i)-tactor.B.let)^2+(linsk2.num2(i)-tactor.B.num)^2)]);
                linsk2.le(i)=0.5*linsk2.le(i);
                if inx==1
                    linsk2.letd(i)=mean([linsk2.let1(i)-tactor.B.let,linsk2.let2(i)-tactor.C.let]); linsk2.numd(i)=mean([linsk2.num1(i)-tactor.B.num,linsk2.num2(i)-tactor.C.num]);
                else
                    linsk2.letd(i)=mean([linsk2.let1(i)-tactor.C.let,linsk2.let2(i)-tactor.B.let]); linsk2.numd(i)=mean([linsk2.num1(i)-tactor.C.num,linsk2.num2(i)-tactor.B.num]);
                end
            case 4355
                [linsk2.le(i),inx]=min([sqrt((linsk2.let1(i)-tactor.A.let)^2+(linsk2.num1(i)-tactor.A.num)^2)+sqrt((linsk2.let2(i)-tactor.C.let)^2+(linsk2.num2(i)-tactor.C.num)^2),sqrt((linsk2.let1(i)-tactor.C.let)^2+(linsk2.num1(i)-tactor.C.num)^2)+sqrt((linsk2.let2(i)-tactor.A.let)^2+(linsk2.num2(i)-tactor.A.num)^2)]);
                linsk2.le(i)=0.5*linsk2.le(i);
                if inx==1
                    linsk2.letd(i)=mean([linsk2.let1(i)-tactor.A.let,linsk2.let2(i)-tactor.C.let]); linsk2.numd(i)=mean([linsk2.num1(i)-tactor.A.num,linsk2.num2(i)-tactor.C.num]);
                else
                    linsk2.letd(i)=mean([linsk2.let1(i)-tactor.C.let,linsk2.let2(i)-tactor.A.let]); linsk2.numd(i)=mean([linsk2.num1(i)-tactor.C.num,linsk2.num2(i)-tactor.A.num]);
                end
        end
        else
        linsk2.le(i)=NaN; linsk2.letd(i)=NaN; linsk2.numd(i)=NaN;
        end
    
        if linso4.pat(i)==1 && linso4.rp(i)==1
        switch linso4.tac(i,1)
            case 'A'
                linso4.letd(i)=linso4.let1(i)-tactor.A.let; linso4.numd(i)=linso4.num1(i)-tactor.A.num;
            case 'B'
                linso4.letd(i)=linso4.let1(i)-tactor.B.let; linso4.numd(i)=linso4.num1(i)-tactor.B.num;
            case 'C'
                linso4.letd(i)=linso4.let1(i)-tactor.C.let; linso4.numd(i)=linso4.num1(i)-tactor.C.num;
            case 'D'
                linso4.letd(i)=linso4.let1(i)-tactor.D.let; linso4.numd(i)=linso4.num1(i)-tactor.D.num;
        end
        linso4.le(i)=sqrt(linso4.letd(i)^2+linso4.numd(i)^2);
        
    elseif linso4.pat(i)==1 && (linso4.rp(i)==2 || linso4.rp(i)==3)
        switch linso4.tac(i,1)
            case 'A'
                linso4.letd(i)=mean([linso4.let1(i) linso4.let2(i)])-tactor.A.let; linso4.numd(i)=mean([linso4.num1(i) linso4.num2(i)])-tactor.A.num;
                linso4.le(i)=mean([sqrt((linso4.let1(i)-tactor.A.let)^2+(linso4.num1(i)-tactor.A.num)^2),sqrt((linso4.let2(i)-tactor.A.let)^2+(linso4.num2(i)-tactor.A.num)^2)]);
            case 'B'
                linso4.letd(i)=mean([linso4.let1(i) linso4.let2(i)])-tactor.B.let; linso4.numd(i)=mean([linso4.num1(i) linso4.num2(i)])-tactor.B.num;
                linso4.le(i)=mean([sqrt((linso4.let1(i)-tactor.B.let)^2+(linso4.num1(i)-tactor.B.num)^2),sqrt((linso4.let2(i)-tactor.B.let)^2+(linso4.num2(i)-tactor.B.num)^2)]);
            case 'C'
                linso4.letd(i)=mean([linso4.let1(i) linso4.let2(i)])-tactor.C.let; linso4.numd(i)=mean([linso4.num1(i) linso4.num2(i)])-tactor.C.num;
                linso4.le(i)=mean([sqrt((linso4.let1(i)-tactor.C.let)^2+(linso4.num1(i)-tactor.C.num)^2),sqrt((linso4.let2(i)-tactor.C.let)^2+(linso4.num2(i)-tactor.C.num)^2)]);
            case 'D'
                linso4.letd(i)=mean([linso4.let1(i) linso4.let2(i)])-tactor.D.let; linso4.numd(i)=mean([linso4.num1(i) linso4.num2(i)])-tactor.D.num;
                linso4.le(i)=mean([sqrt((linso4.let1(i)-tactor.D.let)^2+(linso4.num1(i)-tactor.D.num)^2),sqrt((linso4.let2(i)-tactor.D.let)^2+(linso4.num2(i)-tactor.D.num)^2)]);
        end
        
    elseif linso4.pat(i)==2 && linso4.rp(i)==1
        switch linso4.tac(i,1)*linso4.tac(i,3)
            case 4488
                [linso4.le(i),inx]=min([sqrt((linso4.let1(i)-tactor.B.let)^2+(linso4.num1(i)-tactor.B.num)^2),sqrt((linso4.let1(i)-tactor.D.let)^2+(linso4.num1(i)-tactor.D.num)^2)]);
                if sqrt((linso4.let1(i)-tactor.B.let)^2+(linso4.num1(i)-tactor.B.num)^2)==sqrt((linso4.let1(i)-tactor.D.let)^2+(linso4.num1(i)-tactor.D.num)^2)
                linso4.letd(i)=linso4.let1(i)-mean([tactor.B.let tactor.D.let]); linso4.numd(i)=linso4.num1(i)-mean([tactor.B.num tactor.D.num]);   
                elseif inx==1
                    linso4.letd(i)=linso4.let1(i)-tactor.B.let; linso4.numd(i)=linso4.num1(i)-tactor.B.num;
                else
                    linso4.letd(i)=linso4.let1(i)-tactor.D.let; linso4.numd(i)=linso4.num1(i)-tactor.D.num;
                end
            case 4420
                [linso4.le(i),inx]=min([sqrt((linso4.let1(i)-tactor.A.let)^2+(linso4.num1(i)-tactor.A.num)^2),sqrt((linso4.let1(i)-tactor.D.let)^2+(linso4.num1(i)-tactor.D.num)^2)]);
                if sqrt((linso4.let1(i)-tactor.A.let)^2+(linso4.num1(i)-tactor.A.num)^2)==sqrt((linso4.let1(i)-tactor.D.let)^2+(linso4.num1(i)-tactor.D.num)^2)
                linso4.letd(i)=linso4.let1(i)-mean([tactor.A.let tactor.D.let]); linso4.numd(i)=linso4.num1(i)-mean([tactor.A.num tactor.D.num]);   
                elseif inx==1
                    linso4.letd(i)=linso4.let1(i)-tactor.A.let; linso4.numd(i)=linso4.num1(i)-tactor.A.num;
                else
                    linso4.letd(i)=linso4.let1(i)-tactor.D.let; linso4.numd(i)=linso4.num1(i)-tactor.D.num;
                end
            case 4290
                [linso4.le(i),inx]=min([sqrt((linso4.let1(i)-tactor.A.let)^2+(linso4.num1(i)-tactor.A.num)^2),sqrt((linso4.let1(i)-tactor.B.let)^2+(linso4.num1(i)-tactor.B.num)^2)]);
                if sqrt((linso4.let1(i)-tactor.A.let)^2+(linso4.num1(i)-tactor.A.num)^2)==sqrt((linso4.let1(i)-tactor.B.let)^2+(linso4.num1(i)-tactor.B.num)^2)
                linso4.letd(i)=linso4.let1(i)-mean([tactor.A.let tactor.B.let]); linso4.numd(i)=linso4.num1(i)-mean([tactor.A.num tactor.B.num]);   
                elseif inx==1
                    linso4.letd(i)=linso4.let1(i)-tactor.A.let; linso4.numd(i)=linso4.num1(i)-tactor.A.num;
                else
                    linso4.letd(i)=linso4.let1(i)-tactor.B.let; linso4.numd(i)=linso4.num1(i)-tactor.B.num;
                end
            case 4422
                [linso4.le(i),inx]=min([sqrt((linso4.let1(i)-tactor.B.let)^2+(linso4.num1(i)-tactor.B.num)^2),sqrt((linso4.let1(i)-tactor.C.let)^2+(linso4.num1(i)-tactor.C.num)^2)]);
                if sqrt((linso4.let1(i)-tactor.B.let)^2+(linso4.num1(i)-tactor.B.num)^2)==sqrt((linso4.let1(i)-tactor.C.let)^2+(linso4.num1(i)-tactor.C.num)^2)
                linso4.letd(i)=linso4.let1(i)-mean([tactor.B.let tactor.C.let]); linso4.numd(i)=linso4.num1(i)-mean([tactor.B.num tactor.C.num]);   
                elseif inx==1
                    linso4.letd(i)=linso4.let1(i)-tactor.B.let; linso4.numd(i)=linso4.num1(i)-tactor.B.num;
                else
                    linso4.letd(i)=linso4.let1(i)-tactor.C.let; linso4.numd(i)=linso4.num1(i)-tactor.C.num;
                end
            case 4355
                [linso4.le(i),inx]=min([sqrt((linso4.let1(i)-tactor.A.let)^2+(linso4.num1(i)-tactor.A.num)^2),sqrt((linso4.let1(i)-tactor.C.let)^2+(linso4.num1(i)-tactor.C.num)^2)]);
                if sqrt((linso4.let1(i)-tactor.A.let)^2+(linso4.num1(i)-tactor.A.num)^2)==sqrt((linso4.let1(i)-tactor.C.let)^2+(linso4.num1(i)-tactor.C.num)^2)
                linso4.letd(i)=linso4.let1(i)-mean([tactor.A.let tactor.C.let]); linso4.numd(i)=linso4.num1(i)-mean([tactor.A.num tactor.C.num]);   
                elseif inx==1
                    linso4.letd(i)=linso4.let1(i)-tactor.A.let; linso4.numd(i)=linso4.num1(i)-tactor.A.num;
                else
                    linso4.letd(i)=linso4.let1(i)-tactor.C.let; linso4.numd(i)=linso4.num1(i)-tactor.C.num;
                end
        end
        
    elseif linso4.pat(i)==3 && linso4.rp(i)==1
        if linso4.rt(i)<=1.75
            switch linso4.tac(i,1)
                case 'A'
                    linso4.letd(i)=linso4.let1(i)-tactor.A.let; linso4.numd(i)=linso4.num1(i)-tactor.A.num;
                case 'B'
                    linso4.letd(i)=linso4.let1(i)-tactor.B.let; linso4.numd(i)=linso4.num1(i)-tactor.B.num;
                case 'C'
                    linso4.letd(i)=linso4.let1(i)-tactor.C.let; linso4.numd(i)=linso4.num1(i)-tactor.C.num;
                case 'D'
                    linso4.letd(i)=linso4.let1(i)-tactor.D.let; linso4.numd(i)=linso4.num1(i)-tactor.D.num;
            end
        else
            switch linso4.tac(i,3)
                case 'A'
                    linso4.letd(i)=linso4.let1(i)-tactor.A.let; linso4.numd(i)=linso4.num1(i)-tactor.A.num;
                case 'B'
                    linso4.letd(i)=linso4.let1(i)-tactor.B.let; linso4.numd(i)=linso4.num1(i)-tactor.B.num;
                case 'C'
                    linso4.letd(i)=linso4.let1(i)-tactor.C.let; linso4.numd(i)=linso4.num1(i)-tactor.C.num;
                case 'D'
                    linso4.letd(i)=linso4.let1(i)-tactor.D.let; linso4.numd(i)=linso4.num1(i)-tactor.D.num;
            end
        end
        linso4.le(i)=sqrt(linso4.letd(i)^2+linso4.numd(i)^2);
 
    elseif (linso4.pat(i)==2 || linso4.pat(i)==3) && (linso4.rp(i)==2 || linso4.rp(i)==3)
        switch linso4.tac(i,1)*linso4.tac(i,3)
            case 4488
                [linso4.le(i),inx]=min([sqrt((linso4.let1(i)-tactor.B.let)^2+(linso4.num1(i)-tactor.B.num)^2)+sqrt((linso4.let2(i)-tactor.D.let)^2+(linso4.num2(i)-tactor.D.num)^2),sqrt((linso4.let1(i)-tactor.D.let)^2+(linso4.num1(i)-tactor.D.num)^2)+sqrt((linso4.let2(i)-tactor.B.let)^2+(linso4.num2(i)-tactor.B.num)^2)]);
                linso4.le(i)=0.5*linso4.le(i);
                if inx==1
                    linso4.letd(i)=mean([linso4.let1(i)-tactor.B.let,linso4.let2(i)-tactor.D.let]); linso4.numd(i)=mean([linso4.num1(i)-tactor.B.num,linso4.num2(i)-tactor.D.num]);
                else
                    linso4.letd(i)=mean([linso4.let1(i)-tactor.D.let,linso4.let2(i)-tactor.B.let]); linso4.numd(i)=mean([linso4.num1(i)-tactor.D.num,linso4.num2(i)-tactor.B.num]);
                end
            case 4420
                [linso4.le(i),inx]=min([sqrt((linso4.let1(i)-tactor.A.let)^2+(linso4.num1(i)-tactor.A.num)^2)+sqrt((linso4.let2(i)-tactor.D.let)^2+(linso4.num2(i)-tactor.D.num)^2),sqrt((linso4.let1(i)-tactor.D.let)^2+(linso4.num1(i)-tactor.D.num)^2)+sqrt((linso4.let2(i)-tactor.A.let)^2+(linso4.num2(i)-tactor.A.num)^2)]);
                linso4.le(i)=0.5*linso4.le(i);
                if inx==1
                    linso4.letd(i)=mean([linso4.let1(i)-tactor.A.let,linso4.let2(i)-tactor.D.let]); linso4.numd(i)=mean([linso4.num1(i)-tactor.A.num,linso4.num2(i)-tactor.D.num]);
                else
                    linso4.letd(i)=mean([linso4.let1(i)-tactor.D.let,linso4.let2(i)-tactor.A.let]); linso4.numd(i)=mean([linso4.num1(i)-tactor.D.num,linso4.num2(i)-tactor.A.num]);
                end
            case 4290
                [linso4.le(i),inx]=min([sqrt((linso4.let1(i)-tactor.A.let)^2+(linso4.num1(i)-tactor.A.num)^2)+sqrt((linso4.let2(i)-tactor.B.let)^2+(linso4.num2(i)-tactor.B.num)^2),sqrt((linso4.let1(i)-tactor.B.let)^2+(linso4.num1(i)-tactor.B.num)^2)+sqrt((linso4.let2(i)-tactor.A.let)^2+(linso4.num2(i)-tactor.A.num)^2)]);
                linso4.le(i)=0.5*linso4.le(i);
                if inx==1
                    linso4.letd(i)=mean([linso4.let1(i)-tactor.A.let,linso4.let2(i)-tactor.B.let]); linso4.numd(i)=mean([linso4.num1(i)-tactor.A.num,linso4.num2(i)-tactor.B.num]);
                else
                    linso4.letd(i)=mean([linso4.let1(i)-tactor.B.let,linso4.let2(i)-tactor.A.let]); linso4.numd(i)=mean([linso4.num1(i)-tactor.B.num,linso4.num2(i)-tactor.A.num]);
                end
            case 4422
                [linso4.le(i),inx]=min([sqrt((linso4.let1(i)-tactor.B.let)^2+(linso4.num1(i)-tactor.B.num)^2)+sqrt((linso4.let2(i)-tactor.C.let)^2+(linso4.num2(i)-tactor.C.num)^2),sqrt((linso4.let1(i)-tactor.C.let)^2+(linso4.num1(i)-tactor.C.num)^2)+sqrt((linso4.let2(i)-tactor.B.let)^2+(linso4.num2(i)-tactor.B.num)^2)]);
                linso4.le(i)=0.5*linso4.le(i);
                if inx==1
                    linso4.letd(i)=mean([linso4.let1(i)-tactor.B.let,linso4.let2(i)-tactor.C.let]); linso4.numd(i)=mean([linso4.num1(i)-tactor.B.num,linso4.num2(i)-tactor.C.num]);
                else
                    linso4.letd(i)=mean([linso4.let1(i)-tactor.C.let,linso4.let2(i)-tactor.B.let]); linso4.numd(i)=mean([linso4.num1(i)-tactor.C.num,linso4.num2(i)-tactor.B.num]);
                end
            case 4355
                [linso4.le(i),inx]=min([sqrt((linso4.let1(i)-tactor.A.let)^2+(linso4.num1(i)-tactor.A.num)^2)+sqrt((linso4.let2(i)-tactor.C.let)^2+(linso4.num2(i)-tactor.C.num)^2),sqrt((linso4.let1(i)-tactor.C.let)^2+(linso4.num1(i)-tactor.C.num)^2)+sqrt((linso4.let2(i)-tactor.A.let)^2+(linso4.num2(i)-tactor.A.num)^2)]);
                linso4.le(i)=0.5*linso4.le(i);
                if inx==1
                    linso4.letd(i)=mean([linso4.let1(i)-tactor.A.let,linso4.let2(i)-tactor.C.let]); linso4.numd(i)=mean([linso4.num1(i)-tactor.A.num,linso4.num2(i)-tactor.C.num]);
                else
                    linso4.letd(i)=mean([linso4.let1(i)-tactor.C.let,linso4.let2(i)-tactor.A.let]); linso4.numd(i)=mean([linso4.num1(i)-tactor.C.num,linso4.num2(i)-tactor.A.num]);
                end
        end
        else
        linso4.le(i)=NaN; linso4.letd(i)=NaN; linso4.numd(i)=NaN;
        end

    if linso2.pat(i)==1 && linso2.rp(i)==1
        switch linso2.tac(i,1)
            case 'A'
                linso2.letd(i)=linso2.let1(i)-tactor.A.let; linso2.numd(i)=linso2.num1(i)-tactor.A.num;
            case 'B'
                linso2.letd(i)=linso2.let1(i)-tactor.B.let; linso2.numd(i)=linso2.num1(i)-tactor.B.num;
            case 'C'
                linso2.letd(i)=linso2.let1(i)-tactor.C.let; linso2.numd(i)=linso2.num1(i)-tactor.C.num;
            case 'D'
                linso2.letd(i)=linso2.let1(i)-tactor.D.let; linso2.numd(i)=linso2.num1(i)-tactor.D.num;
        end
        linso2.le(i)=sqrt(linso2.letd(i)^2+linso2.numd(i)^2);
        
    elseif linso2.pat(i)==1 && (linso2.rp(i)==2 || linso2.rp(i)==3)
        switch linso2.tac(i,1)
            case 'A'
                linso2.letd(i)=mean([linso2.let1(i) linso2.let2(i)])-tactor.A.let; linso2.numd(i)=mean([linso2.num1(i) linso2.num2(i)])-tactor.A.num;
                linso2.le(i)=mean([sqrt((linso2.let1(i)-tactor.A.let)^2+(linso2.num1(i)-tactor.A.num)^2),sqrt((linso2.let2(i)-tactor.A.let)^2+(linso2.num2(i)-tactor.A.num)^2)]);
            case 'B'
                linso2.letd(i)=mean([linso2.let1(i) linso2.let2(i)])-tactor.B.let; linso2.numd(i)=mean([linso2.num1(i) linso2.num2(i)])-tactor.B.num;
                linso2.le(i)=mean([sqrt((linso2.let1(i)-tactor.B.let)^2+(linso2.num1(i)-tactor.B.num)^2),sqrt((linso2.let2(i)-tactor.B.let)^2+(linso2.num2(i)-tactor.B.num)^2)]);
            case 'C'
                linso2.letd(i)=mean([linso2.let1(i) linso2.let2(i)])-tactor.C.let; linso2.numd(i)=mean([linso2.num1(i) linso2.num2(i)])-tactor.C.num;
                linso2.le(i)=mean([sqrt((linso2.let1(i)-tactor.C.let)^2+(linso2.num1(i)-tactor.C.num)^2),sqrt((linso2.let2(i)-tactor.C.let)^2+(linso2.num2(i)-tactor.C.num)^2)]);
            case 'D'
                linso2.letd(i)=mean([linso2.let1(i) linso2.let2(i)])-tactor.D.let; linso2.numd(i)=mean([linso2.num1(i) linso2.num2(i)])-tactor.D.num;
                linso2.le(i)=mean([sqrt((linso2.let1(i)-tactor.D.let)^2+(linso2.num1(i)-tactor.D.num)^2),sqrt((linso2.let2(i)-tactor.D.let)^2+(linso2.num2(i)-tactor.D.num)^2)]);
        end
        
    elseif linso2.pat(i)==2 && linso2.rp(i)==1
        switch linso2.tac(i,1)*linso2.tac(i,3)
            case 4488
                [linso2.le(i),inx]=min([sqrt((linso2.let1(i)-tactor.B.let)^2+(linso2.num1(i)-tactor.B.num)^2),sqrt((linso2.let1(i)-tactor.D.let)^2+(linso2.num1(i)-tactor.D.num)^2)]);
                if sqrt((linso2.let1(i)-tactor.B.let)^2+(linso2.num1(i)-tactor.B.num)^2)==sqrt((linso2.let1(i)-tactor.D.let)^2+(linso2.num1(i)-tactor.D.num)^2)
                linso2.letd(i)=linso2.let1(i)-mean([tactor.B.let tactor.D.let]); linso2.numd(i)=linso2.num1(i)-mean([tactor.B.num tactor.D.num]);   
                elseif inx==1
                    linso2.letd(i)=linso2.let1(i)-tactor.B.let; linso2.numd(i)=linso2.num1(i)-tactor.B.num;
                else
                    linso2.letd(i)=linso2.let1(i)-tactor.D.let; linso2.numd(i)=linso2.num1(i)-tactor.D.num;
                end
            case 4420
                [linso2.le(i),inx]=min([sqrt((linso2.let1(i)-tactor.A.let)^2+(linso2.num1(i)-tactor.A.num)^2),sqrt((linso2.let1(i)-tactor.D.let)^2+(linso2.num1(i)-tactor.D.num)^2)]);
                if sqrt((linso2.let1(i)-tactor.A.let)^2+(linso2.num1(i)-tactor.A.num)^2)==sqrt((linso2.let1(i)-tactor.D.let)^2+(linso2.num1(i)-tactor.D.num)^2)
                linso2.letd(i)=linso2.let1(i)-mean([tactor.A.let tactor.D.let]); linso2.numd(i)=linso2.num1(i)-mean([tactor.A.num tactor.D.num]);   
                elseif inx==1
                    linso2.letd(i)=linso2.let1(i)-tactor.A.let; linso2.numd(i)=linso2.num1(i)-tactor.A.num;
                else
                    linso2.letd(i)=linso2.let1(i)-tactor.D.let; linso2.numd(i)=linso2.num1(i)-tactor.D.num;
                end
            case 4290
                [linso2.le(i),inx]=min([sqrt((linso2.let1(i)-tactor.A.let)^2+(linso2.num1(i)-tactor.A.num)^2),sqrt((linso2.let1(i)-tactor.B.let)^2+(linso2.num1(i)-tactor.B.num)^2)]);
                if sqrt((linso2.let1(i)-tactor.A.let)^2+(linso2.num1(i)-tactor.A.num)^2)==sqrt((linso2.let1(i)-tactor.B.let)^2+(linso2.num1(i)-tactor.B.num)^2)
                linso2.letd(i)=linso2.let1(i)-mean([tactor.A.let tactor.B.let]); linso2.numd(i)=linso2.num1(i)-mean([tactor.A.num tactor.B.num]);   
                elseif inx==1
                    linso2.letd(i)=linso2.let1(i)-tactor.A.let; linso2.numd(i)=linso2.num1(i)-tactor.A.num;
                else
                    linso2.letd(i)=linso2.let1(i)-tactor.B.let; linso2.numd(i)=linso2.num1(i)-tactor.B.num;
                end
            case 4422
                [linso2.le(i),inx]=min([sqrt((linso2.let1(i)-tactor.B.let)^2+(linso2.num1(i)-tactor.B.num)^2),sqrt((linso2.let1(i)-tactor.C.let)^2+(linso2.num1(i)-tactor.C.num)^2)]);
                if sqrt((linso2.let1(i)-tactor.B.let)^2+(linso2.num1(i)-tactor.B.num)^2)==sqrt((linso2.let1(i)-tactor.C.let)^2+(linso2.num1(i)-tactor.C.num)^2)
                linso2.letd(i)=linso2.let1(i)-mean([tactor.B.let tactor.C.let]); linso2.numd(i)=linso2.num1(i)-mean([tactor.B.num tactor.C.num]);   
                elseif inx==1
                    linso2.letd(i)=linso2.let1(i)-tactor.B.let; linso2.numd(i)=linso2.num1(i)-tactor.B.num;
                else
                    linso2.letd(i)=linso2.let1(i)-tactor.C.let; linso2.numd(i)=linso2.num1(i)-tactor.C.num;
                end
            case 4355
                [linso2.le(i),inx]=min([sqrt((linso2.let1(i)-tactor.A.let)^2+(linso2.num1(i)-tactor.A.num)^2),sqrt((linso2.let1(i)-tactor.C.let)^2+(linso2.num1(i)-tactor.C.num)^2)]);
                if sqrt((linso2.let1(i)-tactor.A.let)^2+(linso2.num1(i)-tactor.A.num)^2)==sqrt((linso2.let1(i)-tactor.C.let)^2+(linso2.num1(i)-tactor.C.num)^2)
                linso2.letd(i)=linso2.let1(i)-mean([tactor.A.let tactor.C.let]); linso2.numd(i)=linso2.num1(i)-mean([tactor.A.num tactor.C.num]);   
                elseif inx==1
                    linso2.letd(i)=linso2.let1(i)-tactor.A.let; linso2.numd(i)=linso2.num1(i)-tactor.A.num;
                else
                    linso2.letd(i)=linso2.let1(i)-tactor.C.let; linso2.numd(i)=linso2.num1(i)-tactor.C.num;
                end
        end
        
    elseif linso2.pat(i)==3 && linso2.rp(i)==1
        if linso2.rt(i)<=1.75
            switch linso2.tac(i,1)
                case 'A'
                    linso2.letd(i)=linso2.let1(i)-tactor.A.let; linso2.numd(i)=linso2.num1(i)-tactor.A.num;
                case 'B'
                    linso2.letd(i)=linso2.let1(i)-tactor.B.let; linso2.numd(i)=linso2.num1(i)-tactor.B.num;
                case 'C'
                    linso2.letd(i)=linso2.let1(i)-tactor.C.let; linso2.numd(i)=linso2.num1(i)-tactor.C.num;
                case 'D'
                    linso2.letd(i)=linso2.let1(i)-tactor.D.let; linso2.numd(i)=linso2.num1(i)-tactor.D.num;
            end
        else
            switch linso2.tac(i,3)
                case 'A'
                    linso2.letd(i)=linso2.let1(i)-tactor.A.let; linso2.numd(i)=linso2.num1(i)-tactor.A.num;
                case 'B'
                    linso2.letd(i)=linso2.let1(i)-tactor.B.let; linso2.numd(i)=linso2.num1(i)-tactor.B.num;
                case 'C'
                    linso2.letd(i)=linso2.let1(i)-tactor.C.let; linso2.numd(i)=linso2.num1(i)-tactor.C.num;
                case 'D'
                    linso2.letd(i)=linso2.let1(i)-tactor.D.let; linso2.numd(i)=linso2.num1(i)-tactor.D.num;
            end
        end
        linso2.le(i)=sqrt(linso2.letd(i)^2+linso2.numd(i)^2);
 
    elseif (linso2.pat(i)==2 || linso2.pat(i)==3) && (linso2.rp(i)==2 || linso2.rp(i)==3)
        switch linso2.tac(i,1)*linso2.tac(i,3)
            case 4488
                [linso2.le(i),inx]=min([sqrt((linso2.let1(i)-tactor.B.let)^2+(linso2.num1(i)-tactor.B.num)^2)+sqrt((linso2.let2(i)-tactor.D.let)^2+(linso2.num2(i)-tactor.D.num)^2),sqrt((linso2.let1(i)-tactor.D.let)^2+(linso2.num1(i)-tactor.D.num)^2)+sqrt((linso2.let2(i)-tactor.B.let)^2+(linso2.num2(i)-tactor.B.num)^2)]);
                linso2.le(i)=0.5*linso2.le(i);
                if inx==1
                    linso2.letd(i)=mean([linso2.let1(i)-tactor.B.let,linso2.let2(i)-tactor.D.let]); linso2.numd(i)=mean([linso2.num1(i)-tactor.B.num,linso2.num2(i)-tactor.D.num]);
                else
                    linso2.letd(i)=mean([linso2.let1(i)-tactor.D.let,linso2.let2(i)-tactor.B.let]); linso2.numd(i)=mean([linso2.num1(i)-tactor.D.num,linso2.num2(i)-tactor.B.num]);
                end
            case 4420
                [linso2.le(i),inx]=min([sqrt((linso2.let1(i)-tactor.A.let)^2+(linso2.num1(i)-tactor.A.num)^2)+sqrt((linso2.let2(i)-tactor.D.let)^2+(linso2.num2(i)-tactor.D.num)^2),sqrt((linso2.let1(i)-tactor.D.let)^2+(linso2.num1(i)-tactor.D.num)^2)+sqrt((linso2.let2(i)-tactor.A.let)^2+(linso2.num2(i)-tactor.A.num)^2)]);
                linso2.le(i)=0.5*linso2.le(i);
                if inx==1
                    linso2.letd(i)=mean([linso2.let1(i)-tactor.A.let,linso2.let2(i)-tactor.D.let]); linso2.numd(i)=mean([linso2.num1(i)-tactor.A.num,linso2.num2(i)-tactor.D.num]);
                else
                    linso2.letd(i)=mean([linso2.let1(i)-tactor.D.let,linso2.let2(i)-tactor.A.let]); linso2.numd(i)=mean([linso2.num1(i)-tactor.D.num,linso2.num2(i)-tactor.A.num]);
                end
            case 4290
                [linso2.le(i),inx]=min([sqrt((linso2.let1(i)-tactor.A.let)^2+(linso2.num1(i)-tactor.A.num)^2)+sqrt((linso2.let2(i)-tactor.B.let)^2+(linso2.num2(i)-tactor.B.num)^2),sqrt((linso2.let1(i)-tactor.B.let)^2+(linso2.num1(i)-tactor.B.num)^2)+sqrt((linso2.let2(i)-tactor.A.let)^2+(linso2.num2(i)-tactor.A.num)^2)]);
                linso2.le(i)=0.5*linso2.le(i);
                if inx==1
                    linso2.letd(i)=mean([linso2.let1(i)-tactor.A.let,linso2.let2(i)-tactor.B.let]); linso2.numd(i)=mean([linso2.num1(i)-tactor.A.num,linso2.num2(i)-tactor.B.num]);
                else
                    linso2.letd(i)=mean([linso2.let1(i)-tactor.B.let,linso2.let2(i)-tactor.A.let]); linso2.numd(i)=mean([linso2.num1(i)-tactor.B.num,linso2.num2(i)-tactor.A.num]);
                end
            case 4422
                [linso2.le(i),inx]=min([sqrt((linso2.let1(i)-tactor.B.let)^2+(linso2.num1(i)-tactor.B.num)^2)+sqrt((linso2.let2(i)-tactor.C.let)^2+(linso2.num2(i)-tactor.C.num)^2),sqrt((linso2.let1(i)-tactor.C.let)^2+(linso2.num1(i)-tactor.C.num)^2)+sqrt((linso2.let2(i)-tactor.B.let)^2+(linso2.num2(i)-tactor.B.num)^2)]);
                linso2.le(i)=0.5*linso2.le(i);
                if inx==1
                    linso2.letd(i)=mean([linso2.let1(i)-tactor.B.let,linso2.let2(i)-tactor.C.let]); linso2.numd(i)=mean([linso2.num1(i)-tactor.B.num,linso2.num2(i)-tactor.C.num]);
                else
                    linso2.letd(i)=mean([linso2.let1(i)-tactor.C.let,linso2.let2(i)-tactor.B.let]); linso2.numd(i)=mean([linso2.num1(i)-tactor.C.num,linso2.num2(i)-tactor.B.num]);
                end
            case 4355
                [linso2.le(i),inx]=min([sqrt((linso2.let1(i)-tactor.A.let)^2+(linso2.num1(i)-tactor.A.num)^2)+sqrt((linso2.let2(i)-tactor.C.let)^2+(linso2.num2(i)-tactor.C.num)^2),sqrt((linso2.let1(i)-tactor.C.let)^2+(linso2.num1(i)-tactor.C.num)^2)+sqrt((linso2.let2(i)-tactor.A.let)^2+(linso2.num2(i)-tactor.A.num)^2)]);
                linso2.le(i)=0.5*linso2.le(i);
                if inx==1
                    linso2.letd(i)=mean([linso2.let1(i)-tactor.A.let,linso2.let2(i)-tactor.C.let]); linso2.numd(i)=mean([linso2.num1(i)-tactor.A.num,linso2.num2(i)-tactor.C.num]);
                else
                    linso2.letd(i)=mean([linso2.let1(i)-tactor.C.let,linso2.let2(i)-tactor.A.let]); linso2.numd(i)=mean([linso2.num1(i)-tactor.C.num,linso2.num2(i)-tactor.A.num]);
                end
        end
    else
        linso2.le(i)=NaN; linso2.letd(i)=NaN; linso2.numd(i)=NaN;
    end
    
    if outso4.pat(i)==1 && outso4.rp(i)==1
        switch outso4.tac(i,1)
            case 'A'
                outso4.letd(i)=outso4.let1(i)-tactor.A.let; outso4.numd(i)=outso4.num1(i)-tactor.A.num;
            case 'B'
                outso4.letd(i)=outso4.let1(i)-tactor.B.let; outso4.numd(i)=outso4.num1(i)-tactor.B.num;
            case 'C'
                outso4.letd(i)=outso4.let1(i)-tactor.C.let; outso4.numd(i)=outso4.num1(i)-tactor.C.num;
            case 'D'
                outso4.letd(i)=outso4.let1(i)-tactor.D.let; outso4.numd(i)=outso4.num1(i)-tactor.D.num;
        end
        outso4.le(i)=sqrt(outso4.letd(i)^2+outso4.numd(i)^2);
        
    elseif outso4.pat(i)==1 && (outso4.rp(i)==2 || outso4.rp(i)==3)
        switch outso4.tac(i,1)
            case 'A'
                outso4.letd(i)=mean([outso4.let1(i) outso4.let2(i)])-tactor.A.let; outso4.numd(i)=mean([outso4.num1(i) outso4.num2(i)])-tactor.A.num;
                outso4.le(i)=mean([sqrt((outso4.let1(i)-tactor.A.let)^2+(outso4.num1(i)-tactor.A.num)^2),sqrt((outso4.let2(i)-tactor.A.let)^2+(outso4.num2(i)-tactor.A.num)^2)]);
            case 'B'
                outso4.letd(i)=mean([outso4.let1(i) outso4.let2(i)])-tactor.B.let; outso4.numd(i)=mean([outso4.num1(i) outso4.num2(i)])-tactor.B.num;
                outso4.le(i)=mean([sqrt((outso4.let1(i)-tactor.B.let)^2+(outso4.num1(i)-tactor.B.num)^2),sqrt((outso4.let2(i)-tactor.B.let)^2+(outso4.num2(i)-tactor.B.num)^2)]);
            case 'C'
                outso4.letd(i)=mean([outso4.let1(i) outso4.let2(i)])-tactor.C.let; outso4.numd(i)=mean([outso4.num1(i) outso4.num2(i)])-tactor.C.num;
                outso4.le(i)=mean([sqrt((outso4.let1(i)-tactor.C.let)^2+(outso4.num1(i)-tactor.C.num)^2),sqrt((outso4.let2(i)-tactor.C.let)^2+(outso4.num2(i)-tactor.C.num)^2)]);
            case 'D'
                outso4.letd(i)=mean([outso4.let1(i) outso4.let2(i)])-tactor.D.let; outso4.numd(i)=mean([outso4.num1(i) outso4.num2(i)])-tactor.D.num;
                outso4.le(i)=mean([sqrt((outso4.let1(i)-tactor.D.let)^2+(outso4.num1(i)-tactor.D.num)^2),sqrt((outso4.let2(i)-tactor.D.let)^2+(outso4.num2(i)-tactor.D.num)^2)]);
        end
        
    elseif outso4.pat(i)==2 && outso4.rp(i)==1
        switch outso4.tac(i,1)*outso4.tac(i,3)
            case 4488
                [outso4.le(i),inx]=min([sqrt((outso4.let1(i)-tactor.B.let)^2+(outso4.num1(i)-tactor.B.num)^2),sqrt((outso4.let1(i)-tactor.D.let)^2+(outso4.num1(i)-tactor.D.num)^2)]);
                if sqrt((outso4.let1(i)-tactor.B.let)^2+(outso4.num1(i)-tactor.B.num)^2)==sqrt((outso4.let1(i)-tactor.D.let)^2+(outso4.num1(i)-tactor.D.num)^2)
                outso4.letd(i)=outso4.let1(i)-mean([tactor.B.let tactor.D.let]); outso4.numd(i)=outso4.num1(i)-mean([tactor.B.num tactor.D.num]);   
                elseif inx==1
                    outso4.letd(i)=outso4.let1(i)-tactor.B.let; outso4.numd(i)=outso4.num1(i)-tactor.B.num;
                else
                    outso4.letd(i)=outso4.let1(i)-tactor.D.let; outso4.numd(i)=outso4.num1(i)-tactor.D.num;
                end
            case 4420
                [outso4.le(i),inx]=min([sqrt((outso4.let1(i)-tactor.A.let)^2+(outso4.num1(i)-tactor.A.num)^2),sqrt((outso4.let1(i)-tactor.D.let)^2+(outso4.num1(i)-tactor.D.num)^2)]);
                if sqrt((outso4.let1(i)-tactor.A.let)^2+(outso4.num1(i)-tactor.A.num)^2)==sqrt((outso4.let1(i)-tactor.D.let)^2+(outso4.num1(i)-tactor.D.num)^2)
                outso4.letd(i)=outso4.let1(i)-mean([tactor.A.let tactor.D.let]); outso4.numd(i)=outso4.num1(i)-mean([tactor.A.num tactor.D.num]);   
                elseif inx==1
                    outso4.letd(i)=outso4.let1(i)-tactor.A.let; outso4.numd(i)=outso4.num1(i)-tactor.A.num;
                else
                    outso4.letd(i)=outso4.let1(i)-tactor.D.let; outso4.numd(i)=outso4.num1(i)-tactor.D.num;
                end
            case 4290
                [outso4.le(i),inx]=min([sqrt((outso4.let1(i)-tactor.A.let)^2+(outso4.num1(i)-tactor.A.num)^2),sqrt((outso4.let1(i)-tactor.B.let)^2+(outso4.num1(i)-tactor.B.num)^2)]);
                if sqrt((outso4.let1(i)-tactor.A.let)^2+(outso4.num1(i)-tactor.A.num)^2)==sqrt((outso4.let1(i)-tactor.B.let)^2+(outso4.num1(i)-tactor.B.num)^2)
                outso4.letd(i)=outso4.let1(i)-mean([tactor.A.let tactor.B.let]); outso4.numd(i)=outso4.num1(i)-mean([tactor.A.num tactor.B.num]);   
                elseif inx==1
                    outso4.letd(i)=outso4.let1(i)-tactor.A.let; outso4.numd(i)=outso4.num1(i)-tactor.A.num;
                else
                    outso4.letd(i)=outso4.let1(i)-tactor.B.let; outso4.numd(i)=outso4.num1(i)-tactor.B.num;
                end
            case 4422
                [outso4.le(i),inx]=min([sqrt((outso4.let1(i)-tactor.B.let)^2+(outso4.num1(i)-tactor.B.num)^2),sqrt((outso4.let1(i)-tactor.C.let)^2+(outso4.num1(i)-tactor.C.num)^2)]);
                if sqrt((outso4.let1(i)-tactor.B.let)^2+(outso4.num1(i)-tactor.B.num)^2)==sqrt((outso4.let1(i)-tactor.C.let)^2+(outso4.num1(i)-tactor.C.num)^2)
                outso4.letd(i)=outso4.let1(i)-mean([tactor.B.let tactor.C.let]); outso4.numd(i)=outso4.num1(i)-mean([tactor.B.num tactor.C.num]);   
                elseif inx==1
                    outso4.letd(i)=outso4.let1(i)-tactor.B.let; outso4.numd(i)=outso4.num1(i)-tactor.B.num;
                else
                    outso4.letd(i)=outso4.let1(i)-tactor.C.let; outso4.numd(i)=outso4.num1(i)-tactor.C.num;
                end
            case 4355
                [outso4.le(i),inx]=min([sqrt((outso4.let1(i)-tactor.A.let)^2+(outso4.num1(i)-tactor.A.num)^2),sqrt((outso4.let1(i)-tactor.C.let)^2+(outso4.num1(i)-tactor.C.num)^2)]);
                if sqrt((outso4.let1(i)-tactor.A.let)^2+(outso4.num1(i)-tactor.A.num)^2)==sqrt((outso4.let1(i)-tactor.C.let)^2+(outso4.num1(i)-tactor.C.num)^2)
                outso4.letd(i)=outso4.let1(i)-mean([tactor.A.let tactor.C.let]); outso4.numd(i)=outso4.num1(i)-mean([tactor.A.num tactor.C.num]);   
                elseif inx==1
                    outso4.letd(i)=outso4.let1(i)-tactor.A.let; outso4.numd(i)=outso4.num1(i)-tactor.A.num;
                else
                    outso4.letd(i)=outso4.let1(i)-tactor.C.let; outso4.numd(i)=outso4.num1(i)-tactor.C.num;
                end
        end
        
    elseif outso4.pat(i)==3 && outso4.rp(i)==1
        if outso4.rt(i)<=1.75
            switch outso4.tac(i,1)
                case 'A'
                    outso4.letd(i)=outso4.let1(i)-tactor.A.let; outso4.numd(i)=outso4.num1(i)-tactor.A.num;
                case 'B'
                    outso4.letd(i)=outso4.let1(i)-tactor.B.let; outso4.numd(i)=outso4.num1(i)-tactor.B.num;
                case 'C'
                    outso4.letd(i)=outso4.let1(i)-tactor.C.let; outso4.numd(i)=outso4.num1(i)-tactor.C.num;
                case 'D'
                    outso4.letd(i)=outso4.let1(i)-tactor.D.let; outso4.numd(i)=outso4.num1(i)-tactor.D.num;
            end
        else
            switch outso4.tac(i,3)
                case 'A'
                    outso4.letd(i)=outso4.let1(i)-tactor.A.let; outso4.numd(i)=outso4.num1(i)-tactor.A.num;
                case 'B'
                    outso4.letd(i)=outso4.let1(i)-tactor.B.let; outso4.numd(i)=outso4.num1(i)-tactor.B.num;
                case 'C'
                    outso4.letd(i)=outso4.let1(i)-tactor.C.let; outso4.numd(i)=outso4.num1(i)-tactor.C.num;
                case 'D'
                    outso4.letd(i)=outso4.let1(i)-tactor.D.let; outso4.numd(i)=outso4.num1(i)-tactor.D.num;
            end
        end
        outso4.le(i)=sqrt(outso4.letd(i)^2+outso4.numd(i)^2);
 
    elseif (outso4.pat(i)==2 || outso4.pat(i)==3) && (outso4.rp(i)==2 || outso4.rp(i)==3)
        switch outso4.tac(i,1)*outso4.tac(i,3)
            case 4488
                [outso4.le(i),inx]=min([sqrt((outso4.let1(i)-tactor.B.let)^2+(outso4.num1(i)-tactor.B.num)^2)+sqrt((outso4.let2(i)-tactor.D.let)^2+(outso4.num2(i)-tactor.D.num)^2),sqrt((outso4.let1(i)-tactor.D.let)^2+(outso4.num1(i)-tactor.D.num)^2)+sqrt((outso4.let2(i)-tactor.B.let)^2+(outso4.num2(i)-tactor.B.num)^2)]);
                outso4.le(i)=0.5*outso4.le(i);
                if inx==1
                    outso4.letd(i)=mean([outso4.let1(i)-tactor.B.let,outso4.let2(i)-tactor.D.let]); outso4.numd(i)=mean([outso4.num1(i)-tactor.B.num,outso4.num2(i)-tactor.D.num]);
                else
                    outso4.letd(i)=mean([outso4.let1(i)-tactor.D.let,outso4.let2(i)-tactor.B.let]); outso4.numd(i)=mean([outso4.num1(i)-tactor.D.num,outso4.num2(i)-tactor.B.num]);
                end
            case 4420
                [outso4.le(i),inx]=min([sqrt((outso4.let1(i)-tactor.A.let)^2+(outso4.num1(i)-tactor.A.num)^2)+sqrt((outso4.let2(i)-tactor.D.let)^2+(outso4.num2(i)-tactor.D.num)^2),sqrt((outso4.let1(i)-tactor.D.let)^2+(outso4.num1(i)-tactor.D.num)^2)+sqrt((outso4.let2(i)-tactor.A.let)^2+(outso4.num2(i)-tactor.A.num)^2)]);
                outso4.le(i)=0.5*outso4.le(i);
                if inx==1
                    outso4.letd(i)=mean([outso4.let1(i)-tactor.A.let,outso4.let2(i)-tactor.D.let]); outso4.numd(i)=mean([outso4.num1(i)-tactor.A.num,outso4.num2(i)-tactor.D.num]);
                else
                    outso4.letd(i)=mean([outso4.let1(i)-tactor.D.let,outso4.let2(i)-tactor.A.let]); outso4.numd(i)=mean([outso4.num1(i)-tactor.D.num,outso4.num2(i)-tactor.A.num]);
                end
            case 4290
                [outso4.le(i),inx]=min([sqrt((outso4.let1(i)-tactor.A.let)^2+(outso4.num1(i)-tactor.A.num)^2)+sqrt((outso4.let2(i)-tactor.B.let)^2+(outso4.num2(i)-tactor.B.num)^2),sqrt((outso4.let1(i)-tactor.B.let)^2+(outso4.num1(i)-tactor.B.num)^2)+sqrt((outso4.let2(i)-tactor.A.let)^2+(outso4.num2(i)-tactor.A.num)^2)]);
                outso4.le(i)=0.5*outso4.le(i);
                if inx==1
                    outso4.letd(i)=mean([outso4.let1(i)-tactor.A.let,outso4.let2(i)-tactor.B.let]); outso4.numd(i)=mean([outso4.num1(i)-tactor.A.num,outso4.num2(i)-tactor.B.num]);
                else
                    outso4.letd(i)=mean([outso4.let1(i)-tactor.B.let,outso4.let2(i)-tactor.A.let]); outso4.numd(i)=mean([outso4.num1(i)-tactor.B.num,outso4.num2(i)-tactor.A.num]);
                end
            case 4422
                [outso4.le(i),inx]=min([sqrt((outso4.let1(i)-tactor.B.let)^2+(outso4.num1(i)-tactor.B.num)^2)+sqrt((outso4.let2(i)-tactor.C.let)^2+(outso4.num2(i)-tactor.C.num)^2),sqrt((outso4.let1(i)-tactor.C.let)^2+(outso4.num1(i)-tactor.C.num)^2)+sqrt((outso4.let2(i)-tactor.B.let)^2+(outso4.num2(i)-tactor.B.num)^2)]);
                outso4.le(i)=0.5*outso4.le(i);
                if inx==1
                    outso4.letd(i)=mean([outso4.let1(i)-tactor.B.let,outso4.let2(i)-tactor.C.let]); outso4.numd(i)=mean([outso4.num1(i)-tactor.B.num,outso4.num2(i)-tactor.C.num]);
                else
                    outso4.letd(i)=mean([outso4.let1(i)-tactor.C.let,outso4.let2(i)-tactor.B.let]); outso4.numd(i)=mean([outso4.num1(i)-tactor.C.num,outso4.num2(i)-tactor.B.num]);
                end
            case 4355
                [outso4.le(i),inx]=min([sqrt((outso4.let1(i)-tactor.A.let)^2+(outso4.num1(i)-tactor.A.num)^2)+sqrt((outso4.let2(i)-tactor.C.let)^2+(outso4.num2(i)-tactor.C.num)^2),sqrt((outso4.let1(i)-tactor.C.let)^2+(outso4.num1(i)-tactor.C.num)^2)+sqrt((outso4.let2(i)-tactor.A.let)^2+(outso4.num2(i)-tactor.A.num)^2)]);
                outso4.le(i)=0.5*outso4.le(i);
                if inx==1
                    outso4.letd(i)=mean([outso4.let1(i)-tactor.A.let,outso4.let2(i)-tactor.C.let]); outso4.numd(i)=mean([outso4.num1(i)-tactor.A.num,outso4.num2(i)-tactor.C.num]);
                else
                    outso4.letd(i)=mean([outso4.let1(i)-tactor.C.let,outso4.let2(i)-tactor.A.let]); outso4.numd(i)=mean([outso4.num1(i)-tactor.C.num,outso4.num2(i)-tactor.A.num]);
                end
        end
    else
        outso4.le(i)=NaN; outso4.letd(i)=NaN; outso4.numd(i)=NaN;
    end

    if outso2.pat(i)==1 && outso2.rp(i)==1
        switch outso2.tac(i,1)
            case 'A'
                outso2.letd(i)=outso2.let1(i)-tactor.A.let; outso2.numd(i)=outso2.num1(i)-tactor.A.num;
            case 'B'
                outso2.letd(i)=outso2.let1(i)-tactor.B.let; outso2.numd(i)=outso2.num1(i)-tactor.B.num;
            case 'C'
                outso2.letd(i)=outso2.let1(i)-tactor.C.let; outso2.numd(i)=outso2.num1(i)-tactor.C.num;
            case 'D'
                outso2.letd(i)=outso2.let1(i)-tactor.D.let; outso2.numd(i)=outso2.num1(i)-tactor.D.num;
        end
        outso2.le(i)=sqrt(outso2.letd(i)^2+outso2.numd(i)^2);
        
    elseif outso2.pat(i)==1 && (outso2.rp(i)==2 || outso2.rp(i)==3)
        switch outso2.tac(i,1)
            case 'A'
                outso2.letd(i)=mean([outso2.let1(i) outso2.let2(i)])-tactor.A.let; outso2.numd(i)=mean([outso2.num1(i) outso2.num2(i)])-tactor.A.num;
                outso2.le(i)=mean([sqrt((outso2.let1(i)-tactor.A.let)^2+(outso2.num1(i)-tactor.A.num)^2),sqrt((outso2.let2(i)-tactor.A.let)^2+(outso2.num2(i)-tactor.A.num)^2)]);
            case 'B'
                outso2.letd(i)=mean([outso2.let1(i) outso2.let2(i)])-tactor.B.let; outso2.numd(i)=mean([outso2.num1(i) outso2.num2(i)])-tactor.B.num;
                outso2.le(i)=mean([sqrt((outso2.let1(i)-tactor.B.let)^2+(outso2.num1(i)-tactor.B.num)^2),sqrt((outso2.let2(i)-tactor.B.let)^2+(outso2.num2(i)-tactor.B.num)^2)]);
            case 'C'
                outso2.letd(i)=mean([outso2.let1(i) outso2.let2(i)])-tactor.C.let; outso2.numd(i)=mean([outso2.num1(i) outso2.num2(i)])-tactor.C.num;
                outso2.le(i)=mean([sqrt((outso2.let1(i)-tactor.C.let)^2+(outso2.num1(i)-tactor.C.num)^2),sqrt((outso2.let2(i)-tactor.C.let)^2+(outso2.num2(i)-tactor.C.num)^2)]);
            case 'D'
                outso2.letd(i)=mean([outso2.let1(i) outso2.let2(i)])-tactor.D.let; outso2.numd(i)=mean([outso2.num1(i) outso2.num2(i)])-tactor.D.num;
                outso2.le(i)=mean([sqrt((outso2.let1(i)-tactor.D.let)^2+(outso2.num1(i)-tactor.D.num)^2),sqrt((outso2.let2(i)-tactor.D.let)^2+(outso2.num2(i)-tactor.D.num)^2)]);
        end
        
    elseif outso2.pat(i)==2 && outso2.rp(i)==1
        switch outso2.tac(i,1)*outso2.tac(i,3)
            case 4488
                [outso2.le(i),inx]=min([sqrt((outso2.let1(i)-tactor.B.let)^2+(outso2.num1(i)-tactor.B.num)^2),sqrt((outso2.let1(i)-tactor.D.let)^2+(outso2.num1(i)-tactor.D.num)^2)]);
                if sqrt((outso2.let1(i)-tactor.B.let)^2+(outso2.num1(i)-tactor.B.num)^2)==sqrt((outso2.let1(i)-tactor.D.let)^2+(outso2.num1(i)-tactor.D.num)^2)
                outso2.letd(i)=outso2.let1(i)-mean([tactor.B.let tactor.D.let]); outso2.numd(i)=outso2.num1(i)-mean([tactor.B.num tactor.D.num]);   
                elseif inx==1
                    outso2.letd(i)=outso2.let1(i)-tactor.B.let; outso2.numd(i)=outso2.num1(i)-tactor.B.num;
                else
                    outso2.letd(i)=outso2.let1(i)-tactor.D.let; outso2.numd(i)=outso2.num1(i)-tactor.D.num;
                end
            case 4420
                [outso2.le(i),inx]=min([sqrt((outso2.let1(i)-tactor.A.let)^2+(outso2.num1(i)-tactor.A.num)^2),sqrt((outso2.let1(i)-tactor.D.let)^2+(outso2.num1(i)-tactor.D.num)^2)]);
                if sqrt((outso2.let1(i)-tactor.A.let)^2+(outso2.num1(i)-tactor.A.num)^2)==sqrt((outso2.let1(i)-tactor.D.let)^2+(outso2.num1(i)-tactor.D.num)^2)
                outso2.letd(i)=outso2.let1(i)-mean([tactor.A.let tactor.D.let]); outso2.numd(i)=outso2.num1(i)-mean([tactor.A.num tactor.D.num]);   
                elseif inx==1
                    outso2.letd(i)=outso2.let1(i)-tactor.A.let; outso2.numd(i)=outso2.num1(i)-tactor.A.num;
                else
                    outso2.letd(i)=outso2.let1(i)-tactor.D.let; outso2.numd(i)=outso2.num1(i)-tactor.D.num;
                end
            case 4290
                [outso2.le(i),inx]=min([sqrt((outso2.let1(i)-tactor.A.let)^2+(outso2.num1(i)-tactor.A.num)^2),sqrt((outso2.let1(i)-tactor.B.let)^2+(outso2.num1(i)-tactor.B.num)^2)]);
                if sqrt((outso2.let1(i)-tactor.A.let)^2+(outso2.num1(i)-tactor.A.num)^2)==sqrt((outso2.let1(i)-tactor.B.let)^2+(outso2.num1(i)-tactor.B.num)^2)
                outso2.letd(i)=outso2.let1(i)-mean([tactor.A.let tactor.B.let]); outso2.numd(i)=outso2.num1(i)-mean([tactor.A.num tactor.B.num]);   
                elseif inx==1
                    outso2.letd(i)=outso2.let1(i)-tactor.A.let; outso2.numd(i)=outso2.num1(i)-tactor.A.num;
                else
                    outso2.letd(i)=outso2.let1(i)-tactor.B.let; outso2.numd(i)=outso2.num1(i)-tactor.B.num;
                end
            case 4422
                [outso2.le(i),inx]=min([sqrt((outso2.let1(i)-tactor.B.let)^2+(outso2.num1(i)-tactor.B.num)^2),sqrt((outso2.let1(i)-tactor.C.let)^2+(outso2.num1(i)-tactor.C.num)^2)]);
                if sqrt((outso2.let1(i)-tactor.B.let)^2+(outso2.num1(i)-tactor.B.num)^2)==sqrt((outso2.let1(i)-tactor.C.let)^2+(outso2.num1(i)-tactor.C.num)^2)
                outso2.letd(i)=outso2.let1(i)-mean([tactor.B.let tactor.C.let]); outso2.numd(i)=outso2.num1(i)-mean([tactor.B.num tactor.C.num]);   
                elseif inx==1
                    outso2.letd(i)=outso2.let1(i)-tactor.B.let; outso2.numd(i)=outso2.num1(i)-tactor.B.num;
                else
                    outso2.letd(i)=outso2.let1(i)-tactor.C.let; outso2.numd(i)=outso2.num1(i)-tactor.C.num;
                end
            case 4355
                [outso2.le(i),inx]=min([sqrt((outso2.let1(i)-tactor.A.let)^2+(outso2.num1(i)-tactor.A.num)^2),sqrt((outso2.let1(i)-tactor.C.let)^2+(outso2.num1(i)-tactor.C.num)^2)]);
                if sqrt((outso2.let1(i)-tactor.A.let)^2+(outso2.num1(i)-tactor.A.num)^2)==sqrt((outso2.let1(i)-tactor.C.let)^2+(outso2.num1(i)-tactor.C.num)^2)
                outso2.letd(i)=outso2.let1(i)-mean([tactor.A.let tactor.C.let]); outso2.numd(i)=outso2.num1(i)-mean([tactor.A.num tactor.C.num]);   
                elseif inx==1
                    outso2.letd(i)=outso2.let1(i)-tactor.A.let; outso2.numd(i)=outso2.num1(i)-tactor.A.num;
                else
                    outso2.letd(i)=outso2.let1(i)-tactor.C.let; outso2.numd(i)=outso2.num1(i)-tactor.C.num;
                end
        end
        
    elseif outso2.pat(i)==3 && outso2.rp(i)==1
        if outso2.rt(i)<=1.75
            switch outso2.tac(i,1)
                case 'A'
                    outso2.letd(i)=outso2.let1(i)-tactor.A.let; outso2.numd(i)=outso2.num1(i)-tactor.A.num;
                case 'B'
                    outso2.letd(i)=outso2.let1(i)-tactor.B.let; outso2.numd(i)=outso2.num1(i)-tactor.B.num;
                case 'C'
                    outso2.letd(i)=outso2.let1(i)-tactor.C.let; outso2.numd(i)=outso2.num1(i)-tactor.C.num;
                case 'D'
                    outso2.letd(i)=outso2.let1(i)-tactor.D.let; outso2.numd(i)=outso2.num1(i)-tactor.D.num;
            end
        else
            switch outso2.tac(i,3)
                case 'A'
                    outso2.letd(i)=outso2.let1(i)-tactor.A.let; outso2.numd(i)=outso2.num1(i)-tactor.A.num;
                case 'B'
                    outso2.letd(i)=outso2.let1(i)-tactor.B.let; outso2.numd(i)=outso2.num1(i)-tactor.B.num;
                case 'C'
                    outso2.letd(i)=outso2.let1(i)-tactor.C.let; outso2.numd(i)=outso2.num1(i)-tactor.C.num;
                case 'D'
                    outso2.letd(i)=outso2.let1(i)-tactor.D.let; outso2.numd(i)=outso2.num1(i)-tactor.D.num;
            end
        end
        outso2.le(i)=sqrt(outso2.letd(i)^2+outso2.numd(i)^2);
 
    elseif (outso2.pat(i)==2 || outso2.pat(i)==3) && (outso2.rp(i)==2 || outso2.rp(i)==3)
        switch outso2.tac(i,1)*outso2.tac(i,3)
            case 4488
                [outso2.le(i),inx]=min([sqrt((outso2.let1(i)-tactor.B.let)^2+(outso2.num1(i)-tactor.B.num)^2)+sqrt((outso2.let2(i)-tactor.D.let)^2+(outso2.num2(i)-tactor.D.num)^2),sqrt((outso2.let1(i)-tactor.D.let)^2+(outso2.num1(i)-tactor.D.num)^2)+sqrt((outso2.let2(i)-tactor.B.let)^2+(outso2.num2(i)-tactor.B.num)^2)]);
                outso2.le(i)=0.5*outso2.le(i);
                if inx==1
                    outso2.letd(i)=mean([outso2.let1(i)-tactor.B.let,outso2.let2(i)-tactor.D.let]); outso2.numd(i)=mean([outso2.num1(i)-tactor.B.num,outso2.num2(i)-tactor.D.num]);
                else
                    outso2.letd(i)=mean([outso2.let1(i)-tactor.D.let,outso2.let2(i)-tactor.B.let]); outso2.numd(i)=mean([outso2.num1(i)-tactor.D.num,outso2.num2(i)-tactor.B.num]);
                end
            case 4420
                [outso2.le(i),inx]=min([sqrt((outso2.let1(i)-tactor.A.let)^2+(outso2.num1(i)-tactor.A.num)^2)+sqrt((outso2.let2(i)-tactor.D.let)^2+(outso2.num2(i)-tactor.D.num)^2),sqrt((outso2.let1(i)-tactor.D.let)^2+(outso2.num1(i)-tactor.D.num)^2)+sqrt((outso2.let2(i)-tactor.A.let)^2+(outso2.num2(i)-tactor.A.num)^2)]);
                outso2.le(i)=0.5*outso2.le(i);
                if inx==1
                    outso2.letd(i)=mean([outso2.let1(i)-tactor.A.let,outso2.let2(i)-tactor.D.let]); outso2.numd(i)=mean([outso2.num1(i)-tactor.A.num,outso2.num2(i)-tactor.D.num]);
                else
                    outso2.letd(i)=mean([outso2.let1(i)-tactor.D.let,outso2.let2(i)-tactor.A.let]); outso2.numd(i)=mean([outso2.num1(i)-tactor.D.num,outso2.num2(i)-tactor.A.num]);
                end
            case 4290
                [outso2.le(i),inx]=min([sqrt((outso2.let1(i)-tactor.A.let)^2+(outso2.num1(i)-tactor.A.num)^2)+sqrt((outso2.let2(i)-tactor.B.let)^2+(outso2.num2(i)-tactor.B.num)^2),sqrt((outso2.let1(i)-tactor.B.let)^2+(outso2.num1(i)-tactor.B.num)^2)+sqrt((outso2.let2(i)-tactor.A.let)^2+(outso2.num2(i)-tactor.A.num)^2)]);
                outso2.le(i)=0.5*outso2.le(i);
                if inx==1
                    outso2.letd(i)=mean([outso2.let1(i)-tactor.A.let,outso2.let2(i)-tactor.B.let]); outso2.numd(i)=mean([outso2.num1(i)-tactor.A.num,outso2.num2(i)-tactor.B.num]);
                else
                    outso2.letd(i)=mean([outso2.let1(i)-tactor.B.let,outso2.let2(i)-tactor.A.let]); outso2.numd(i)=mean([outso2.num1(i)-tactor.B.num,outso2.num2(i)-tactor.A.num]);
                end
            case 4422
                [outso2.le(i),inx]=min([sqrt((outso2.let1(i)-tactor.B.let)^2+(outso2.num1(i)-tactor.B.num)^2)+sqrt((outso2.let2(i)-tactor.C.let)^2+(outso2.num2(i)-tactor.C.num)^2),sqrt((outso2.let1(i)-tactor.C.let)^2+(outso2.num1(i)-tactor.C.num)^2)+sqrt((outso2.let2(i)-tactor.B.let)^2+(outso2.num2(i)-tactor.B.num)^2)]);
                outso2.le(i)=0.5*outso2.le(i);
                if inx==1
                    outso2.letd(i)=mean([outso2.let1(i)-tactor.B.let,outso2.let2(i)-tactor.C.let]); outso2.numd(i)=mean([outso2.num1(i)-tactor.B.num,outso2.num2(i)-tactor.C.num]);
                else
                    outso2.letd(i)=mean([outso2.let1(i)-tactor.C.let,outso2.let2(i)-tactor.B.let]); outso2.numd(i)=mean([outso2.num1(i)-tactor.C.num,outso2.num2(i)-tactor.B.num]);
                end
            case 4355
                [outso2.le(i),inx]=min([sqrt((outso2.let1(i)-tactor.A.let)^2+(outso2.num1(i)-tactor.A.num)^2)+sqrt((outso2.let2(i)-tactor.C.let)^2+(outso2.num2(i)-tactor.C.num)^2),sqrt((outso2.let1(i)-tactor.C.let)^2+(outso2.num1(i)-tactor.C.num)^2)+sqrt((outso2.let2(i)-tactor.A.let)^2+(outso2.num2(i)-tactor.A.num)^2)]);
                outso2.le(i)=0.5*outso2.le(i);
                if inx==1
                    outso2.letd(i)=mean([outso2.let1(i)-tactor.A.let,outso2.let2(i)-tactor.C.let]); outso2.numd(i)=mean([outso2.num1(i)-tactor.A.num,outso2.num2(i)-tactor.C.num]);
                else
                    outso2.letd(i)=mean([outso2.let1(i)-tactor.C.let,outso2.let2(i)-tactor.A.let]); outso2.numd(i)=mean([outso2.num1(i)-tactor.C.num,outso2.num2(i)-tactor.A.num]);
                end
        end
    else
        outso2.le(i)=NaN; outso2.letd(i)=NaN; outso2.numd(i)=NaN;
    end
end

% Step 9: Calculate Mean and Standard Deviation of Response Time
% assign response time to NaN for trials with no response
% Calculations for one vibration + two sequential vibrations at each pressure/intensity
% Calculations for two simultaneous vibrations at each pressure/intensity
% Disregard the trials with no response

for i=1:28
    if linsk4.rt(i)==' '
        linsk4.rt(i)=NaN;
    end
    if linsk2.rt(i)==' '
        linsk2.rt(i)=NaN;
    end
    if linso4.rt(i)==' '
        linso4.rt(i)=NaN;
    end
    if linso2.rt(i)==' '
        linso2.rt(i)=NaN;
    end
    if outso4.rt(i)==' '
        outso4.rt(i)=NaN;    
    end
    if outso2.rt(i)==' '
        outso2.rt(i)=NaN;
    end
end

linsk4.rt100x2=linsk4.rt(5:9); linsk4.rt100x2=linsk4.rt100x2(~isnan(linsk4.rt100x2));
linsk4.rt100x2m=mean(linsk4.rt100x2); linsk4.rt100x2s=std(linsk4.rt100x2);
linsk4.rt50x2=linsk4.rt(19:23); linsk4.rt50x2=linsk4.rt50x2(~isnan(linsk4.rt50x2));
linsk4.rt50x2m=mean(linsk4.rt50x2); linsk4.rt50x2s=std(linsk4.rt50x2);
linsk4.rt100=linsk4.rt([1:4 10:14]); linsk4.rt100=linsk4.rt100(~isnan(linsk4.rt100));
linsk4.rt100m=mean(linsk4.rt100); linsk4.rt100s=std(linsk4.rt100);
linsk4.rt50=linsk4.rt([15:18 24:28]); linsk4.rt50=linsk4.rt50(~isnan(linsk4.rt50));
linsk4.rt50m=mean(linsk4.rt50); linsk4.rt50s=std(linsk4.rt50);

linsk2.rt100x2=linsk2.rt(5:9); linsk2.rt100x2=linsk2.rt100x2(~isnan(linsk2.rt100x2));
linsk2.rt100x2m=mean(linsk2.rt100x2); linsk2.rt100x2s=std(linsk2.rt100x2);
linsk2.rt50x2=linsk2.rt(19:23); linsk2.rt50x2=linsk2.rt50x2(~isnan(linsk2.rt50x2));
linsk2.rt50x2m=mean(linsk2.rt50x2); linsk2.rt50x2s=std(linsk2.rt50x2);
linsk2.rt100=linsk2.rt([1:4 10:14]); linsk2.rt100=linsk2.rt100(~isnan(linsk2.rt100));
linsk2.rt100m=mean(linsk2.rt100); linsk2.rt100s=std(linsk2.rt100);
linsk2.rt50=linsk2.rt([15:18 24:28]); linsk2.rt50=linsk2.rt50(~isnan(linsk2.rt50));
linsk2.rt50m=mean(linsk2.rt50); linsk2.rt50s=std(linsk2.rt50);

linso4.rt100x2=linso4.rt(5:9); linso4.rt100x2=linso4.rt100x2(~isnan(linso4.rt100x2));
linso4.rt100x2m=mean(linso4.rt100x2); linso4.rt100x2s=std(linso4.rt100x2);
linso4.rt50x2=linso4.rt(19:23); linso4.rt50x2=linso4.rt50x2(~isnan(linso4.rt50x2));
linso4.rt50x2m=mean(linso4.rt50x2); linso4.rt50x2s=std(linso4.rt50x2);
linso4.rt100=linso4.rt([1:4 10:14]); linso4.rt100=linso4.rt100(~isnan(linso4.rt100));
linso4.rt100m=mean(linso4.rt100); linso4.rt100s=std(linso4.rt100);
linso4.rt50=linso4.rt([15:18 24:28]); linso4.rt50=linso4.rt50(~isnan(linso4.rt50));
linso4.rt50m=mean(linso4.rt50); linso4.rt50s=std(linso4.rt50);

linso2.rt100x2=linso2.rt(5:9); linso2.rt100x2=linso2.rt100x2(~isnan(linso2.rt100x2));
linso2.rt100x2m=mean(linso2.rt100x2); linso2.rt100x2s=std(linso2.rt100x2);
linso2.rt50x2=linso2.rt(19:23); linso2.rt50x2=linso2.rt50x2(~isnan(linso2.rt50x2));
linso2.rt50x2m=mean(linso2.rt50x2); linso2.rt50x2s=std(linso2.rt50x2);
linso2.rt100=linso2.rt([1:4 10:14]); linso2.rt100=linso2.rt100(~isnan(linso2.rt100));
linso2.rt100m=mean(linso2.rt100); linso2.rt100s=std(linso2.rt100);
linso2.rt50=linso2.rt([15:18 24:28]); linso2.rt50=linso2.rt50(~isnan(linso2.rt50));
linso2.rt50m=mean(linso2.rt50); linso2.rt50s=std(linso2.rt50);

outso4.rt100x2=outso4.rt(5:9); outso4.rt100x2=outso4.rt100x2(~isnan(outso4.rt100x2));
outso4.rt100x2m=mean(outso4.rt100x2); outso4.rt100x2s=std(outso4.rt100x2);
outso4.rt50x2=outso4.rt(19:23); outso4.rt50x2=outso4.rt50x2(~isnan(outso4.rt50x2));
outso4.rt50x2m=mean(outso4.rt50x2); outso4.rt50x2s=std(outso4.rt50x2);
outso4.rt100=outso4.rt([1:4 10:14]); outso4.rt100=outso4.rt100(~isnan(outso4.rt100));
outso4.rt100m=mean(outso4.rt100); outso4.rt100s=std(outso4.rt100);
outso4.rt50=outso4.rt([15:18 24:28]); outso4.rt50=outso4.rt50(~isnan(outso4.rt50));
outso4.rt50m=mean(outso4.rt50); outso4.rt50s=std(outso4.rt50);

outso2.rt100x2=outso2.rt(5:9); outso2.rt100x2=outso2.rt100x2(~isnan(outso2.rt100x2));
outso2.rt100x2m=mean(outso2.rt100x2); outso2.rt100x2s=std(outso2.rt100x2);
outso2.rt50x2=outso2.rt(19:23); outso2.rt50x2=outso2.rt50x2(~isnan(outso2.rt50x2));
outso2.rt50x2m=mean(outso2.rt50x2); outso2.rt50x2s=std(outso2.rt50x2);
outso2.rt100=outso2.rt([1:4 10:14]); outso2.rt100=outso2.rt100(~isnan(outso2.rt100));
outso2.rt100m=mean(outso2.rt100); outso2.rt100s=std(outso2.rt100);
outso2.rt50=outso2.rt([15:18 24:28]); outso2.rt50=outso2.rt50(~isnan(outso2.rt50));
outso2.rt50m=mean(outso2.rt50); outso2.rt50s=std(outso2.rt50);

% Step 10: Calculate Mean of Response Accuracy
% Trials with one vibration at each pressure/intensity

linsk4.ra100=linsk4.ra(1:14); linsk4.ra100m=mean(linsk4.ra100);
linsk4.ra50=linsk4.ra(15:28); linsk4.ra50m=mean(linsk4.ra50);
 
linsk2.ra100=linsk2.ra(1:14); linsk2.ra100m=mean(linsk2.ra100);
linsk2.ra50=linsk2.ra(15:28); linsk2.ra50m=mean(linsk2.ra50);
 
linso4.ra100=linso4.ra(1:14); linso4.ra100m=mean(linso4.ra100);
linso4.ra50=linso4.ra(15:28); linso4.ra50m=mean(linso4.ra50);

linso2.ra100=linso2.ra(1:14); linso2.ra100m=mean(linso2.ra100);
linso2.ra50=linso2.ra(15:28); linso2.ra50m=mean(linso2.ra50);
 
outso4.ra100=outso4.ra(1:14); outso4.ra100m=mean(outso4.ra100);
outso4.ra50=outso4.ra(15:28); outso4.ra50m=mean(outso4.ra50);
 
outso2.ra100=outso2.ra(1:14); outso2.ra100m=mean(outso2.ra100);
outso2.ra50=outso2.ra(15:28); outso2.ra50m=mean(outso2.ra50);

% Step 11: Splits of trials with incorrect response
% Total trials, trials with correct/incorrect response
% Combinations of actual vibratory pattern-perceived vibratory pattern:
% A) one - two simultaneous; B) one - two sequential;
% C) two simultaneous - one; D) two simultaneous - two sequential;
% E) two sequential - one; F) two sequential - two simultaneous
% Also count the number of missed responses
% One vibration + two sequential vibrations at each layer/pressure/intensity

linsk4.errA=0; linsk4.errB=0; linsk4.errC=0; linsk4.errD=0; linsk4.errE=0; linsk4.errF=0;
linsk2.errA=0; linsk2.errB=0; linsk2.errC=0; linsk2.errD=0; linsk2.errE=0; linsk2.errF=0;
linso4.errA=0; linso4.errB=0; linso4.errC=0; linso4.errD=0; linso4.errE=0; linso4.errF=0;
linso2.errA=0; linso2.errB=0; linso2.errC=0; linso2.errD=0; linso2.errE=0; linso2.errF=0;
outso4.errA=0; outso4.errB=0; outso4.errC=0; outso4.errD=0; outso4.errE=0; outso4.errF=0;
outso2.errA=0; outso2.errB=0; outso2.errC=0; outso2.errD=0; outso2.errE=0; outso2.errF=0;

for i=1:28
switch linsk4.pat(i)^2+linsk4.rp(i)
    case 3
        linsk4.errA=linsk4.errA+1;
    case 4
        linsk4.errB=linsk4.errB+1;
    case 5
        linsk4.errC=linsk4.errC+1;
    case 7
        linsk4.errD=linsk4.errD+1;
    case 10
        linsk4.errE=linsk4.errE+1;
    case 11
        linsk4.errF=linsk4.errF+1;
end
switch linsk2.pat(i)^2+linsk2.rp(i)
    case 3
        linsk2.errA=linsk2.errA+1;
    case 4
        linsk2.errB=linsk2.errB+1;
    case 5
        linsk2.errC=linsk2.errC+1;
    case 7
        linsk2.errD=linsk2.errD+1;
    case 10
        linsk2.errE=linsk2.errE+1;
    case 11
        linsk2.errF=linsk2.errF+1;
end
switch linso4.pat(i)^2+linso4.rp(i)
    case 3
        linso4.errA=linso4.errA+1;
    case 4
        linso4.errB=linso4.errB+1;
    case 5
        linso4.errC=linso4.errC+1;
    case 7
        linso4.errD=linso4.errD+1;
    case 10
        linso4.errE=linso4.errE+1;
    case 11
        linso4.errF=linso4.errF+1;
end

switch linso2.pat(i)^2+linso2.rp(i)
    case 3
        linso2.errA=linso2.errA+1;
    case 4
        linso2.errB=linso2.errB+1;
    case 5
        linso2.errC=linso2.errC+1;
    case 7
        linso2.errD=linso2.errD+1;
    case 10
        linso2.errE=linso2.errE+1;
    case 11
        linso2.errF=linso2.errF+1;
end

switch outso4.pat(i)^2+outso4.rp(i)
    case 3
        outso4.errA=outso4.errA+1;
    case 4
        outso4.errB=outso4.errB+1;
    case 5
        outso4.errC=outso4.errC+1;
    case 7
        outso4.errD=outso4.errD+1;
    case 10
        outso4.errE=outso4.errE+1;
    case 11
        outso4.errF=outso4.errF+1;
end

switch outso2.pat(i)^2+outso2.rp(i)
    case 3
        outso2.errA=outso2.errA+1;
    case 4
        outso2.errB=outso2.errB+1;
    case 5
        outso2.errC=outso2.errC+1;
    case 7
        outso2.errD=outso2.errD+1;
    case 10
        outso2.errE=outso2.errE+1;
    case 11
        outso2.errF=outso2.errF+1;
end
end

err=[linsk4.errA+linsk2.errA linso4.errA+linso2.errA outso4.errA+outso2.errA
    linsk4.errB+linsk2.errB linso4.errB+linso2.errB outso4.errB+outso2.errB
    linsk4.errC+linsk2.errC linso4.errC+linso2.errC outso4.errC+outso2.errC
    linsk4.errD+linsk2.errD linso4.errD+linso2.errD outso4.errD+outso2.errD
    linsk4.errE+linsk2.errE linso4.errE+linso2.errE outso4.errE+outso2.errE
    linsk4.errF+linsk2.errF linso4.errF+linso2.errF outso4.errF+outso2.errF];

% Step 12: Count the number of missed responses

linsk4.miss=sum(linsk4.rp(:)==0);
linsk4.miss100a=sum(linsk4.rp(1:4)==0);
linsk4.miss100b=sum(linsk4.rp(5:9)==0);
linsk4.miss100c=sum(linsk4.rp(10:14)==0);
linsk4.miss50a=sum(linsk4.rp(15:18)==0);
linsk4.miss50b=sum(linsk4.rp(19:23)==0);
linsk4.miss50c=sum(linsk4.rp(24:28)==0);

linsk2.miss=sum(linsk2.rp(:)==0);
linsk2.miss100a=sum(linsk2.rp(1:4)==0);
linsk2.miss100b=sum(linsk2.rp(5:9)==0);
linsk2.miss100c=sum(linsk2.rp(10:14)==0);
linsk2.miss50a=sum(linsk2.rp(15:18)==0);
linsk2.miss50b=sum(linsk2.rp(19:23)==0);
linsk2.miss50c=sum(linsk2.rp(24:28)==0);

linso4.miss=sum(linso4.rp(:)==0);
linso4.miss100a=sum(linso4.rp(1:4)==0);
linso4.miss100b=sum(linso4.rp(5:9)==0);
linso4.miss100c=sum(linso4.rp(10:14)==0);
linso4.miss50a=sum(linso4.rp(15:18)==0);
linso4.miss50b=sum(linso4.rp(19:23)==0);
linso4.miss50c=sum(linso4.rp(24:28)==0);

linso2.miss=sum(linso2.rp(:)==0);
linso2.miss100a=sum(linso2.rp(1:4)==0);
linso2.miss100b=sum(linso2.rp(5:9)==0);
linso2.miss100c=sum(linso2.rp(10:14)==0);
linso2.miss50a=sum(linso2.rp(15:18)==0);
linso2.miss50b=sum(linso2.rp(19:23)==0);
linso2.miss50c=sum(linso2.rp(24:28)==0);

outso4.miss=sum(outso4.rp(:)==0);
outso4.miss100a=sum(outso4.rp(1:4)==0);
outso4.miss100b=sum(outso4.rp(5:9)==0);
outso4.miss100c=sum(outso4.rp(10:14)==0);
outso4.miss50a=sum(outso4.rp(15:18)==0);
outso4.miss50b=sum(outso4.rp(19:23)==0);
outso4.miss50c=sum(outso4.rp(24:28)==0);

outso2.miss=sum(outso2.rp(:)==0);
outso2.miss100a=sum(outso2.rp(1:4)==0);
outso2.miss100b=sum(outso2.rp(5:9)==0);
outso2.miss100c=sum(outso2.rp(10:14)==0);
outso2.miss50a=sum(outso2.rp(15:18)==0);
outso2.miss50b=sum(outso2.rp(19:23)==0);
outso2.miss50c=sum(outso2.rp(24:28)==0);

miss=[linsk4.miss+linsk2.miss linso4.miss+linso2.miss outso4.miss+outso2.miss];

% Step 13: Calculate and compare response times for correct and incorrect response

for i=1:28
    if linsk4.ra(i)==1
        linsk4.rt1(i)=linsk4.rt(i);
    elseif linsk4.ra(i)==0 && linsk4.rp(i)~=0
        linsk4.rt0(i)=linsk4.rt(i);
    end
    if linsk2.ra(i)==1
        linsk2.rt1(i)=linsk2.rt(i);
    elseif linsk2.ra(i)==0 && linsk2.rp(i)~=0
        linsk2.rt0(i)=linsk2.rt(i);
    end
     if linso4.ra(i)==1
        linso4.rt1(i)=linso4.rt(i);
    elseif linso4.ra(i)==0 && linso4.rp(i)~=0
        linso4.rt0(i)=linso4.rt(i);
    end
    if linso2.ra(i)==1
        linso2.rt1(i)=linso2.rt(i);
    elseif linso2.ra(i)==0 && linso2.rp(i)~=0
        linso2.rt0(i)=linso2.rt(i);
    end
    if outso4.ra(i)==1
        outso4.rt1(i)=outso4.rt(i);
    elseif outso4.ra(i)==0 && outso4.rp(i)~=0
        outso4.rt0(i)=outso4.rt(i);
    end
    if outso2.ra(i)==1
        outso2.rt1(i)=outso2.rt(i);
    elseif outso2.ra(i)==0 && outso2.rp(i)~=0
        outso2.rt0(i)=outso2.rt(i);
    end
end

linsk4.rt1=nonzeros(linsk4.rt1); linsk4.rt1m=mean(linsk4.rt1);
linsk4.rt0=nonzeros(linsk4.rt0); linsk4.rt0m=mean(linsk4.rt0);
linsk2.rt1=nonzeros(linsk2.rt1); linsk2.rt1m=mean(linsk2.rt1);
linsk2.rt0=nonzeros(linsk2.rt0); linsk2.rt0m=mean(linsk2.rt0);
linso4.rt1=nonzeros(linso4.rt1); linso4.rt1m=mean(linso4.rt1);
linso4.rt0=nonzeros(linso4.rt0); linso4.rt0m=mean(linso4.rt0);
linso2.rt1=nonzeros(linso2.rt1); linso2.rt1m=mean(linso2.rt1);
linso2.rt0=nonzeros(linso2.rt0); linso2.rt0m=mean(linso2.rt0);
outso4.rt1=nonzeros(outso4.rt1); outso4.rt1m=mean(outso4.rt1);
outso4.rt0=nonzeros(outso4.rt0); outso4.rt0m=mean(outso4.rt0);
outso2.rt1=nonzeros(outso2.rt1); outso2.rt1m=mean(outso2.rt1);
outso2.rt0=nonzeros(outso2.rt0); outso2.rt0m=mean(outso2.rt0);

comprtra=[mean(vertcat(linsk4.rt1,linsk2.rt1,linso4.rt1,linso2.rt1,outso4.rt1,outso2.rt1)) mean(vertcat(linsk4.rt0,linsk2.rt0,linso4.rt0,linso2.rt0,outso4.rt0,outso2.rt0))
    mean(vertcat(linsk4.rt1,linsk2.rt1)) mean(vertcat(linsk4.rt0,linsk2.rt0))
    mean(vertcat(linso4.rt1,linso2.rt1)) mean(vertcat(linso4.rt0,linso2.rt0))
    mean(vertcat(outso4.rt1,outso2.rt1)) mean(vertcat(outso4.rt0,outso2.rt0))];

% Step 14: Calculate Mean and Standard Deviation of Locating Error
% Trials with one vibration at each pressure/intensity
% Disregard the trials with no response

linsk4.le100=linsk4.le(~isnan(linsk4.le(1:14)));
linsk4.le100m=mean(linsk4.le100); linsk4.le100s=std(linsk4.le100);
linsk4.le50=linsk4.le(15:28); linsk4.le50=linsk4.le50(~isnan(linsk4.le50));
linsk4.le50m=mean(linsk4.le50); linsk4.le50s=std(linsk4.le50);
 
linsk2.le100=linsk2.le(~isnan(linsk2.le(1:14)));
linsk2.le100m=mean(linsk2.le100); linsk2.le100s=std(linsk2.le100);
linsk2.le50=linsk2.le(15:28); linsk2.le50=linsk2.le50(~isnan(linsk2.le50));
linsk2.le50m=mean(linsk2.le50); linsk2.le50s=std(linsk2.le50);
 
linso4.le100=linso4.le(~isnan(linso4.le(1:14)));
linso4.le100m=mean(linso4.le100); linso4.le100s=std(linso4.le100);
linso4.le50=linso4.le(15:28); linso4.le50=linso4.le50(~isnan(linso4.le50));
linso4.le50m=mean(linso4.le50); linso4.le50s=std(linso4.le50);
 
linso2.le100=linso2.le(~isnan(linso2.le(1:14)));
linso2.le100m=mean(linso2.le100); linso2.le100s=std(linso2.le100);
linso2.le50=linso2.le(15:28); linso2.le50=linso2.le50(~isnan(linso2.le50));
linso2.le50m=mean(linso2.le50); linso2.le50s=std(linso2.le50);
 
outso4.le100=outso4.le(~isnan(outso4.le(1:14)));
outso4.le100m=mean(outso4.le100); outso4.le100s=std(outso4.le100);
outso4.le50=outso4.le(15:28); outso4.le50=outso4.le50(~isnan(outso4.le50));
outso4.le50m=mean(outso4.le50); outso4.le50s=std(outso4.le50);
 
outso2.le100=outso2.le(~isnan(outso2.le(1:14)));
outso2.le100m=mean(outso2.le100); outso2.le100s=std(outso2.le100);
outso2.le50=outso2.le(15:28); outso2.le50=outso2.le50(~isnan(outso2.le50));
outso2.le50m=mean(outso2.le50); outso2.le50s=std(outso2.le50);

% Step 15: Locating Error Breakdown
% Locating Error for Correct (1) vs. Incorrect Response (0)
% Locating one tactor vs. Locating two tactor
% 1a) One tactor->One tactor; 1b) Two tactors->Two tactors;
% 0a) One tactor->Two tactors; 0b) Two tactors->One tactor;

linsk4.le1a=zeros(1,28); linsk4.le1b=zeros(1,28); linsk4.le1=zeros(1,28);
linsk4.le0a=zeros(1,28); linsk4.le0b=zeros(1,28); linsk4.le0=zeros(1,28);
linsk2.le1a=zeros(1,28); linsk2.le1b=zeros(1,28); linsk2.le1=zeros(1,28);
linsk2.le0a=zeros(1,28); linsk2.le0b=zeros(1,28); linsk2.le0=zeros(1,28);
linso4.le1a=zeros(1,28); linso4.le1b=zeros(1,28); linso4.le1=zeros(1,28);
linso4.le0a=zeros(1,28); linso4.le0b=zeros(1,28); linso4.le0=zeros(1,28);
linso2.le1a=zeros(1,28); linso2.le1b=zeros(1,28); linso2.le1=zeros(1,28);
linso2.le0a=zeros(1,28); linso2.le0b=zeros(1,28); linso2.le0=zeros(1,28);
outso4.le1a=zeros(1,28); outso4.le1b=zeros(1,28); outso4.le1=zeros(1,28);
outso4.le0a=zeros(1,28); outso4.le0b=zeros(1,28); outso4.le0=zeros(1,28);
outso2.le1a=zeros(1,28); outso2.le1b=zeros(1,28); outso2.le1=zeros(1,28);
outso2.le0a=zeros(1,28); outso2.le0b=zeros(1,28); outso2.le0=zeros(1,28);

for i=1:28
    if linsk4.pat(i)==1 && linsk4.rp(i)==1
        linsk4.le1a(i)=linsk4.le(i); linsk4.le1(i)=linsk4.le(i);
    elseif linsk4.pat(i)==1 && (linsk4.rp(i)==2 || linsk4.rp(i)==3)
        linsk4.le0a(i)=linsk4.le(i); linsk4.le0(i)=linsk4.le(i);
    elseif (linsk4.pat(i)==2 || linsk4.pat(i)==3) && linsk4.rp(i)==1
        linsk4.le0b(i)=linsk4.le(i); linsk4.le0(i)=linsk4.le(i);
    elseif linsk4.pat(i)==2 && linsk4.rp(i)==2 || linsk4.pat(i)==3 && linsk4.rp(i)==3
        linsk4.le1b(i)=linsk4.le(i); linsk4.le1(i)=linsk4.le(i);
    elseif linsk4.pat(i)==2 && linsk4.rp(i)==3 || linsk4.pat(i)==3 && linsk4.rp(i)==2
        linsk4.le1b(i)=linsk4.le(i); linsk4.le0(i)=linsk4.le(i);
    end
    
    if linsk2.pat(i)==1 && linsk2.rp(i)==1
        linsk2.le1a(i)=linsk2.le(i); linsk2.le1(i)=linsk2.le(i);
    elseif linsk2.pat(i)==1 && (linsk2.rp(i)==2 || linsk2.rp(i)==3)
        linsk2.le0a(i)=linsk2.le(i); linsk2.le0(i)=linsk2.le(i);
    elseif (linsk2.pat(i)==2 || linsk2.pat(i)==3) && linsk2.rp(i)==1
        linsk2.le0b(i)=linsk2.le(i); linsk2.le0(i)=linsk2.le(i);
    elseif linsk2.pat(i)==2 && linsk2.rp(i)==2 || linsk2.pat(i)==3 && linsk2.rp(i)==3
        linsk2.le1b(i)=linsk2.le(i); linsk2.le1(i)=linsk2.le(i);
    elseif linsk2.pat(i)==2 && linsk2.rp(i)==3 || linsk2.pat(i)==3 && linsk2.rp(i)==2
        linsk2.le1b(i)=linsk2.le(i); linsk2.le0(i)=linsk2.le(i);
    end
    
    if linso4.pat(i)==1 && linso4.rp(i)==1
        linso4.le1a(i)=linso4.le(i); linso4.le1(i)=linso4.le(i);
    elseif linso4.pat(i)==1 && (linso4.rp(i)==2 || linso4.rp(i)==3)
        linso4.le0a(i)=linso4.le(i); linso4.le0(i)=linso4.le(i);
    elseif (linso4.pat(i)==2 || linso4.pat(i)==3) && linso4.rp(i)==1
        linso4.le0b(i)=linso4.le(i); linso4.le0(i)=linso4.le(i);
    elseif linso4.pat(i)==2 && linso4.rp(i)==2 || linso4.pat(i)==3 && linso4.rp(i)==3
        linso4.le1b(i)=linso4.le(i); linso4.le1(i)=linso4.le(i);
    elseif linso4.pat(i)==2 && linso4.rp(i)==3 || linso4.pat(i)==3 && linso4.rp(i)==2
        linso4.le1b(i)=linso4.le(i); linso4.le0(i)=linso4.le(i);
    end
    
    if linso2.pat(i)==1 && linso2.rp(i)==1
        linso2.le1a(i)=linso2.le(i); linso2.le1(i)=linso2.le(i);
    elseif linso2.pat(i)==1 && (linso2.rp(i)==2 || linso2.rp(i)==3)
        linso2.le0a(i)=linso2.le(i); linso2.le0(i)=linso2.le(i);
    elseif (linso2.pat(i)==2 || linso2.pat(i)==3) && linso2.rp(i)==1
        linso2.le0b(i)=linso2.le(i); linso2.le0(i)=linso2.le(i);
    elseif linso2.pat(i)==2 && linso2.rp(i)==2 || linso2.pat(i)==3 && linso2.rp(i)==3
        linso2.le1b(i)=linso2.le(i); linso2.le1(i)=linso2.le(i);
    elseif linso2.pat(i)==2 && linso2.rp(i)==3 || linso2.pat(i)==3 && linso2.rp(i)==2
        linso2.le1b(i)=linso2.le(i); linso2.le0(i)=linso2.le(i);
    end

    if outso4.pat(i)==1 && outso4.rp(i)==1
        outso4.le1a(i)=outso4.le(i); outso4.le1(i)=outso4.le(i);
    elseif outso4.pat(i)==1 && (outso4.rp(i)==2 || outso4.rp(i)==3)
        outso4.le0a(i)=outso4.le(i); outso4.le0(i)=outso4.le(i);
    elseif (outso4.pat(i)==2 || outso4.pat(i)==3) && outso4.rp(i)==1
        outso4.le0b(i)=outso4.le(i); outso4.le0(i)=outso4.le(i);
    elseif outso4.pat(i)==2 && outso4.rp(i)==2 || outso4.pat(i)==3 && outso4.rp(i)==3
        outso4.le1b(i)=outso4.le(i); outso4.le1(i)=outso4.le(i);
    elseif outso4.pat(i)==2 && outso4.rp(i)==3 || outso4.pat(i)==3 && outso4.rp(i)==2
        outso4.le1b(i)=outso4.le(i); outso4.le0(i)=outso4.le(i);
    end
    
    if outso2.pat(i)==1 && outso2.rp(i)==1
        outso2.le1a(i)=outso2.le(i); outso2.le1(i)=outso2.le(i);
    elseif outso2.pat(i)==1 && (outso2.rp(i)==2 || outso2.rp(i)==3)
        outso2.le0a(i)=outso2.le(i); outso2.le0(i)=outso2.le(i);
    elseif (outso2.pat(i)==2 || outso2.pat(i)==3) && outso2.rp(i)==1
        outso2.le0b(i)=outso2.le(i); outso2.le0(i)=outso2.le(i);
    elseif outso2.pat(i)==2 && outso2.rp(i)==2 || outso2.pat(i)==3 && outso2.rp(i)==3
        outso2.le1b(i)=outso2.le(i); outso2.le1(i)=outso2.le(i);
    elseif outso2.pat(i)==2 && outso2.rp(i)==3 || outso2.pat(i)==3 && outso2.rp(i)==2
        outso2.le1b(i)=outso2.le(i); outso2.le0(i)=outso2.le(i);
    end
end

linsk4.le1a=nonzeros(linsk4.le1a); linsk4.le1b=nonzeros(linsk4.le1b); linsk4.le1=nonzeros(linsk4.le1);
linsk4.le0a=nonzeros(linsk4.le0a); linsk4.le0b=nonzeros(linsk4.le0b); linsk4.le0=nonzeros(linsk4.le0);
linsk2.le1a=nonzeros(linsk2.le1a); linsk2.le1b=nonzeros(linsk2.le1b); linsk2.le1=nonzeros(linsk2.le1);
linsk2.le0a=nonzeros(linsk2.le0a); linsk2.le0b=nonzeros(linsk2.le0b); linsk2.le0=nonzeros(linsk2.le0);
linso4.le1a=nonzeros(linso4.le1a); linso4.le1b=nonzeros(linso4.le1b); linso4.le1=nonzeros(linso4.le1);
linso4.le0a=nonzeros(linso4.le0a); linso4.le0b=nonzeros(linso4.le0b); linso4.le0=nonzeros(linso4.le0);
linso2.le1a=nonzeros(linso2.le1a); linso2.le1b=nonzeros(linso2.le1b); linso2.le1=nonzeros(linso2.le1);
linso2.le0a=nonzeros(linso2.le0a); linso2.le0b=nonzeros(linso2.le0b); linso2.le0=nonzeros(linso2.le0);
outso4.le1a=nonzeros(outso4.le1a); outso4.le1b=nonzeros(outso4.le1b); outso4.le1=nonzeros(outso4.le1);
outso4.le0a=nonzeros(outso4.le0a); outso4.le0b=nonzeros(outso4.le0b); outso4.le0=nonzeros(outso4.le0);
outso2.le1a=nonzeros(outso2.le1a); outso2.le1b=nonzeros(outso2.le1b); outso2.le1=nonzeros(outso2.le1);
outso2.le0a=nonzeros(outso2.le0a); outso2.le0b=nonzeros(outso2.le0b); outso2.le0=nonzeros(outso2.le0);

complera=[mean(vertcat(linsk4.le1,linsk2.le1)) mean(vertcat(linsk4.le0,linsk2.le0))
    mean(vertcat(linso4.le1,linso2.le1)) mean(vertcat(linso4.le0,linso2.le0))
    mean(vertcat(outso4.le1,outso2.le1)) mean(vertcat(outso4.le0,outso2.le0))];

comple=[mean(vertcat(linsk4.le1a,linsk2.le1a)) mean(vertcat(linsk4.le1b,linsk2.le1b)) mean(vertcat(linsk4.le0a,linsk2.le0a)) mean(vertcat(linsk4.le0b,linsk2.le0b))
    mean(vertcat(linso4.le1a,linso2.le1a)) mean(vertcat(linso4.le1b,linso2.le1b)) mean(vertcat(linso4.le0a,linso2.le0a)) mean(vertcat(linso4.le0b,linso2.le0b))
    mean(vertcat(outso4.le1a,outso2.le1a)) mean(vertcat(outso4.le1b,outso2.le1b)) mean(vertcat(outso4.le0a,outso2.le0a)) mean(vertcat(outso4.le0b,outso2.le0b))];

% Step 16: Locating Error Direction
% letter difference +: lateral shift; -: medial shift
% number difference +: distal shift; -: proximal shift
linsk4.ls=zeros(28,1); linsk4.ms=zeros(28,1); linsk4.ds=zeros(28,1); linsk4.ps=zeros(28,1);
linsk2.ls=zeros(28,1); linsk2.ms=zeros(28,1); linsk2.ds=zeros(28,1); linsk2.ps=zeros(28,1);
linso4.ls=zeros(28,1); linso4.ms=zeros(28,1); linso4.ds=zeros(28,1); linso4.ps=zeros(28,1);
linso2.ls=zeros(28,1); linso2.ms=zeros(28,1); linso2.ds=zeros(28,1); linso2.ps=zeros(28,1);
outso4.ls=zeros(28,1); outso4.ms=zeros(28,1); outso4.ds=zeros(28,1); outso4.ps=zeros(28,1);
outso2.ls=zeros(28,1); outso2.ms=zeros(28,1); outso2.ds=zeros(28,1); outso2.ps=zeros(28,1);

for i=1:28
    if linsk4.letd(i)>0
        linsk4.ls(i)=linsk4.letd(i);
    elseif linsk4.letd(i)<0
        linsk4.ms(i)=-linsk4.letd(i);
    end
    if linsk4.numd(i)>0
        linsk4.ds(i)=linsk4.numd(i);
    elseif linsk4.numd(i)<0
        linsk4.ps(i)=-linsk4.numd(i);
    end
       
    if linsk2.letd(i)>0
        linsk2.ls(i)=linsk2.letd(i);
    elseif linsk2.letd(i)<0
        linsk2.ms(i)=-linsk2.letd(i);
    end
    if linsk2.numd(i)>0
        linsk2.ds(i)=linsk2.numd(i);
    elseif linsk2.numd(i)<0
        linsk2.ps(i)=-linsk2.numd(i);
    end
    
    if linso4.letd(i)>0
        linso4.ls(i)=linso4.letd(i);
    elseif linso4.letd(i)<0
        linso4.ms(i)=-linso4.letd(i);
    end
    if linso4.numd(i)>0
        linso4.ds(i)=linso4.numd(i);
    elseif linso4.numd(i)<0
        linso4.ps(i)=-linso4.numd(i);
    end

    if linso2.letd(i)>0
        linso2.ls(i)=linso2.letd(i);
    elseif linso2.letd(i)<0
        linso2.ms(i)=-linso2.letd(i);
    end
    if linso2.numd(i)>0
        linso2.ds(i)=linso2.numd(i);
    elseif linso2.numd(i)<0
        linso2.ps(i)=-linso2.numd(i);
    end

    if outso4.letd(i)>0
        outso4.ls(i)=outso4.letd(i);
    elseif outso4.letd(i)<0
        outso4.ms(i)=-outso4.letd(i);
    end
    if outso4.numd(i)>0
        outso4.ds(i)=outso4.numd(i);
    elseif outso4.numd(i)<0
        outso4.ps(i)=-outso4.numd(i);
    end

    if outso2.letd(i)>0
        outso2.ls(i)=outso2.letd(i);
    elseif outso2.letd(i)<0
        outso2.ms(i)=-outso2.letd(i);
    end
    if outso2.numd(i)>0
        outso2.ds(i)=outso2.numd(i);
    elseif outso2.numd(i)<0
        outso2.ps(i)=-outso2.numd(i);
    end
end

linsk4.ls=nonzeros(linsk4.ls); linsk4.ms=nonzeros(linsk4.ms); linsk4.ds=nonzeros(linsk4.ds); linsk4.ps=nonzeros(linsk4.ps); 
linsk2.ls=nonzeros(linsk2.ls); linsk2.ms=nonzeros(linsk2.ms); linsk2.ds=nonzeros(linsk2.ds); linsk2.ps=nonzeros(linsk2.ps); 
linso4.ls=nonzeros(linso4.ls); linso4.ms=nonzeros(linso4.ms); linso4.ds=nonzeros(linso4.ds); linso4.ps=nonzeros(linso4.ps); 
linso2.ls=nonzeros(linso2.ls); linso2.ms=nonzeros(linso2.ms); linso2.ds=nonzeros(linso2.ds); linso2.ps=nonzeros(linso2.ps); 
outso4.ls=nonzeros(outso4.ls); outso4.ms=nonzeros(outso4.ms); outso4.ds=nonzeros(outso4.ds); outso4.ps=nonzeros(outso4.ps); 
outso2.ls=nonzeros(outso2.ls); outso2.ms=nonzeros(outso2.ms); outso2.ds=nonzeros(outso2.ds); outso2.ps=nonzeros(outso2.ps); 

locshiftnum(:,1)=cellstr([sprintf('%7.0f',length(vertcat(linsk4.ls,linsk2.ls)))
    sprintf('%7.0f',length(vertcat(linsk4.ms,linsk2.ms)))
    sprintf('%7.0f',length(vertcat(linsk4.ds,linsk2.ds)))
    sprintf('%7.0f',length(vertcat(linsk4.ps,linsk2.ps)))]);

locshiftnum(:,2)=cellstr([sprintf('%7.0f',length(vertcat(linso4.ls,linso2.ls)))
    sprintf('%7.0f',length(vertcat(linso4.ms,linso2.ms)))
     sprintf('%7.0f',length(vertcat(linso4.ds,linso2.ds)))
     sprintf('%7.0f',length(vertcat(linso4.ps,linso2.ps)))]);

locshiftnum(:,3)=cellstr([sprintf('%7.0f',length(vertcat(outso4.ls,outso2.ls)))
    sprintf('%7.0f',length(vertcat(outso4.ms,outso2.ms)))
    sprintf('%7.0f',length(vertcat(outso4.ds,outso2.ds)))
    sprintf('%7.0f',length(vertcat(outso4.ps,outso2.ps)))]);

locshiftdis(:,1)=cellstr([sprintf('%7.1f',mean(vertcat(linsk4.ls,linsk2.ls)))
    sprintf('%7.1f',mean(vertcat(linsk4.ms,linsk2.ms)))
    sprintf('%7.1f',mean(vertcat(linsk4.ds,linsk2.ds)))
    sprintf('%7.1f',mean(vertcat(linsk4.ps,linsk2.ps)))]);

locshiftdis(:,2)=cellstr([sprintf('%7.1f',mean(vertcat(linso4.ls,linso2.ls)))
    sprintf('%7.1f',mean(vertcat(linso4.ms,linso2.ms)))
    sprintf('%7.1f',mean(vertcat(linso4.ds,linso2.ds)))
   sprintf('%7.1f',mean(vertcat(linso4.ps,linso2.ps)))]);

locshiftdis(:,3)=cellstr([sprintf('%7.1f',mean(vertcat(outso4.ls,outso2.ls)))
    sprintf('%7.1f',mean(vertcat(outso4.ms,outso2.ms)))
    sprintf('%7.1f',mean(vertcat(outso4.ds,outso2.ds)))
    sprintf('%7.1f',mean(vertcat(outso4.ps,outso2.ps)))]);
