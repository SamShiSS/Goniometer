% This MATLAB script consolidates outcome measure results from all subjects for generation of the following plots

% Figure 1: Effects of Layer/Pressure/Intensity on Response Time
% Figure 2: Effects of Tactors' Separation Distance on Response Time
% Figure 3: Effects of Layer/Pressure/Intensity on Response Accuracy
% Figure 4: Effect of Spacing on Response Accuracy
% Figure 5: Response Accuracy In-depth Analysis
% Figure 6: Effects of Layer/Pressure/Intensity on Locating Error
% Figure 7: Effect of Spacing on Locating Error
% Figure 8: Outcome Measure Interaction Analysis

% Load each subject's outcome measure data into a structure array
sub(1)=load('subject1.mat');
sub(2)=load('subject2.mat');
sub(3)=load('subject3.mat');
sub(4)=load('subject4.mat');
sub(5)=load('subject5.mat');
sub(6)=load('subject6.mat');
sub(7)=load('subject7.mat');
sub(8)=load('subject8.mat');
sub(9)=load('subject9.mat');
sub(10)=load('subject10.mat');

% Figure 1: Effect of Layer/Pressure/Intensity on Response Time
for i=1:length(sub)
    c.linsk4.rt100x2(i)=sub(i).linsk4.rt100x2m;
    c.linsk4.rt50x2(i)=sub(i).linsk4.rt50x2m;
    c.linsk4.rt100(i)=sub(i).linsk4.rt100m;
    c.linsk4.rt50(i)=sub(i).linsk4.rt50m;
    
    c.linsk2.rt100x2(i)=sub(i).linsk2.rt100x2m;
    c.linsk2.rt50x2(i)=sub(i).linsk2.rt50x2m;
    c.linsk2.rt100(i)=sub(i).linsk2.rt100m;
    c.linsk2.rt50(i)=sub(i).linsk2.rt50m;
    
    c.linso4.rt100x2(i)=sub(i).linso4.rt100x2m;
    c.linso4.rt50x2(i)=sub(i).linso4.rt50x2m;
    c.linso4.rt100(i)=sub(i).linso4.rt100m;
    c.linso4.rt50(i)=sub(i).linso4.rt50m;
    
    c.linso2.rt100x2(i)=sub(i).linso2.rt100x2m;
    c.linso2.rt50x2(i)=sub(i).linso2.rt50x2m;
    c.linso2.rt100(i)=sub(i).linso2.rt100m;
    c.linso2.rt50(i)=sub(i).linso2.rt50m;
    
    c.outso4.rt100x2(i)=sub(i).outso4.rt100x2m;
    c.outso4.rt50x2(i)=sub(i).outso4.rt50x2m;
    c.outso4.rt100(i)=sub(i).outso4.rt100m;
    c.outso4.rt50(i)=sub(i).outso4.rt50m;
    
    c.outso2.rt100x2(i)=sub(i).outso2.rt100x2m;
    c.outso2.rt50x2(i)=sub(i).outso2.rt50x2m; 
    c.outso2.rt100(i)=sub(i).outso2.rt100m;
    c.outso2.rt50(i)=sub(i).outso2.rt50m;   
end

c.linsk4.rt100x2m=mean(c.linsk4.rt100x2); c.linsk4.rt100x2s=std(c.linsk4.rt100x2);
c.linsk4.rt50x2m=mean(c.linsk4.rt50x2); c.linsk4.rt50x2s=std(c.linsk4.rt50x2);
c.linsk4.rt100m=mean(c.linsk4.rt100); c.linsk4.rt100s=std(c.linsk4.rt100);
c.linsk4.rt50m=mean(c.linsk4.rt50); c.linsk4.rt50s=std(c.linsk4.rt50);

c.linsk2.rt100x2m=mean(c.linsk2.rt100x2); c.linsk2.rt100x2s=std(c.linsk2.rt100x2);
c.linsk2.rt50x2m=mean(c.linsk2.rt50x2); c.linsk2.rt50x2s=std(c.linsk2.rt50x2);
c.linsk2.rt100m=mean(c.linsk2.rt100); c.linsk2.rt100s=std(c.linsk2.rt100);
c.linsk2.rt50m=mean(c.linsk2.rt50); c.linsk2.rt50s=std(c.linsk2.rt50);

c.linso4.rt100x2m=mean(c.linso4.rt100x2); c.linso4.rt100x2s=std(c.linso4.rt100x2);
c.linso4.rt50x2m=mean(c.linso4.rt50x2); c.linso4.rt50x2s=std(c.linso4.rt50x2);    
c.linso4.rt100m=mean(c.linso4.rt100); c.linso4.rt100s=std(c.linso4.rt100);
c.linso4.rt50m=mean(c.linso4.rt50); c.linso4.rt50s=std(c.linso4.rt50);

c.linso2.rt100x2m=mean(c.linso2.rt100x2); c.linso2.rt100x2s=std(c.linso2.rt100x2);
c.linso2.rt50x2m=mean(c.linso2.rt50x2); c.linso2.rt50x2s=std(c.linso2.rt50x2); 
c.linso2.rt100m=mean(c.linso2.rt100); c.linso2.rt100s=std(c.linso2.rt100);
c.linso2.rt50m=mean(c.linso2.rt50); c.linso2.rt50s=std(c.linso2.rt50);

c.outso4.rt100x2m=mean(c.outso4.rt100x2); c.outso4.rt100x2s=std(c.outso4.rt100x2);
c.outso4.rt50x2m=mean(c.outso4.rt50x2); c.outso4.rt50x2s=std(c.outso4.rt50x2);
c.outso4.rt100m=mean(c.outso4.rt100); c.outso4.rt100s=std(c.outso4.rt100);
c.outso4.rt50m=mean(c.outso4.rt50); c.outso4.rt50s=std(c.outso4.rt50);

c.outso2.rt100x2m=mean(c.outso2.rt100x2); c.outso2.rt100x2s=std(c.outso2.rt100x2);
c.outso2.rt50x2m=mean(c.outso2.rt50x2); c.outso2.rt50x2s=std(c.outso2.rt50x2);
c.outso2.rt100m=mean(c.outso2.rt100); c.outso2.rt100s=std(c.outso2.rt100);
c.outso2.rt50m=mean(c.outso2.rt50); c.outso2.rt50s=std(c.outso2.rt50);

% Figure 2: Effect of Tactors' Separation Distance on Response Time
for i=1:length(sub)
    c.linsk4.rt100b2(i)=sub(i).linsk4.rt(5);
    c.linsk4.rt100b4(i)=sub(i).linsk4.rt(6);
    c.linsk4.rt100b6(i)=sub(i).linsk4.rt(7);
    c.linsk4.rt100b8(i)=sub(i).linsk4.rt(8);
    c.linsk4.rt100b10(i)=sub(i).linsk4.rt(9);
    c.linsk4.rt50b2(i)=sub(i).linsk4.rt(19);
    c.linsk4.rt50b4(i)=sub(i).linsk4.rt(20);
    c.linsk4.rt50b6(i)=sub(i).linsk4.rt(21);
    c.linsk4.rt50b8(i)=sub(i).linsk4.rt(22);
    c.linsk4.rt50b10(i)=sub(i).linsk4.rt(23);
    
    c.linsk2.rt100b2(i)=sub(i).linsk2.rt(5);
    c.linsk2.rt100b4(i)=sub(i).linsk2.rt(6);
    c.linsk2.rt100b6(i)=sub(i).linsk2.rt(7);
    c.linsk2.rt100b8(i)=sub(i).linsk2.rt(8);
    c.linsk2.rt100b10(i)=sub(i).linsk2.rt(9);
    c.linsk2.rt50b2(i)=sub(i).linsk2.rt(19);
    c.linsk2.rt50b4(i)=sub(i).linsk2.rt(20);
    c.linsk2.rt50b6(i)=sub(i).linsk2.rt(21);
    c.linsk2.rt50b8(i)=sub(i).linsk2.rt(22);
    c.linsk2.rt50b10(i)=sub(i).linsk2.rt(23);

    c.linso4.rt100b2(i)=sub(i).linso4.rt(5);
    c.linso4.rt100b4(i)=sub(i).linso4.rt(6);
    c.linso4.rt100b6(i)=sub(i).linso4.rt(7);
    c.linso4.rt100b8(i)=sub(i).linso4.rt(8);
    c.linso4.rt100b10(i)=sub(i).linso4.rt(9);
    c.linso4.rt50b2(i)=sub(i).linso4.rt(19);
    c.linso4.rt50b4(i)=sub(i).linso4.rt(20);
    c.linso4.rt50b6(i)=sub(i).linso4.rt(21);
    c.linso4.rt50b8(i)=sub(i).linso4.rt(22);
    c.linso4.rt50b10(i)=sub(i).linso4.rt(23);
    
    c.linso2.rt100b2(i)=sub(i).linso2.rt(5);
    c.linso2.rt100b4(i)=sub(i).linso2.rt(6);
    c.linso2.rt100b6(i)=sub(i).linso2.rt(7);
    c.linso2.rt100b8(i)=sub(i).linso2.rt(8);
    c.linso2.rt100b10(i)=sub(i).linso2.rt(9);
    c.linso2.rt50b2(i)=sub(i).linso2.rt(19);
    c.linso2.rt50b4(i)=sub(i).linso2.rt(20);
    c.linso2.rt50b6(i)=sub(i).linso2.rt(21);
    c.linso2.rt50b8(i)=sub(i).linso2.rt(22);
    c.linso2.rt50b10(i)=sub(i).linso2.rt(23);

    c.outso4.rt100b2(i)=sub(i).outso4.rt(5);
    c.outso4.rt100b4(i)=sub(i).outso4.rt(6);
    c.outso4.rt100b6(i)=sub(i).outso4.rt(7);
    c.outso4.rt100b8(i)=sub(i).outso4.rt(8);
    c.outso4.rt100b10(i)=sub(i).outso4.rt(9);
    c.outso4.rt50b2(i)=sub(i).outso4.rt(19);
    c.outso4.rt50b4(i)=sub(i).outso4.rt(20);
    c.outso4.rt50b6(i)=sub(i).outso4.rt(21);
    c.outso4.rt50b8(i)=sub(i).outso4.rt(22);
    c.outso4.rt50b10(i)=sub(i).outso4.rt(23);
    
    c.outso2.rt100b2(i)=sub(i).outso2.rt(5);
    c.outso2.rt100b4(i)=sub(i).outso2.rt(6);
    c.outso2.rt100b6(i)=sub(i).outso2.rt(7);
    c.outso2.rt100b8(i)=sub(i).outso2.rt(8);
    c.outso2.rt100b10(i)=sub(i).outso2.rt(9);
    c.outso2.rt50b2(i)=sub(i).outso2.rt(19);
    c.outso2.rt50b4(i)=sub(i).outso2.rt(20);
    c.outso2.rt50b6(i)=sub(i).outso2.rt(21);
    c.outso2.rt50b8(i)=sub(i).outso2.rt(22);
    c.outso2.rt50b10(i)=sub(i).outso2.rt(23);
end

c.linsk4.rt100b2m=nanmean(c.linsk4.rt100b2); c.linsk4.rt100b2s=std(c.linsk4.rt100b2);
c.linsk4.rt100b4m=nanmean(c.linsk4.rt100b4); c.linsk4.rt100b4s=std(c.linsk4.rt100b4);
c.linsk4.rt100b6m=nanmean(c.linsk4.rt100b6); c.linsk4.rt100b6s=std(c.linsk4.rt100b6);
c.linsk4.rt100b8m=nanmean(c.linsk4.rt100b8); c.linsk4.rt100b8s=std(c.linsk4.rt100b8);
c.linsk4.rt100b10m=nanmean(c.linsk4.rt100b10); c.linsk4.rt100b10s=std(c.linsk4.rt100b10);
c.linsk4.rt50b2m=nanmean(c.linsk4.rt50b2); c.linsk4.rt50b2s=std(c.linsk4.rt50b2);
c.linsk4.rt50b4m=nanmean(c.linsk4.rt50b4); c.linsk4.rt50b4s=std(c.linsk4.rt50b4);
c.linsk4.rt50b6m=nanmean(c.linsk4.rt50b6); c.linsk4.rt50b6s=std(c.linsk4.rt50b6);
c.linsk4.rt50b8m=nanmean(c.linsk4.rt50b8); c.linsk4.rt50b8s=std(c.linsk4.rt50b8);
c.linsk4.rt50b10m=nanmean(c.linsk4.rt50b10); c.linsk4.rt50b10s=std(c.linsk4.rt50b10);
 
c.linsk2.rt100b2m=nanmean(c.linsk2.rt100b2); c.linsk2.rt100b2s=std(c.linsk2.rt100b2);
c.linsk2.rt100b4m=nanmean(c.linsk2.rt100b4); c.linsk2.rt100b4s=std(c.linsk2.rt100b4);
c.linsk2.rt100b6m=nanmean(c.linsk2.rt100b6); c.linsk2.rt100b6s=std(c.linsk2.rt100b6);
c.linsk2.rt100b8m=nanmean(c.linsk2.rt100b8); c.linsk2.rt100b8s=std(c.linsk2.rt100b8);
c.linsk2.rt100b10m=nanmean(c.linsk2.rt100b10); c.linsk2.rt100b10s=std(c.linsk2.rt100b10); 
c.linsk2.rt50b2m=nanmean(c.linsk2.rt50b2); c.linsk2.rt50b2s=std(c.linsk2.rt50b2);
c.linsk2.rt50b4m=nanmean(c.linsk2.rt50b4); c.linsk2.rt50b4s=std(c.linsk2.rt50b4);
c.linsk2.rt50b6m=nanmean(c.linsk2.rt50b6); c.linsk2.rt50b6s=std(c.linsk2.rt50b6);
c.linsk2.rt50b8m=nanmean(c.linsk2.rt50b8); c.linsk2.rt50b8s=std(c.linsk2.rt50b8);
c.linsk2.rt50b10m=nanmean(c.linsk2.rt50b10); c.linsk2.rt50b10s=std(c.linsk2.rt50b10);
 
c.linso4.rt100b2m=nanmean(c.linso4.rt100b2); c.linso4.rt100b2s=std(c.linso4.rt100b2);
c.linso4.rt100b4m=nanmean(c.linso4.rt100b4); c.linso4.rt100b4s=std(c.linso4.rt100b4);
c.linso4.rt100b6m=nanmean(c.linso4.rt100b6); c.linso4.rt100b6s=std(c.linso4.rt100b6);
c.linso4.rt100b8m=nanmean(c.linso4.rt100b8); c.linso4.rt100b8s=std(c.linso4.rt100b8);
c.linso4.rt100b10m=nanmean(c.linso4.rt100b10); c.linso4.rt100b10s=std(c.linso4.rt100b10); 
c.linso4.rt50b2m=nanmean(c.linso4.rt50b2); c.linso4.rt50b2s=std(c.linso4.rt50b2);
c.linso4.rt50b4m=nanmean(c.linso4.rt50b4); c.linso4.rt50b4s=std(c.linso4.rt50b4);
c.linso4.rt50b6m=nanmean(c.linso4.rt50b6); c.linso4.rt50b6s=std(c.linso4.rt50b6);
c.linso4.rt50b8m=nanmean(c.linso4.rt50b8); c.linso4.rt50b8s=std(c.linso4.rt50b8);
c.linso4.rt50b10m=nanmean(c.linso4.rt50b10); c.linso4.rt50b10s=std(c.linso4.rt50b10);
 
c.linso2.rt100b2m=nanmean(c.linso2.rt100b2); c.linso2.rt100b2s=std(c.linso2.rt100b2);
c.linso2.rt100b4m=nanmean(c.linso2.rt100b4); c.linso2.rt100b4s=std(c.linso2.rt100b4);
c.linso2.rt100b6m=nanmean(c.linso2.rt100b6); c.linso2.rt100b6s=std(c.linso2.rt100b6);
c.linso2.rt100b8m=nanmean(c.linso2.rt100b8); c.linso2.rt100b8s=std(c.linso2.rt100b8);
c.linso2.rt100b10m=nanmean(c.linso2.rt100b10); c.linso2.rt100b10s=std(c.linso2.rt100b10);
c.linso2.rt50b2m=nanmean(c.linso2.rt50b2); c.linso2.rt50b2s=std(c.linso2.rt50b2);
c.linso2.rt50b4m=nanmean(c.linso2.rt50b4); c.linso2.rt50b4s=std(c.linso2.rt50b4);
c.linso2.rt50b6m=nanmean(c.linso2.rt50b6); c.linso2.rt50b6s=std(c.linso2.rt50b6);
c.linso2.rt50b8m=nanmean(c.linso2.rt50b8); c.linso2.rt50b8s=std(c.linso2.rt50b8);
c.linso2.rt50b10m=nanmean(c.linso2.rt50b10); c.linso2.rt50b10s=std(c.linso2.rt50b10);
 
c.outso4.rt100b2m=nanmean(c.outso4.rt100b2); c.outso4.rt100b2s=std(c.outso4.rt100b2);
c.outso4.rt100b4m=nanmean(c.outso4.rt100b4); c.outso4.rt100b4s=std(c.outso4.rt100b4);
c.outso4.rt100b6m=nanmean(c.outso4.rt100b6); c.outso4.rt100b6s=std(c.outso4.rt100b6);
c.outso4.rt100b8m=nanmean(c.outso4.rt100b8); c.outso4.rt100b8s=std(c.outso4.rt100b8);
c.outso4.rt100b10m=nanmean(c.outso4.rt100b10); c.outso4.rt100b10s=std(c.outso4.rt100b10);
c.outso4.rt50b2m=nanmean(c.outso4.rt50b2); c.outso4.rt50b2s=std(c.outso4.rt50b2);
c.outso4.rt50b4m=nanmean(c.outso4.rt50b4); c.outso4.rt50b4s=std(c.outso4.rt50b4);
c.outso4.rt50b6m=nanmean(c.outso4.rt50b6); c.outso4.rt50b6s=std(c.outso4.rt50b6);
c.outso4.rt50b8m=nanmean(c.outso4.rt50b8); c.outso4.rt50b8s=std(c.outso4.rt50b8);
c.outso4.rt50b10m=nanmean(c.outso4.rt50b10); c.outso4.rt50b10s=std(c.outso4.rt50b10);
 
c.outso2.rt100b2m=nanmean(c.outso2.rt100b2); c.outso2.rt100b2s=std(c.outso2.rt100b2);
c.outso2.rt100b4m=nanmean(c.outso2.rt100b4); c.outso2.rt100b4s=std(c.outso2.rt100b4);
c.outso2.rt100b6m=nanmean(c.outso2.rt100b6); c.outso2.rt100b6s=std(c.outso2.rt100b6);
c.outso2.rt100b8m=nanmean(c.outso2.rt100b8); c.outso2.rt100b8s=std(c.outso2.rt100b8);
c.outso2.rt100b10m=nanmean(c.outso2.rt100b10); c.outso2.rt100b10s=std(c.outso2.rt100b10);
c.outso2.rt50b2m=nanmean(c.outso2.rt50b2); c.outso2.rt50b2s=std(c.outso2.rt50b2);
c.outso2.rt50b4m=nanmean(c.outso2.rt50b4); c.outso2.rt50b4s=std(c.outso2.rt50b4);
c.outso2.rt50b6m=nanmean(c.outso2.rt50b6); c.outso2.rt50b6s=std(c.outso2.rt50b6);
c.outso2.rt50b8m=nanmean(c.outso2.rt50b8); c.outso2.rt50b8s=std(c.outso2.rt50b8);
c.outso2.rt50b10m=nanmean(c.outso2.rt50b10); c.outso2.rt50b10s=std(c.outso2.rt50b10);

% Figure 3: Effect of Layer/Pressure/Intensity on Response Accuracy
for i=1:length(sub)
    c.linsk4.ra100(i)=sub(i).linsk4.ra100m;
    c.linsk4.ra50(i)=sub(i).linsk4.ra50m;
    
    c.linsk2.ra100(i)=sub(i).linsk2.ra100m;
    c.linsk2.ra50(i)=sub(i).linsk2.ra50m;
    
    c.linso4.ra100(i)=sub(i).linso4.ra100m;
    c.linso4.ra50(i)=sub(i).linso4.ra50m;
    
    c.linso2.ra100(i)=sub(i).linso2.ra100m;
    c.linso2.ra50(i)=sub(i).linso2.ra50m;
    
    c.outso4.ra100(i)=sub(i).outso4.ra100m;
    c.outso4.ra50(i)=sub(i).outso4.ra50m;
    
    c.outso2.ra100(i)=sub(i).outso2.ra100m;
    c.outso2.ra50(i)=sub(i).outso2.ra50m;
end

c.linsk4.ra100m=mean(c.linsk4.ra100); c.linsk4.ra100s=std(c.linsk4.ra100);
c.linsk4.ra50m=mean(c.linsk4.ra50); c.linsk4.ra50s=std(c.linsk4.ra50);

c.linsk2.ra100m=mean(c.linsk2.ra100); c.linsk2.ra100s=std(c.linsk2.ra100);
c.linsk2.ra50m=mean(c.linsk2.ra50); c.linsk2.ra50s=std(c.linsk2.ra50);

c.linso4.ra100m=mean(c.linso4.ra100); c.linso4.ra100s=std(c.linso4.ra100);
c.linso4.ra50m=mean(c.linso4.ra50); c.linso4.ra50s=std(c.linso4.ra50);

c.linso2.ra100m=mean(c.linso2.ra100); c.linso2.ra100s=std(c.linso2.ra100);
c.linso2.ra50m=mean(c.linso2.ra50); c.linso2.ra50s=std(c.linso2.ra50);

c.outso4.ra100m=mean(c.outso4.ra100); c.outso4.ra100s=std(c.outso4.ra100);
c.outso4.ra50m=mean(c.outso4.ra50); c.outso4.ra50s=std(c.outso4.ra50);

c.outso2.ra100m=mean(c.outso2.ra100); c.outso2.ra100s=std(c.outso2.ra100);
c.outso2.ra50m=mean(c.outso2.ra50); c.outso2.ra50s=std(c.outso2.ra50);

% Figure 4: Effect of Distance on Response Accuracy (two vibrations)
for i=1:length(sub)
    c.linsk4.ra100b2(i)=sum(sub(i).linsk4.ra([5 10]));
    c.linsk4.ra100b4(i)=sum(sub(i).linsk4.ra([6 11]));
    c.linsk4.ra100b6(i)=sum(sub(i).linsk4.ra([7 12]));
    c.linsk4.ra100b8(i)=sum(sub(i).linsk4.ra([8 13]));
    c.linsk4.ra100b10(i)=sum(sub(i).linsk4.ra([9 14]));
    c.linsk4.ra50b2(i)=sum(sub(i).linsk4.ra([19 24]));
    c.linsk4.ra50b4(i)=sum(sub(i).linsk4.ra([20 25]));
    c.linsk4.ra50b6(i)=sum(sub(i).linsk4.ra([21 26]));
    c.linsk4.ra50b8(i)=sum(sub(i).linsk4.ra([22 27]));
    c.linsk4.ra50b10(i)=sum(sub(i).linsk4.ra([23 28]));
    
    c.linsk2.ra100b2(i)=sum(sub(i).linsk2.ra([5 10]));
    c.linsk2.ra100b4(i)=sum(sub(i).linsk2.ra([6 11]));
    c.linsk2.ra100b6(i)=sum(sub(i).linsk2.ra([7 12]));
    c.linsk2.ra100b8(i)=sum(sub(i).linsk2.ra([8 13]));
    c.linsk2.ra100b10(i)=sum(sub(i).linsk2.ra([9 14]));
    c.linsk2.ra50b2(i)=sum(sub(i).linsk2.ra([19 24]));
    c.linsk2.ra50b4(i)=sum(sub(i).linsk2.ra([20 25]));
    c.linsk2.ra50b6(i)=sum(sub(i).linsk2.ra([21 26]));
    c.linsk2.ra50b8(i)=sum(sub(i).linsk2.ra([22 27]));
    c.linsk2.ra50b10(i)=sum(sub(i).linsk2.ra([23 28]));
 
    c.linso4.ra100b2(i)=sum(sub(i).linso4.ra([5 10]));
    c.linso4.ra100b4(i)=sum(sub(i).linso4.ra([6 11]));
    c.linso4.ra100b6(i)=sum(sub(i).linso4.ra([7 12]));
    c.linso4.ra100b8(i)=sum(sub(i).linso4.ra([8 13]));
    c.linso4.ra100b10(i)=sum(sub(i).linso4.ra([9 14]));
    c.linso4.ra50b2(i)=sum(sub(i).linso4.ra([19 24]));
    c.linso4.ra50b4(i)=sum(sub(i).linso4.ra([20 25]));
    c.linso4.ra50b6(i)=sum(sub(i).linso4.ra([21 26]));
    c.linso4.ra50b8(i)=sum(sub(i).linso4.ra([22 27]));
    c.linso4.ra50b10(i)=sum(sub(i).linso4.ra([23 28]));
    
    c.linso2.ra100b2(i)=sum(sub(i).linso2.ra([5 10]));
    c.linso2.ra100b4(i)=sum(sub(i).linso2.ra([6 11]));
    c.linso2.ra100b6(i)=sum(sub(i).linso2.ra([7 12]));
    c.linso2.ra100b8(i)=sum(sub(i).linso2.ra([8 13]));
    c.linso2.ra100b10(i)=sum(sub(i).linso2.ra([9 14]));
    c.linso2.ra50b2(i)=sum(sub(i).linso2.ra([19 24]));
    c.linso2.ra50b4(i)=sum(sub(i).linso2.ra([20 25]));
    c.linso2.ra50b6(i)=sum(sub(i).linso2.ra([21 26]));
    c.linso2.ra50b8(i)=sum(sub(i).linso2.ra([22 27]));
    c.linso2.ra50b10(i)=sum(sub(i).linso2.ra([23 28]));
 
    c.outso4.ra100b2(i)=sum(sub(i).outso4.ra([5 10]));
    c.outso4.ra100b4(i)=sum(sub(i).outso4.ra([6 11]));
    c.outso4.ra100b6(i)=sum(sub(i).outso4.ra([7 12]));
    c.outso4.ra100b8(i)=sum(sub(i).outso4.ra([8 13]));
    c.outso4.ra100b10(i)=sum(sub(i).outso4.ra([9 14]));
    c.outso4.ra50b2(i)=sum(sub(i).outso4.ra([19 24]));
    c.outso4.ra50b4(i)=sum(sub(i).outso4.ra([20 25]));
    c.outso4.ra50b6(i)=sum(sub(i).outso4.ra([21 26]));
    c.outso4.ra50b8(i)=sum(sub(i).outso4.ra([22 27]));
    c.outso4.ra50b10(i)=sum(sub(i).outso4.ra([23 28]));
    
    c.outso2.ra100b2(i)=sum(sub(i).outso2.ra([5 10]));
    c.outso2.ra100b4(i)=sum(sub(i).outso2.ra([6 11]));
    c.outso2.ra100b6(i)=sum(sub(i).outso2.ra([7 12]));
    c.outso2.ra100b8(i)=sum(sub(i).outso2.ra([8 13]));
    c.outso2.ra100b10(i)=sum(sub(i).outso2.ra([9 14]));
    c.outso2.ra50b2(i)=sum(sub(i).outso2.ra([19 24]));
    c.outso2.ra50b4(i)=sum(sub(i).outso2.ra([20 25]));
    c.outso2.ra50b6(i)=sum(sub(i).outso2.ra([21 26]));
    c.outso2.ra50b8(i)=sum(sub(i).outso2.ra([22 27]));
    c.outso2.ra50b10(i)=sum(sub(i).outso2.ra([23 28]));
end
 
c.linsk4.ra100b2m=mean(c.linsk4.ra100b2);
c.linsk4.ra100b4m=mean(c.linsk4.ra100b4);
c.linsk4.ra100b6m=mean(c.linsk4.ra100b6);
c.linsk4.ra100b8m=mean(c.linsk4.ra100b8);
c.linsk4.ra100b10m=mean(c.linsk4.ra100b10);
c.linsk4.ra50b2m=mean(c.linsk4.ra50b2);
c.linsk4.ra50b4m=mean(c.linsk4.ra50b4);
c.linsk4.ra50b6m=mean(c.linsk4.ra50b6);
c.linsk4.ra50b8m=mean(c.linsk4.ra50b8);
c.linsk4.ra50b10m=mean(c.linsk4.ra50b10);
 
c.linsk2.ra100b2m=mean(c.linsk2.ra100b2);
c.linsk2.ra100b4m=mean(c.linsk2.ra100b4);
c.linsk2.ra100b6m=mean(c.linsk2.ra100b6);
c.linsk2.ra100b8m=mean(c.linsk2.ra100b8);
c.linsk2.ra100b10m=mean(c.linsk2.ra100b10);
c.linsk2.ra50b2m=mean(c.linsk2.ra50b2);
c.linsk2.ra50b4m=mean(c.linsk2.ra50b4);
c.linsk2.ra50b6m=mean(c.linsk2.ra50b6);
c.linsk2.ra50b8m=mean(c.linsk2.ra50b8);
c.linsk2.ra50b10m=mean(c.linsk2.ra50b10);
 
c.linso4.ra100b2m=mean(c.linso4.ra100b2);
c.linso4.ra100b4m=mean(c.linso4.ra100b4);
c.linso4.ra100b6m=mean(c.linso4.ra100b6);
c.linso4.ra100b8m=mean(c.linso4.ra100b8);
c.linso4.ra100b10m=mean(c.linso4.ra100b10);
c.linso4.ra50b2m=mean(c.linso4.ra50b2);
c.linso4.ra50b4m=mean(c.linso4.ra50b4);
c.linso4.ra50b6m=mean(c.linso4.ra50b6);
c.linso4.ra50b8m=mean(c.linso4.ra50b8);
c.linso4.ra50b10m=mean(c.linso4.ra50b10);
 
c.linso2.ra100b2m=mean(c.linso2.ra100b2);
c.linso2.ra100b4m=mean(c.linso2.ra100b4);
c.linso2.ra100b6m=mean(c.linso2.ra100b6);
c.linso2.ra100b8m=mean(c.linso2.ra100b8);
c.linso2.ra100b10m=mean(c.linso2.ra100b10);
c.linso2.ra50b2m=mean(c.linso2.ra50b2);
c.linso2.ra50b4m=mean(c.linso2.ra50b4);
c.linso2.ra50b6m=mean(c.linso2.ra50b6);
c.linso2.ra50b8m=mean(c.linso2.ra50b8);
c.linso2.ra50b10m=mean(c.linso2.ra50b10);
 
c.outso4.ra100b2m=mean(c.outso4.ra100b2);
c.outso4.ra100b4m=mean(c.outso4.ra100b4);
c.outso4.ra100b6m=mean(c.outso4.ra100b6);
c.outso4.ra100b8m=mean(c.outso4.ra100b8);
c.outso4.ra100b10m=mean(c.outso4.ra100b10);
c.outso4.ra50b2m=mean(c.outso4.ra50b2);
c.outso4.ra50b4m=mean(c.outso4.ra50b4);
c.outso4.ra50b6m=mean(c.outso4.ra50b6);
c.outso4.ra50b8m=mean(c.outso4.ra50b8);
c.outso4.ra50b10m=mean(c.outso4.ra50b10);

c.outso2.ra100b2m=mean(c.outso2.ra100b2);
c.outso2.ra100b4m=mean(c.outso2.ra100b4);
c.outso2.ra100b6m=mean(c.outso2.ra100b6);
c.outso2.ra100b8m=mean(c.outso2.ra100b8);
c.outso2.ra100b10m=mean(c.outso2.ra100b10);
c.outso2.ra50b2m=mean(c.outso2.ra50b2);
c.outso2.ra50b4m=mean(c.outso2.ra50b4);
c.outso2.ra50b6m=mean(c.outso2.ra50b6);
c.outso2.ra50b8m=mean(c.outso2.ra50b8);
c.outso2.ra50b10m=mean(c.outso2.ra50b10);

% Figure 5: Respnse Accuracy In-depth Analysis
c.linsk4.errA=0; c.linsk4.errB=0; c.linsk4.errC=0; c.linsk4.errD=0; c.linsk4.errE=0; c.linsk4.errF=0;
c.linsk2.errA=0; c.linsk2.errB=0; c.linsk2.errC=0; c.linsk2.errD=0; c.linsk2.errE=0; c.linsk2.errF=0;
c.linso4.errA=0; c.linso4.errB=0; c.linso4.errC=0; c.linso4.errD=0; c.linso4.errE=0; c.linso4.errF=0;
c.linso2.errA=0; c.linso2.errB=0; c.linso2.errC=0; c.linso2.errD=0; c.linso2.errE=0; c.linso2.errF=0;
c.outso4.errA=0; c.outso4.errB=0; c.outso4.errC=0; c.outso4.errD=0; c.outso4.errE=0; c.outso4.errF=0;
c.outso2.errA=0; c.outso2.errB=0; c.outso2.errC=0; c.outso2.errD=0; c.outso2.errE=0; c.outso2.errF=0;

for i=1:length(sub)
    c.linsk4.errA=c.linsk4.errA+sub(i).linsk4.errA;
    c.linsk4.errB=c.linsk4.errB+sub(i).linsk4.errB;
    c.linsk4.errC=c.linsk4.errC+sub(i).linsk4.errC;
    c.linsk4.errD=c.linsk4.errD+sub(i).linsk4.errD;
    c.linsk4.errE=c.linsk4.errE+sub(i).linsk4.errE;
    c.linsk4.errF=c.linsk4.errF+sub(i).linsk4.errF;

    c.linsk2.errA=c.linsk2.errA+sub(i).linsk2.errA;
    c.linsk2.errB=c.linsk2.errB+sub(i).linsk2.errB;
    c.linsk2.errC=c.linsk2.errC+sub(i).linsk2.errC;
    c.linsk2.errD=c.linsk2.errD+sub(i).linsk2.errD;
    c.linsk2.errE=c.linsk2.errE+sub(i).linsk2.errE;
    c.linsk2.errF=c.linsk2.errF+sub(i).linsk2.errF;
    
    c.linso4.errA=c.linso4.errA+sub(i).linso4.errA;
    c.linso4.errB=c.linso4.errB+sub(i).linso4.errB;
    c.linso4.errC=c.linso4.errC+sub(i).linso4.errC;
    c.linso4.errD=c.linso4.errD+sub(i).linso4.errD;
    c.linso4.errE=c.linso4.errE+sub(i).linso4.errE;
    c.linso4.errF=c.linso4.errF+sub(i).linso4.errF;
 
    c.linso2.errA=c.linso2.errA+sub(i).linso2.errA;
    c.linso2.errB=c.linso2.errB+sub(i).linso2.errB;
    c.linso2.errC=c.linso2.errC+sub(i).linso2.errC;
    c.linso2.errD=c.linso2.errD+sub(i).linso2.errD;
    c.linso2.errE=c.linso2.errE+sub(i).linso2.errE;
    c.linso2.errF=c.linso2.errF+sub(i).linso2.errF;

    c.outso4.errA=c.outso4.errA+sub(i).outso4.errA;
    c.outso4.errB=c.outso4.errB+sub(i).outso4.errB;
    c.outso4.errC=c.outso4.errC+sub(i).outso4.errC;
    c.outso4.errD=c.outso4.errD+sub(i).outso4.errD;
    c.outso4.errE=c.outso4.errE+sub(i).outso4.errE;
    c.outso4.errF=c.outso4.errF+sub(i).outso4.errF;
 
    c.outso2.errA=c.outso2.errA+sub(i).outso2.errA;
    c.outso2.errB=c.outso2.errB+sub(i).outso2.errB;
    c.outso2.errC=c.outso2.errC+sub(i).outso2.errC;
    c.outso2.errD=c.outso2.errD+sub(i).outso2.errD;
    c.outso2.errE=c.outso2.errE+sub(i).outso2.errE;
    c.outso2.errF=c.outso2.errF+sub(i).outso2.errF;
end

c.err=[c.linsk4.errA+c.linsk2.errA c.linso4.errA+c.linso2.errA c.outso4.errA+c.outso2.errA
       c.linsk4.errB+c.linsk2.errB c.linso4.errB+c.linso2.errB c.outso4.errB+c.outso2.errB
       c.linsk4.errC+c.linsk2.errC c.linso4.errC+c.linso2.errC c.outso4.errC+c.outso2.errC
       c.linsk4.errD+c.linsk2.errD c.linso4.errD+c.linso2.errD c.outso4.errD+c.outso2.errD
       c.linsk4.errE+c.linsk2.errE c.linso4.errE+c.linso2.errE c.outso4.errE+c.outso2.errE
       c.linsk4.errF+c.linsk2.errF c.linso4.errF+c.linso2.errF c.outso4.errF+c.outso2.errF];  

c.errpct(:,1)=round(c.err(:,1)./sum(c.err(:,1))*100);
c.errpct(:,2)=round(c.err(:,2)./sum(c.err(:,2))*100);
c.errpct(:,3)=round(c.err(:,3)./sum(c.err(:,3))*100);

% Figure 6: Effect of Layer/Pressure/Intensity on Locating Error
for i=1:length(sub)
    c.linsk4.le100(i)=sub(i).linsk4.le100m;
    c.linsk4.le50(i)=sub(i).linsk4.le50m;
 
    c.linsk2.le100(i)=sub(i).linsk2.le100m;
    c.linsk2.le50(i)=sub(i).linsk2.le50m;
 
    c.linso4.le100(i)=sub(i).linso4.le100m;
    c.linso4.le50(i)=sub(i).linso4.le50m;
 
    c.linso2.le100(i)=sub(i).linso2.le100m;
    c.linso2.le50(i)=sub(i).linso2.le50m;
    
    c.outso4.le100(i)=sub(i).outso4.le100m;
    c.outso4.le50(i)=sub(i).outso4.le50m;
 
    c.outso2.le100(i)=sub(i).outso2.le100m;
    c.outso2.le50(i)=sub(i).outso2.le50m;   
end

c.linsk4.le100m=mean(c.linsk4.le100); c.linsk4.le100s=std(c.linsk4.le100);
c.linsk4.le50m=mean(c.linsk4.le50); c.linsk4.le50s=std(c.linsk4.le50);

c.linsk2.le100m=mean(c.linsk2.le100); c.linsk2.le100s=std(c.linsk2.le100);
c.linsk2.le50m=mean(c.linsk2.le50); c.linsk2.le50s=std(c.linsk2.le50);

c.linso4.le100m=mean(c.linso4.le100); c.linso4.le100s=std(c.linso4.le100);
c.linso4.le50m=mean(c.linso4.le50); c.linso4.le50s=std(c.linso4.le50);

c.linso2.le100m=mean(c.linso2.le100); c.linso2.le100s=std(c.linso2.le100);
c.linso2.le50m=mean(c.linso2.le50); c.linso2.le50s=std(c.linso2.le50);

c.outso4.le100m=mean(c.outso4.le100); c.outso4.le100s=std(c.outso4.le100);
c.outso4.le50m=mean(c.outso4.le50); c.outso4.le50s=std(c.outso4.le50);

c.outso2.le100m=mean(c.outso2.le100); c.outso2.le100s=std(c.outso2.le100);
c.outso2.le50m=mean(c.outso2.le50); c.outso2.le50s=std(c.outso2.le50);

% Figure 7: Effects of Tactors'' Separation Distance on Locating Error
for i=1:length(sub)
    c.linsk4.le100b2(i)=nanmean(sub(i).linsk4.le([5 10]));
    c.linsk4.le100b4(i)=nanmean(sub(i).linsk4.le([6 11]));
    c.linsk4.le100b6(i)=nanmean(sub(i).linsk4.le([7 12]));
    c.linsk4.le100b8(i)=nanmean(sub(i).linsk4.le([8 13]));
    c.linsk4.le100b10(i)=nanmean(sub(i).linsk4.le([9 14]));
    c.linsk4.le50b2(i)=nanmean(sub(i).linsk4.le([19 24]));
    c.linsk4.le50b4(i)=nanmean(sub(i).linsk4.le([20 25]));
    c.linsk4.le50b6(i)=nanmean(sub(i).linsk4.le([21 26]));
    c.linsk4.le50b8(i)=nanmean(sub(i).linsk4.le([22 27]));
    c.linsk4.le50b10(i)=nanmean(sub(i).linsk4.le([23 28]));
    
    c.linsk2.le100b2(i)=nanmean(sub(i).linsk2.le([5 10]));
    c.linsk2.le100b4(i)=nanmean(sub(i).linsk2.le([6 11]));
    c.linsk2.le100b6(i)=nanmean(sub(i).linsk2.le([7 12]));
    c.linsk2.le100b8(i)=nanmean(sub(i).linsk2.le([8 13]));
    c.linsk2.le100b10(i)=nanmean(sub(i).linsk2.le([9 14]));
    c.linsk2.le50b2(i)=nanmean(sub(i).linsk2.le([19 24]));
    c.linsk2.le50b4(i)=nanmean(sub(i).linsk2.le([20 25]));
    c.linsk2.le50b6(i)=nanmean(sub(i).linsk2.le([21 26]));
    c.linsk2.le50b8(i)=nanmean(sub(i).linsk2.le([22 27]));
    c.linsk2.le50b10(i)=nanmean(sub(i).linsk2.le([23 28]));
 
    c.linso4.le100b2(i)=nanmean(sub(i).linso4.le([5 10]));
    c.linso4.le100b4(i)=nanmean(sub(i).linso4.le([6 11]));
    c.linso4.le100b6(i)=nanmean(sub(i).linso4.le([7 12]));
    c.linso4.le100b8(i)=nanmean(sub(i).linso4.le([8 13]));
    c.linso4.le100b10(i)=nanmean(sub(i).linso4.le([9 14]));
    c.linso4.le50b2(i)=nanmean(sub(i).linso4.le([19 24]));
    c.linso4.le50b4(i)=nanmean(sub(i).linso4.le([20 25]));
    c.linso4.le50b6(i)=nanmean(sub(i).linso4.le([21 26]));
    c.linso4.le50b8(i)=nanmean(sub(i).linso4.le([22 27]));
    c.linso4.le50b10(i)=nanmean(sub(i).linso4.le([23 28]));
    
    c.linso2.le100b2(i)=nanmean(sub(i).linso2.le([5 10]));
    c.linso2.le100b4(i)=nanmean(sub(i).linso2.le([6 11]));
    c.linso2.le100b6(i)=nanmean(sub(i).linso2.le([7 12]));
    c.linso2.le100b8(i)=nanmean(sub(i).linso2.le([8 13]));
    c.linso2.le100b10(i)=nanmean(sub(i).linso2.le([9 14]));
    c.linso2.le50b2(i)=nanmean(sub(i).linso2.le([19 24]));
    c.linso2.le50b4(i)=nanmean(sub(i).linso2.le([20 25]));
    c.linso2.le50b6(i)=nanmean(sub(i).linso2.le([21 26]));
    c.linso2.le50b8(i)=nanmean(sub(i).linso2.le([22 27]));
    c.linso2.le50b10(i)=nanmean(sub(i).linso2.le([23 28]));
 
    c.outso4.le100b2(i)=nanmean(sub(i).outso4.le([5 10]));
    c.outso4.le100b4(i)=nanmean(sub(i).outso4.le([6 11]));
    c.outso4.le100b6(i)=nanmean(sub(i).outso4.le([7 12]));
    c.outso4.le100b8(i)=nanmean(sub(i).outso4.le([8 13]));
    c.outso4.le100b10(i)=nanmean(sub(i).outso4.le([9 14]));
    c.outso4.le50b2(i)=nanmean(sub(i).outso4.le([19 24]));
    c.outso4.le50b4(i)=nanmean(sub(i).outso4.le([20 25]));
    c.outso4.le50b6(i)=nanmean(sub(i).outso4.le([21 26]));
    c.outso4.le50b8(i)=nanmean(sub(i).outso4.le([22 27]));
    c.outso4.le50b10(i)=nanmean(sub(i).outso4.le([23 28]));
    
    c.outso2.le100b2(i)=nanmean(sub(i).outso2.le([5 10]));
    c.outso2.le100b4(i)=nanmean(sub(i).outso2.le([6 11]));
    c.outso2.le100b6(i)=nanmean(sub(i).outso2.le([7 12]));
    c.outso2.le100b8(i)=nanmean(sub(i).outso2.le([8 13]));
    c.outso2.le100b10(i)=nanmean(sub(i).outso2.le([9 14]));
    c.outso2.le50b2(i)=nanmean(sub(i).outso2.le([19 24]));
    c.outso2.le50b4(i)=nanmean(sub(i).outso2.le([20 25]));
    c.outso2.le50b6(i)=nanmean(sub(i).outso2.le([21 26]));
    c.outso2.le50b8(i)=nanmean(sub(i).outso2.le([22 27]));
    c.outso2.le50b10(i)=nanmean(sub(i).outso2.le([23 28]));
end

c.linsk4.le100b2m=nanmean(c.linsk4.le100b2); c.linsk4.le100b2s=std(c.linsk4.le100b2);
c.linsk4.le100b4m=nanmean(c.linsk4.le100b4); c.linsk4.le100b4s=std(c.linsk4.le100b4);
c.linsk4.le100b6m=nanmean(c.linsk4.le100b6); c.linsk4.le100b6s=std(c.linsk4.le100b6);
c.linsk4.le100b8m=nanmean(c.linsk4.le100b8); c.linsk4.le100b8s=std(c.linsk4.le100b8);
c.linsk4.le100b10m=nanmean(c.linsk4.le100b10); c.linsk4.le100b10s=std(c.linsk4.le100b10);
c.linsk4.le50b2m=nanmean(c.linsk4.le50b2); c.linsk4.le50b2s=std(c.linsk4.le50b2);
c.linsk4.le50b4m=nanmean(c.linsk4.le50b4); c.linsk4.le50b4s=std(c.linsk4.le50b4);
c.linsk4.le50b6m=nanmean(c.linsk4.le50b6); c.linsk4.le50b6s=std(c.linsk4.le50b6);
c.linsk4.le50b8m=nanmean(c.linsk4.le50b8); c.linsk4.le50b8s=std(c.linsk4.le50b8);
c.linsk4.le50b10m=nanmean(c.linsk4.le50b10); c.linsk4.le50b10s=std(c.linsk4.le50b10);
 
c.linsk2.le100b2m=nanmean(c.linsk2.le100b2); c.linsk2.le100b2s=std(c.linsk2.le100b2);
c.linsk2.le100b4m=nanmean(c.linsk2.le100b4); c.linsk2.le100b4s=std(c.linsk2.le100b4);
c.linsk2.le100b6m=nanmean(c.linsk2.le100b6); c.linsk2.le100b6s=std(c.linsk2.le100b6);
c.linsk2.le100b8m=nanmean(c.linsk2.le100b8); c.linsk2.le100b8s=std(c.linsk2.le100b8);
c.linsk2.le100b10m=nanmean(c.linsk2.le100b10); c.linsk2.le100b10s=std(c.linsk2.le100b10);
c.linsk2.le50b2m=nanmean(c.linsk2.le50b2); c.linsk2.le50b2s=std(c.linsk2.le50b2);
c.linsk2.le50b4m=nanmean(c.linsk2.le50b4); c.linsk2.le50b4s=std(c.linsk2.le50b4);
c.linsk2.le50b6m=nanmean(c.linsk2.le50b6); c.linsk2.le50b6s=std(c.linsk2.le50b6);
c.linsk2.le50b8m=nanmean(c.linsk2.le50b8); c.linsk2.le50b8s=std(c.linsk2.le50b8);
c.linsk2.le50b10m=nanmean(c.linsk2.le50b10); c.linsk2.le50b10s=std(c.linsk2.le50b10);
 
c.linso4.le100b2m=nanmean(c.linso4.le100b2); c.linso4.le100b2s=std(c.linso4.le100b2);
c.linso4.le100b4m=nanmean(c.linso4.le100b4); c.linso4.le100b4s=std(c.linso4.le100b4);
c.linso4.le100b6m=nanmean(c.linso4.le100b6); c.linso4.le100b6s=std(c.linso4.le100b6);
c.linso4.le100b8m=nanmean(c.linso4.le100b8); c.linso4.le100b8s=std(c.linso4.le100b8);
c.linso4.le100b10m=nanmean(c.linso4.le100b10); c.linso4.le100b10s=std(c.linso4.le100b10);
c.linso4.le50b2m=nanmean(c.linso4.le50b2); c.linso4.le50b2s=std(c.linso4.le50b2);
c.linso4.le50b4m=nanmean(c.linso4.le50b4); c.linso4.le50b4s=std(c.linso4.le50b4);
c.linso4.le50b6m=nanmean(c.linso4.le50b6); c.linso4.le50b6s=std(c.linso4.le50b6);
c.linso4.le50b8m=nanmean(c.linso4.le50b8); c.linso4.le50b8s=std(c.linso4.le50b8);
c.linso4.le50b10m=nanmean(c.linso4.le50b10); c.linso4.le50b10s=std(c.linso4.le50b10);
 
c.linso2.le100b2m=nanmean(c.linso2.le100b2); c.linso2.le100b2s=std(c.linso2.le100b2);
c.linso2.le100b4m=nanmean(c.linso2.le100b4); c.linso2.le100b4s=std(c.linso2.le100b4);
c.linso2.le100b6m=nanmean(c.linso2.le100b6); c.linso2.le100b6s=std(c.linso2.le100b6);
c.linso2.le100b8m=nanmean(c.linso2.le100b8); c.linso2.le100b8s=std(c.linso2.le100b8);
c.linso2.le100b10m=nanmean(c.linso2.le100b10); c.linso2.le100b10s=std(c.linso2.le100b10);
c.linso2.le50b2m=nanmean(c.linso2.le50b2); c.linso2.le50b2s=std(c.linso2.le50b2);
c.linso2.le50b4m=nanmean(c.linso2.le50b4); c.linso2.le50b4s=std(c.linso2.le50b4);
c.linso2.le50b6m=nanmean(c.linso2.le50b6); c.linso2.le50b6s=std(c.linso2.le50b6);
c.linso2.le50b8m=nanmean(c.linso2.le50b8); c.linso2.le50b8s=std(c.linso2.le50b8);
c.linso2.le50b10m=nanmean(c.linso2.le50b10); c.linso2.le50b10s=std(c.linso2.le50b10);
 
c.outso4.le100b2m=nanmean(c.outso4.le100b2); c.outso4.le100b2s=std(c.outso4.le100b2);
c.outso4.le100b4m=nanmean(c.outso4.le100b4); c.outso4.le100b4s=std(c.outso4.le100b4);
c.outso4.le100b6m=nanmean(c.outso4.le100b6); c.outso4.le100b6s=std(c.outso4.le100b6);
c.outso4.le100b8m=nanmean(c.outso4.le100b8); c.outso4.le100b8s=std(c.outso4.le100b8);
c.outso4.le100b10m=nanmean(c.outso4.le100b10); c.outso4.le100b10s=std(c.outso4.le100b10); 
c.outso4.le50b2m=nanmean(c.outso4.le50b2); c.outso4.le50b2s=std(c.outso4.le50b2);
c.outso4.le50b4m=nanmean(c.outso4.le50b4); c.outso4.le50b4s=std(c.outso4.le50b4);
c.outso4.le50b6m=nanmean(c.outso4.le50b6); c.outso4.le50b6s=std(c.outso4.le50b6);
c.outso4.le50b8m=nanmean(c.outso4.le50b8); c.outso4.le50b8s=std(c.outso4.le50b8);
c.outso4.le50b10m=nanmean(c.outso4.le50b10); c.outso4.le50b10s=std(c.outso4.le50b10);
 
c.outso2.le100b2m=nanmean(c.outso2.le100b2); c.outso2.le100b2s=std(c.outso2.le100b2);
c.outso2.le100b4m=nanmean(c.outso2.le100b4); c.outso2.le100b4s=std(c.outso2.le100b4);
c.outso2.le100b6m=nanmean(c.outso2.le100b6); c.outso2.le100b6s=std(c.outso2.le100b6);
c.outso2.le100b8m=nanmean(c.outso2.le100b8); c.outso2.le100b8s=std(c.outso2.le100b8);
c.outso2.le100b10m=nanmean(c.outso2.le100b10); c.outso2.le100b10s=std(c.outso2.le100b10);
c.outso2.le50b2m=nanmean(c.outso2.le50b2); c.outso2.le50b2s=std(c.outso2.le50b2);
c.outso2.le50b4m=nanmean(c.outso2.le50b4); c.outso2.le50b4s=std(c.outso2.le50b4);
c.outso2.le50b6m=nanmean(c.outso2.le50b6); c.outso2.le50b6s=std(c.outso2.le50b6);
c.outso2.le50b8m=nanmean(c.outso2.le50b8); c.outso2.le50b8s=std(c.outso2.le50b8);
c.outso2.le50b10m=nanmean(c.outso2.le50b10); c.outso2.le50b10s=std(c.outso2.le50b10);

% Figure 8: Outcome Measure Interaction Analysis
for i=1:length(sub)
       c.linsk4.rt1(i)=sub(i).linsk4.rt1m;
       c.linsk4.rt0(i)=sub(i).linsk4.rt0m;
       c.linsk2.rt1(i)=sub(i).linsk2.rt1m;
       c.linsk2.rt0(i)=sub(i).linsk2.rt0m;
       c.linso4.rt1(i)=sub(i).linso4.rt1m;
       c.linso4.rt0(i)=sub(i).linso4.rt0m;
       c.linso2.rt1(i)=sub(i).linso2.rt1m;
       c.linso2.rt0(i)=sub(i).linso2.rt0m;
       c.outso4.rt1(i)=sub(i).outso4.rt1m;
       c.outso4.rt0(i)=sub(i).outso4.rt0m;
       c.outso2.rt1(i)=sub(i).outso2.rt1m;
       c.outso2.rt0(i)=sub(i).outso2.rt0m;
end
   
c.comprtra=[mean(horzcat(c.linsk4.rt1,c.linsk2.rt1)) mean(horzcat(c.linsk4.rt0,c.linsk2.rt0))
    mean(horzcat(c.linso4.rt1,c.linso2.rt1)) mean(horzcat(c.linso4.rt0,c.linso2.rt0))
    mean(horzcat(c.outso4.rt1,c.outso2.rt1)) mean(horzcat(c.outso4.rt0,c.outso2.rt0))];

c.comprtras=[std(horzcat(c.linsk4.rt1,c.linsk2.rt1)) std(horzcat(c.linsk4.rt0,c.linsk2.rt0))
    std(horzcat(c.linso4.rt1,c.linso2.rt1)) std(horzcat(c.linso4.rt0,c.linso2.rt0))
    std(horzcat(c.outso4.rt1,c.outso2.rt1)) std(horzcat(c.outso4.rt0,c.outso2.rt0))];

for i=1:length(sub)
c.linsk4.le1a(i)=mean(sub(i).linsk4.le1a);
c.linsk4.le1b(i)=mean(sub(i).linsk4.le1b);
c.linsk4.le1(i)=mean(sub(i).linsk4.le1); 
c.linsk4.le0a(i)=mean(sub(i).linsk4.le0a);
c.linsk4.le0b(i)=mean(sub(i).linsk4.le0b);
c.linsk4.le0(i)=mean(sub(i).linsk4.le0);

c.linsk2.le1a(i)=mean(sub(i).linsk2.le1a);
c.linsk2.le1b(i)=mean(sub(i).linsk2.le1b);
c.linsk2.le1(i)=mean(sub(i).linsk2.le1);
c.linsk2.le0a(i)=mean(sub(i).linsk2.le0a);
c.linsk2.le0b(i)=mean(sub(i).linsk2.le0b);
c.linsk2.le0(i)=mean(sub(i).linsk2.le0);

c.linso4.le1a(i)=mean(sub(i).linso4.le1a);
c.linso4.le1b(i)=mean(sub(i).linso4.le1b);
c.linso4.le1(i)=mean(sub(i).linso4.le1);
c.linso4.le0a(i)=mean(sub(i).linso4.le0a);
c.linso4.le0b(i)=mean(sub(i).linso4.le0b);
c.linso4.le0(i)=mean(sub(i).linso4.le0);

c.linso2.le1a(i)=mean(sub(i).linso2.le1a);
c.linso2.le1b(i)=mean(sub(i).linso2.le1b);
c.linso2.le1(i)=mean(sub(i).linso2.le1);
c.linso2.le0a(i)=mean(sub(i).linso2.le0a);
c.linso2.le0b(i)=mean(sub(i).linso2.le0b);
c.linso2.le0(i)=mean(sub(i).linso2.le0);

c.outso4.le1a(i)=mean(sub(i).outso4.le1a);
c.outso4.le1b(i)=mean(sub(i).outso4.le1b);
c.outso4.le1(i)=mean(sub(i).outso4.le1);
c.outso4.le0a(i)=mean(sub(i).outso4.le0a);
c.outso4.le0b(i)=mean(sub(i).outso4.le0b);
c.outso4.le0(i)=mean(sub(i).outso4.le0);

c.outso2.le1a(i)=mean(sub(i).outso2.le1a);
c.outso2.le1b(i)=mean(sub(i).outso2.le1b);
c.outso2.le1(i)=mean(sub(i).outso2.le1);
c.outso2.le0a(i)=mean(sub(i).outso2.le0a);
c.outso2.le0b(i)=mean(sub(i).outso2.le0b);
c.outso2.le0(i)=mean(sub(i).outso2.le0);
end

c.complera=[nanmean(horzcat(c.linsk4.le1,c.linsk2.le1)) nanmean(horzcat(c.linsk4.le0,c.linsk2.le0))
    nanmean(horzcat(c.linso4.le1,c.linso2.le1)) nanmean(horzcat(c.linso4.le0,c.linso2.le0))
    nanmean(horzcat(c.outso4.le1,c.outso2.le1)) nanmean(horzcat(c.outso4.le0,c.outso2.le0))];

c.compleras=[std(horzcat(c.linsk4.le1,c.linsk2.le1)) std(horzcat(c.linsk4.le0,c.linsk2.le0))
    std(horzcat(c.linso4.le1,c.linso2.le1)) std(horzcat(c.linso4.le0,c.linso2.le0))
    std(horzcat(c.outso4.le1,c.outso2.le1)) std(horzcat(c.outso4.le0,c.outso2.le0))];
 
c.comple=[nanmean(horzcat(c.linsk4.le1a,c.linsk2.le1a)) nanmean(horzcat(c.linsk4.le1b,c.linsk2.le1b)) nanmean(horzcat(c.linsk4.le0a,c.linsk2.le0a)) nanmean(horzcat(c.linsk4.le0b,c.linsk2.le0b))
    nanmean(horzcat(c.linso4.le1a,c.linso2.le1a)) nanmean(horzcat(c.linso4.le1b,c.linso2.le1b)) nanmean(horzcat(c.linso4.le0a,c.linso2.le0a)) nanmean(horzcat(c.linso4.le0b,c.linso2.le0b))
    nanmean(horzcat(c.outso4.le1a,c.outso2.le1a)) nanmean(horzcat(c.outso4.le1b,c.outso2.le1b)) nanmean(horzcat(c.outso4.le0a,c.outso2.le0a)) nanmean(horzcat(c.outso4.le0b,c.outso2.le0b))];
