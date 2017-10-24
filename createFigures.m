% This MATLAB script creates plots of outcome measures vs. vibratory motor configuration variables using results from all subjects

% Summary of plots
% Figure 1: Effect of Layer/Pressure/Intensity on Response Time
% Figure 2: Effect of Tactors'' Separation Distance on Response Time
% Figure 3: Effect of Layer/Pressure/Intensity on Response Accuracy
% Figure 4: Effect of Distance on Response Accuracy (two vibrations)
% Figure 5: Response Accuracy In-depth Analysis
% Figure 6: Effect of Layer/Pressure/Intensity on Locating Error
% Figure 7: Effects of Tactors'' Separation Distance on Locating Error
% Figure 8: Locating Error in-depth Analysis
% Figure 9: Outcome Measure Interaction Analysis

% Summary of dependent and independent variables:
% vibratory motor configuration variables (independent): 
% a) vibratory intensity (100%, 50%)
% b) distance between tactors (2cm, 4cm, 6cm, 8cm, 10cm)
% c) layer of placement (liner/skin, liner/socket, outer socket)
% d) prosthetic pressure (4kPa, 2kPa)
% outcome measures (dependent):
% a) response time
% b) response accuracy
% c) locating error

load('allSubjects.mat');

% Figure 1: Effect of Layer/Pressure/Intensity on Response Time
% intensity levels are 2x100%(n=5), 2x50%(n=5), 1x100%(n=9), 1x50%(n=9)
% one vibration and two sequential vibrations are treated the same
% 24=3(layers)x2(pressure)x4(intensity) bar graphs of average response time
% interested in effect of intensity, pressure, layer on response time (3-way ANOVA)

fig = figure;
fig.Name = 'Effects of Tactor Configuration Variables on Response Time (One Vibration)';
fig.Color = 'w';
fig.Units = 'normalized';
fig.Position = [0.05 0.35 0.9 0.5];

eshift=[-4 -3 -2 -1 1 2 3 4
        -4 -3 -2 -1 1 2 3 4
        -4 -3 -2 -1 1 2 3 4].*0.0125;
        
y = [c.linsk4.rt100x2m c.linsk4.rt100m c.linsk4.rt50x2m c.linsk4.rt50m c.linsk2.rt100x2m c.linsk2.rt100m c.linsk2.rt50x2m c.linsk2.rt50m
    c.linso4.rt100x2m c.linso4.rt100m c.linso4.rt50x2m c.linso4.rt50m c.linso2.rt100x2m c.linso2.rt100m c.linso2.rt50x2m c.linso2.rt50m
    c.outso4.rt100x2m c.outso4.rt100m c.outso4.rt50x2m c.outso4.rt50m c.outso2.rt100x2m c.outso2.rt100m c.outso2.rt50x2m c.outso2.rt50m];
x = [0.700 0.786 0.871 0.957 1.043 1.129 1.214 1.300
    1.700 1.786 1.871 1.957 2.043 2.129 2.214 2.300
    2.700 2.786 2.871 2.957 3.043 3.129 3.214 3.300];
s = [c.linsk4.rt100x2s c.linsk4.rt100s c.linsk4.rt50x2s c.linsk4.rt50s c.linsk2.rt100x2s c.linsk2.rt100s c.linsk2.rt50x2s c.linsk2.rt50s
    c.linso4.rt100x2s c.linso4.rt100s c.linso4.rt50x2s c.linso4.rt50s c.linso2.rt100x2s c.linso2.rt100s c.linso2.rt50x2s c.linso2.rt50s
    c.outso4.rt100x2s c.outso4.rt100s c.outso4.rt50x2s c.outso4.rt50s c.outso2.rt100x2s c.outso2.rt100s c.outso2.rt50x2s c.outso2.rt50s];
b=bar(y,0.7); hold on
b(1).FaceColor = [0 120 213]./256;
b(2).FaceColor = [0 195 227]./256;
b(3).FaceColor = [0 255 255]./256;
b(4).FaceColor = [152 245 255]./256;
b(5).FaceColor = [205 0 0]./256;
b(6).FaceColor = [255 36 0]./256;
b(7).FaceColor = [255 96 0]./256;
b(8).FaceColor = [255 183 16]./256;
errorbar(x+eshift,y,s,'.k','LineWidth',0.75); hold off

ax = gca;
ax.FontSize = 15; 
ax.XLabel.String = 'Layer';
ax.YLabel.String = 'Response Time (s)';
ax.YLim = [0 1];
ax.XTickLabelMode = 'manual';
ax.XTickLabel = {'Liner-Skin';'Liner-Socket';'Outer Socket'};
lgd = legend({'4kPa,double 100%','4kPa,single 100%','4kPa,double 50%','4kPa,single 50%','2kPa,double 100%','2kPa,single 100%','2kPa,double 50%','2kPa,single 50%'},'FontSize',9);
lgd.Position = [0.88 0.494 0.13 0.43];
% title('Effect of Layer/Pressure/Intensity on Response Time','FontSize',16);

sigstar({[0.700-0.05 0.871-0.025],[0.700-0.05 0.957-0.0125],[0.786-0.0375 0.957-0.0125],[0.871-0.025 0.957-0.0125],[1 2],[1 3]},[0.013,0.0014,0.0011,0.006 0.029 0.027]);

saveas(fig,'ResponseTimeA.png');

% Figure 2: Effect of Tactors' Separation Distance on Response Time
% interested in effect of tactor spacing on reaction time

% fig = figure;
% fig.Name = 'Effects of Tactor Configuration Variables on Response Time';
% fig.Color = 'w';
% fig.Units = 'normalized';
% fig.Position = [0.05 0.35 0.9 0.5];
% 
% xshift=0.03309;
% eshift=[-1.5 -0.5 0.5 1.5;-1.5 -0.5 0.5 1.5;-1.5 -0.5 0.5 1.5].*xshift;
% 
% y1 = [c.linsk4.rt100b2m c.linsk4.rt50b2m c.linsk2.rt100b2m c.linsk2.rt50b2m
%     c.linso4.rt100b2m c.linso4.rt50b2m c.linso2.rt100b2m c.linso2.rt50b2m
%     c.outso4.rt100b2m c.outso4.rt50b2m c.outso2.rt100b2m c.outso2.rt50b2m];
% x1 = [0.727 0.909 1.091 1.273;1.727 1.909 2.091 2.273;2.727 2.909 3.091 3.273];
% s1 = [c.linsk4.rt100b2s c.linsk4.rt50b2s c.linsk2.rt100b2s c.linsk2.rt50b2s
%     c.linso4.rt100b2s c.linso4.rt50b2s c.linso2.rt100b2s c.linso2.rt50b2s
%     c.outso4.rt100b2s c.outso4.rt50b2s c.outso2.rt100b2s c.outso2.rt50b2s];
% b = bar(x1,y1); hold on
% b(1).FaceColor = [0 120 213]./256; b(1).BarWidth = 1;
% b(2).FaceColor = [0 195 227]./256; b(2).BarWidth = 1;
% b(3).FaceColor = [205 0 0]./256; b(3).BarWidth = 1;
% b(4).FaceColor = [255 36 0]./256; b(4).BarWidth = 1;
% errorbar(x1+eshift,y1,s1,'.k','LineWidth',0.25);
% 
% y2 = [c.linsk4.rt100b4m c.linsk4.rt50b4m c.linsk2.rt100b4m c.linsk2.rt50b4m
%     c.linso4.rt100b4m c.linso4.rt50b4m c.linso2.rt100b4m c.linso2.rt50b4m
%     c.outso4.rt100b4m c.outso4.rt50b4m c.outso2.rt100b4m c.outso2.rt50b4m];
% x2 = x1+xshift;
% s2 = [c.linsk4.rt100b4s c.linsk4.rt50b4s c.linsk2.rt100b4s c.linsk2.rt50b4s
%     c.linso4.rt100b4s c.linso4.rt50b4s c.linso2.rt100b4s c.linso2.rt50b4s
%     c.outso4.rt100b4s c.outso4.rt50b4s c.outso2.rt100b4s c.outso2.rt50b4s];
% b=bar(x2,y2);
% b(1).FaceColor = [0 120 213]./256; b(1).BarWidth = 1;
% b(2).FaceColor = [0 195 227]./256; b(2).BarWidth = 1;
% b(3).FaceColor = [205 0 0]./256; b(3).BarWidth = 1;
% b(4).FaceColor = [255 36 0]./256; b(4).BarWidth = 1;
% errorbar(x2+eshift,y2,s2,'.k','LineWidth',0.25);
% 
% y3 = [c.linsk4.rt100b6m c.linsk4.rt50b6m c.linsk2.rt100b6m c.linsk2.rt50b6m
%     c.linso4.rt100b6m c.linso4.rt50b6m c.linso2.rt100b6m c.linso2.rt50b6m
%     c.outso4.rt100b6m c.outso4.rt50b6m c.outso2.rt100b6m c.outso2.rt50b6m];
% x3 = x2+xshift;
% s3 = [c.linsk4.rt100b6s c.linsk4.rt50b6s c.linsk2.rt100b6s c.linsk2.rt50b6s
%     c.linso4.rt100b6s c.linso4.rt50b6s c.linso2.rt100b6s c.linso2.rt50b6s
%     c.outso4.rt100b6s c.outso4.rt50b6s c.outso2.rt100b6s c.outso2.rt50b6s];
% b = bar(x3,y3);
% b(1).FaceColor = [0 120 213]./256; b(1).BarWidth = 1;
% b(2).FaceColor = [0 195 227]./256; b(2).BarWidth = 1;
% b(3).FaceColor = [205 0 0]./256; b(3).BarWidth = 1;
% b(4).FaceColor = [255 36 0]./256; b(4).BarWidth = 1;
% errorbar(x3+eshift,y3,s3,'.k','LineWidth',0.25);
% 
% y4 = [c.linsk4.rt100b8m c.linsk4.rt50b8m c.linsk2.rt100b8m c.linsk2.rt50b8m
%     c.linso4.rt100b8m c.linso4.rt50b8m c.linso2.rt100b8m c.linso2.rt50b8m
%     c.outso4.rt100b8m c.outso4.rt50b8m c.outso2.rt100b8m c.outso2.rt50b8m];
% x4 = x3+xshift;
% s4 = [c.linsk4.rt100b8s c.linsk4.rt50b8s c.linsk2.rt100b8s c.linsk2.rt50b8s
%     c.linso4.rt100b8s c.linso4.rt50b8s c.linso2.rt100b8s c.linso2.rt50b8s
%     c.outso4.rt100b8s c.outso4.rt50b8s c.outso2.rt100b8s c.outso2.rt50b8s];
% b = bar(x4,y4);
% b(1).FaceColor = [0 120 213]./256; b(1).BarWidth = 1;
% b(2).FaceColor = [0 195 227]./256; b(2).BarWidth = 1;
% b(3).FaceColor = [205 0 0]./256; b(3).BarWidth = 1;
% b(4).FaceColor = [255 36 0]./256; b(4).BarWidth = 1;
% errorbar(x4+eshift,y4,s4,'.k','LineWidth',0.25);
% 
% y5 = [c.linsk4.rt100b10m c.linsk4.rt50b10m c.linsk2.rt100b10m c.linsk2.rt50b10m
%     c.linso4.rt100b10m c.linso4.rt50b10m c.linso2.rt100b10m c.linso2.rt50b10m
%     c.outso4.rt100b10m c.outso4.rt50b10m c.outso2.rt100b10m c.outso2.rt50b10m];
% x5 = x4+xshift;
% s5 = [c.linsk4.rt100b10s c.linsk4.rt50b10s c.linsk2.rt100b10s c.linsk2.rt50b10s
%     c.linso4.rt100b10s c.linso4.rt50b10s c.linso2.rt100b10s c.linso2.rt50b10s
%     c.outso4.rt100b10s c.outso4.rt50b10s c.outso2.rt100b10s c.outso2.rt50b10s];
% b = bar(x5,y5);
% b(1).FaceColor = [0 120 213]./256; b(1).BarWidth = 1;
% b(2).FaceColor = [0 195 227]./256; b(2).BarWidth = 1;
% b(3).FaceColor = [205 0 0]./256; b(3).BarWidth = 1;
% b(4).FaceColor = [255 36 0]./256; b(4).BarWidth = 1;
% errorbar(x5+eshift,y5,s5,'.k','LineWidth',0.25); hold off
% 
% ax = gca;
% ax.FontSize = 15; 
% ax.XLabel.String = 'Layer';
% ax.YLabel.String = 'Response Time (s)';
% ax.YLim = [0 1];
% ax.XTickLabelMode = 'manual';
% ax.XTick = [1 2 3];
% ax.XTickLabel = {'Liner-Skin';'Liner-Socket';'Outer Socket'};
% 
% lgd = legend({'4kPa,100%','4kPa,50%','2kPa,100%','2kPa,50%'},'Location','northwest','Orientation','vertical','FontSize',11);
% lgd.Position = [0.14 0.68 0.10 0.22];
% title('Effect of Tactors'' Separation Distance on Response Time','FontSize',16);
% text('String','*Five bars in each group represent response time under tactor separation','FontSize',10,'Unit','normalized','Position',[0.15 0.93]);
% text('String','distance of 2cm, 4cm, 6cm, 8cm, 10cm, respectively','FontSize',10,'Unit','normalized','Position',[0.16 0.88]);
% 
% sigstar({[1.091+eshift(9) 1.091+xshift*4+eshift(9)]},0.040);
% 
% saveas(fig,'ResponseTimeB.png');

% Figure 3: Effect of Layer/Pressure/Intensity on Response Accuracy
fig = figure;
fig.Name = 'Effect of Tactor Configuration Variables on Response Accuracy';
fig.Color = 'w';
fig.Units = 'normalized';
fig.Position = [0.05 0.35 0.9 0.5];

y = [c.linsk4.ra100m c.linsk4.ra50m c.linsk2.ra100m c.linsk2.ra50m
    c.linso4.ra100m c.linso4.ra50m c.linso2.ra100m c.linso2.ra50m
    c.outso4.ra100m c.outso4.ra50m c.outso2.ra100m c.outso2.ra50m].*100;
x = [0.727 0.909 1.091 1.273;1.727 1.909 2.091 2.273;2.727 2.909 3.091 3.273];
s = [c.linsk4.ra100s c.linsk4.ra50s c.linsk2.ra100s c.linsk2.ra50s
    c.linso4.ra100s c.linso4.ra50s c.linso2.ra100s c.linso2.ra50s
    c.outso4.ra100s c.outso4.ra50s c.outso2.ra100s c.outso2.ra50s].*100;
b = bar(y); hold on
b(1).FaceColor = [0 120 213]./256;
b(2).FaceColor = [0 195 227]./256;
b(3).FaceColor = [256 96 0]./256;
b(4).FaceColor = [256 183 16]./256;
errorbar(x,y,s,'.k','LineWidth',0.75);

ax = gca;
ax.FontSize = 15; 
ax.XLabel.String = 'Layer';
ax.YLabel.String = 'Response Accuracy (%)';
ax.YLim = [0 100];
ax.XTickLabelMode = 'manual';
ax.XTickLabel = {'Liner-Skin';'Liner-Socket';'Outer Socket'};
lgd = legend({'4kPa,100%','4kPa,50%','2kPa,100%','2kPa,50%'},'Location','southwestoutside','FontSize',10);
lgd.Position = [0.806 0.701 0.10 0.223];
% title('Effect of Layer/Pressure/Intensity on Response Accuracy','FontSize',16);

sigstar({[0.727 0.909],[1 2],[1 3]},[0.017 0.0011 0.0011]);
saveas(fig,'ResponseAccuracyA.png');

% Figure 4: Effect of Distance on Response Accuracy
% fig = figure;
% fig.Name = 'Effects of Tactor Configuration Variables on Response Accuracy';
% fig.Color = 'w';
% fig.Units = 'normalized';
% fig.Position = [0.15 0.5 0.7 0.35];
% % title('Effect of Tactors'' Spacing on Response Accuracy','FontSize',16);
% % text('String','*response accuracy is expressed in percentage','FontSize',12,'Unit','normalized','Position',[0.26 0.96]);
% ax=gca;
% ax.XColor='w';
% ax.YColor='w';
% 
% t = uitable(fig);
% t.Data = round([c.linsk4.ra100b2m c.linsk4.ra100b4m c.linsk4.ra100b6m c.linsk4.ra100b8m c.linsk4.ra100b10m
%     c.linsk4.ra50b2m c.linsk4.ra50b4m c.linsk4.ra50b6m c.linsk4.ra50b8m c.linsk4.ra50b10m
%     c.linsk2.ra100b2m c.linsk2.ra100b4m c.linsk2.ra100b6m c.linsk2.ra100b8m c.linsk2.ra100b10m
%     c.linsk2.ra50b2m c.linsk2.ra50b4m c.linsk2.ra50b6m c.linsk2.ra50b8m c.linsk2.ra50b10m
%     (c.linsk4.ra100b2m+c.linsk4.ra50b2m+c.linsk2.ra100b2m+c.linsk2.ra50b2m)/4 (c.linsk4.ra100b4m+c.linsk4.ra50b4m+c.linsk2.ra100b4m+c.linsk2.ra50b4m)/4 (c.linsk4.ra100b6m+c.linsk4.ra50b6m+c.linsk2.ra100b6m+c.linsk2.ra50b6m)/4 (c.linsk4.ra100b8m+c.linsk4.ra50b8m+c.linsk2.ra100b8m+c.linsk2.ra50b8m)/4 (c.linsk4.ra100b10m+c.linsk4.ra50b10m+c.linsk2.ra100b10m+c.linsk2.ra50b10m)/4].*50);
% t.BackgroundColor = [0 120 213;0 195 227;256 96 0;256 183 16]./256;
% t.RowName = {'4kPa,100%';'4kPa,50%';'2kPa,100%';'2kPa,50%';'Sum'};
% t.ColumnName = {'2cm','4cm','6cm','8cm','10cm'};
% t.FontName = 'Georgia';
% t.FontSize = 15;
% t.FontWeight = 'bold';
% t.Units = 'normalized';
% t.Position(1:2) = [0.02 0.10];
% t.ColumnWidth = {40 40 40 40 40};
% t.Position(3:4) = t.Extent(3:4);
% text('String','Tactors @ Liner-Skin','FontSize',12,'FontWeight','bold','Unit','normalized','Position',[-0.05 0.84]);
% 
% t = uitable(fig);
% t.Data = round([c.linso4.ra100b2m c.linso4.ra100b4m c.linso4.ra100b6m c.linso4.ra100b8m c.linso4.ra100b10m
%     c.linso4.ra50b2m c.linso4.ra50b4m c.linso4.ra50b6m c.linso4.ra50b8m c.linso4.ra50b10m
%     c.linso2.ra100b2m c.linso2.ra100b4m c.linso2.ra100b6m c.linso2.ra100b8m c.linso2.ra100b10m
%     c.linso2.ra50b2m c.linso2.ra50b4m c.linso2.ra50b6m c.linso2.ra50b8m c.linso2.ra50b10m
%     (c.linso4.ra100b2m+c.linso4.ra50b2m+c.linso2.ra100b2m+c.linso2.ra50b2m)/4 (c.linso4.ra100b4m+c.linso4.ra50b4m+c.linso2.ra100b4m+c.linso2.ra50b4m)/4 (c.linso4.ra100b6m+c.linso4.ra50b6m+c.linso2.ra100b6m+c.linso2.ra50b6m)/4 (c.linso4.ra100b8m+c.linso4.ra50b8m+c.linso2.ra100b8m+c.linso2.ra50b8m)/4 (c.linso4.ra100b10m+c.linso4.ra50b10m+c.linso2.ra100b10m+c.linso2.ra50b10m)/4].*50);
% t.BackgroundColor = [0 120 213;0 195 227;256 96 0;256 183 16]./256;
% t.RowName = {'4kPa,100%';'4kPa,50%';'2kPa,100%';'2kPa,50%';'Sum'};
% t.ColumnName = {'2cm','4cm','6cm','8cm','10cm'};
% t.FontName = 'Georgia';
% t.FontSize = 15;
% t.FontWeight = 'bold';
% t.Units = 'normalized';
% t.Position(1:2) = [0.34 0.10];
% t.ColumnWidth = {40 40 40 40 40};
% t.Position(3:4) = t.Extent(3:4);
% text('String','Tactors @ Liner-Socket','FontSize',12,'FontWeight','bold','Unit','normalized','Position',[0.35 0.84]);
% 
% t = uitable(fig);
% t.Data = round([c.outso4.ra100b2m c.outso4.ra100b4m c.outso4.ra100b6m c.outso4.ra100b8m c.outso4.ra100b10m
%     c.outso4.ra50b2m c.outso4.ra50b4m c.outso4.ra50b6m c.outso4.ra50b8m c.outso4.ra50b10m
%     c.outso2.ra100b2m c.outso2.ra100b4m c.outso2.ra100b6m c.outso2.ra100b8m c.outso2.ra100b10m
%     c.outso2.ra50b2m c.outso2.ra50b4m c.outso2.ra50b6m c.outso2.ra50b8m c.outso2.ra50b10m
%     (c.outso4.ra100b2m+c.outso4.ra50b2m+c.outso2.ra100b2m+c.outso2.ra50b2m)/4 (c.outso4.ra100b4m+c.outso4.ra50b4m+c.outso2.ra100b4m+c.outso2.ra50b4m)/4 (c.outso4.ra100b6m+c.outso4.ra50b6m+c.outso2.ra100b6m+c.outso2.ra50b6m)/4 (c.outso4.ra100b8m+c.outso4.ra50b8m+c.outso2.ra100b8m+c.outso2.ra50b8m)/4 (c.outso4.ra100b10m+c.outso4.ra50b10m+c.outso2.ra100b10m+c.outso2.ra50b10m)/4].*50);
% t.BackgroundColor = [0 120 213;0 195 227;256 96 0;256 183 16]./256;
% t.RowName = {'4kPa,100%';'4kPa,50%';'2kPa,100%';'2kPa,50%';'Sum'};
% t.ColumnName = {'2cm','4cm','6cm','8cm','10cm'};
% t.FontName = 'Georgia';
% t.FontSize = 15;
% t.FontWeight = 'bold';
% t.Units = 'normalized';
% t.Position(1:2) = [0.66 0.10];
% t.ColumnWidth = {40 40 40 40 40};
% t.Position(3:4) = t.Extent(3:4);
% text('String','Tactors @ Outer Socket','FontSize',12,'FontWeight','bold','Unit','normalized','Position',[0.75 0.84]);
% 
% saveas(fig,'ResponseAccuracyB.png');

% Figure 5: Breakdown of Incorrect Responses
% Possibly use pie chart instead

fig = figure;
fig.Name = 'Breakdown of Incorrect Responses';
fig.Color = 'w';
fig.Units = 'normalized';
fig.Position = [0.15 0.5 0.45 0.33];
title('Breakdown of Incorrect Responses','FontSize',14);
ax=gca;
ax.XColor='w';
ax.YColor='w';

t = uitable(fig);
t.Data = c.errpct;
t.RowStriping = 'on';
t.RowName = {'One->Two Simultaneous';'One->Two Sequential';'Two Simultaneous->One';'Two Simultaneous->Two Sequential';'Two Sequential->One';'Two Sequential->Two Simultaneous'};
t.ColumnName = {'Liner-Skin','Liner-Socket','Outer Socket'};
t.FontName = 'Time News Roman';
t.FontSize = 15;
t.FontWeight = 'bold';
t.Units = 'normalized';
t.Position(1:2) = [0.02 0.05];
t.ColumnWidth = {75 75 75};
t.Position(3:4) = t.Extent(3:4);

% labels={'One->Two Simultaneous','One->Two Sequential','Two Simultaneous->One','Two Simultaneous->Two Sequential','Two Sequential->One','Two Sequential->Two Simultaneous'};
% ax1=subplot(1,3,1);
% pie(ax1,c.err(:,1),labels);
% title(ax1,'Liner/Skin');
% 
% ax2=subplot(1,3,2);
% pie(ax2,c.err(:,2),labels);
% title(ax2,'Liner/Socket');
% 
% ax3=subplot(1,3,3);
% pie(ax3,c.err(:,3),labels);
% title(ax3,'Outer Socket');

saveas(fig,'ResponseAccuracyC.png');

% Figure 6: Effect of Layer/Pressure/Intensity on Locating Error
fig = figure;
fig.Name = 'Effects of Tactor Configuration Variables on Locating Error';
fig.Color = 'w';
fig.Units = 'normalized';
fig.Position = [0.05 0.35 0.9 0.5];

y = [c.linsk4.le100m c.linsk4.le50m c.linsk2.le100m c.linsk2.le50m;c.linso4.le100m c.linso4.le50m c.linso2.le100m c.linso2.le50m;c.outso4.le100m c.outso4.le50m c.outso2.le100m c.outso2.le50m];
x = [0.727 0.909 1.091 1.273;1.727 1.909 2.091 2.273;2.727 2.909 3.091 3.273];
s = [c.linsk4.le100s c.linsk4.le50s c.linsk2.le100s c.linsk2.le50s;c.linso4.le100s c.linso4.le50s c.linso2.le100s c.linso2.le50s;c.outso4.le100s c.outso4.le50s c.outso2.le100s c.outso2.le50s];
b = bar(y); hold on
b(1).FaceColor = [0 120 213]./256;
b(2).FaceColor = [0 195 227]./256;
b(3).FaceColor = [256 96 0]./256;
b(4).FaceColor = [256 183 16]./256;
errorbar(x,y,s,'.k','LineWidth',0.75); hold off

ax = gca;
ax.FontSize = 15; 
ax.XLabel.String = 'Layer';
ax.YLabel.String = 'Locating Error (cm)';
ax.YLim = [0 10];
ax.XTickLabelMode = 'manual';
ax.XTickLabel = {'Liner-Skin';'Liner-Socket';'Outer Socket'};
lgd = legend({'4kPa,100%','4kPa,50%','2kPa,100%','2kPa,50%'},'Location','northwest','FontSize',11);
lgd.Position = [0.805 0.702 0.10 0.22];
% title('Effect of Layer/Pressure/Intensity on Locating Error','FontSize',16);
sigstar({[0.818 1.182],[1 2],[1 3]},[0.030 0.0011 0.002]);
saveas(fig,'LocatingErrorA.png');

% Figure 7: Effect of Tactors' Separation Distance on Locating Error
% fig = figure;
% fig.Name = 'Effect of Tactors'' Spacing on Locating Error';
% fig.Color = 'w';
% fig.Units = 'normalized';
% fig.Position = [0.05 0.35 0.9 0.5];
% 
% xshift=0.03309;
% eshift=[-1.5 -0.5 0.5 1.5;-1.5 -0.5 0.5 1.5;-1.5 -0.5 0.5 1.5].*xshift;
% 
% y1 = [c.linsk4.le100b2m c.linsk4.le50b2m c.linsk2.le100b2m c.linsk2.le50b2m
%     c.linso4.le100b2m c.linso4.le50b2m c.linso2.le100b2m c.linso2.le50b2m
%     c.outso4.le100b2m c.outso4.le50b2m c.outso2.le100b2m c.outso2.le50b2m];
% x1 = [0.727 0.909 1.091 1.273;1.727 1.909 2.091 2.273;2.727 2.909 3.091 3.273];
% s1 = [c.linsk4.le100b2s c.linsk4.le50b2s c.linsk2.le100b2s c.linsk2.le50b2s
%     c.linso4.le100b2s c.linso4.le50b2s c.linso2.le100b2s c.linso2.le50b2s
%     c.outso4.le100b2s c.outso4.le50b2s c.outso2.le100b2s c.outso2.le50b2s];
% b = bar(x1,y1); hold on
% b(1).FaceColor = [0 120 213]./256; b(1).BarWidth = 1;
% b(2).FaceColor = [0 195 227]./256; b(2).BarWidth = 1;
% b(3).FaceColor = [256 96 0]./256; b(3).BarWidth = 1;
% b(4).FaceColor = [256 183 16]./256; b(4).BarWidth = 1;
% errorbar(x1+eshift,y1,s1,'.k','LineWidth',0.25);
%  
% y2 = [c.linsk4.le100b4m c.linsk4.le50b4m c.linsk2.le100b4m c.linsk2.le50b4m
%     c.linso4.le100b4m c.linso4.le50b4m c.linso2.le100b4m c.linso2.le50b4m
%     c.outso4.le100b4m c.outso4.le50b4m c.outso2.le100b4m c.outso2.le50b4m];
% x2 = x1+xshift;
% s2 = [c.linsk4.le100b4s c.linsk4.le50b4s c.linsk2.le100b4s c.linsk2.le50b4s
%     c.linso4.le100b4s c.linso4.le50b4s c.linso2.le100b4s c.linso2.le50b4s
%     c.outso4.le100b4s c.outso4.le50b4s c.outso2.le100b4s c.outso2.le50b4s];
% b=bar(x2,y2);
% b(1).FaceColor = [0 120 213]./256; b(1).BarWidth = 1;
% b(2).FaceColor = [0 195 227]./256; b(2).BarWidth = 1;
% b(3).FaceColor = [256 96 0]./256; b(3).BarWidth = 1;
% b(4).FaceColor = [256 183 16]./256; b(4).BarWidth = 1;
% errorbar(x2+eshift,y2,s2,'.k','LineWidth',0.25);
%  
% y3 = [c.linsk4.le100b6m c.linsk4.le50b6m c.linsk2.le100b6m c.linsk2.le50b6m
%     c.linso4.le100b6m c.linso4.le50b6m c.linso2.le100b6m c.linso2.le50b6m
%     c.outso4.le100b6m c.outso4.le50b6m c.outso2.le100b6m c.outso2.le50b6m];
% x3 = x2+xshift;
% s3 = [c.linsk4.le100b6s c.linsk4.le50b6s c.linsk2.le100b6s c.linsk2.le50b6s
%     c.linso4.le100b6s c.linso4.le50b6s c.linso2.le100b6s c.linso2.le50b6s
%     c.outso4.le100b6s c.outso4.le50b6s c.outso2.le100b6s c.outso2.le50b6s];
% b = bar(x3,y3);
% b(1).FaceColor = [0 120 213]./256; b(1).BarWidth = 1;
% b(2).FaceColor = [0 195 227]./256; b(2).BarWidth = 1;
% b(3).FaceColor = [256 96 0]./256; b(3).BarWidth = 1;
% b(4).FaceColor = [256 183 16]./256; b(4).BarWidth = 1;
% errorbar(x3+eshift,y3,s3,'.k','LineWidth',0.25);
%  
% y4 = [c.linsk4.le100b8m c.linsk4.le50b8m c.linsk2.le100b8m c.linsk2.le50b8m
%     c.linso4.le100b8m c.linso4.le50b8m c.linso2.le100b8m c.linso2.le50b8m
%     c.outso4.le100b8m c.outso4.le50b8m c.outso2.le100b8m c.outso2.le50b8m];
% x4 = x3+xshift;
% s4 = [c.linsk4.le100b8s c.linsk4.le50b8s c.linsk2.le100b8s c.linsk2.le50b8s
%     c.linso4.le100b8s c.linso4.le50b8s c.linso2.le100b8s c.linso2.le50b8s
%     c.outso4.le100b8s c.outso4.le50b8s c.outso2.le100b8s c.outso2.le50b8s];
% b = bar(x4,y4);
% b(1).FaceColor = [0 120 213]./256; b(1).BarWidth = 1;
% b(2).FaceColor = [0 195 227]./256; b(2).BarWidth = 1;
% b(3).FaceColor = [256 96 0]./256; b(3).BarWidth = 1;
% b(4).FaceColor = [256 183 16]./256; b(4).BarWidth = 1;
% errorbar(x4+eshift,y4,s4,'.k','LineWidth',0.25);
%  
% y5 = [c.linsk4.le100b10m c.linsk4.le50b10m c.linsk2.le100b10m c.linsk2.le50b10m
%     c.linso4.le100b10m c.linso4.le50b10m c.linso2.le100b10m c.linso2.le50b10m
%     c.outso4.le100b10m c.outso4.le50b10m c.outso2.le100b10m c.outso2.le50b10m];
% x5 = x4+xshift;
% s5 = [c.linsk4.le100b10s c.linsk4.le50b10s c.linsk2.le100b10s c.linsk2.le50b10s
%     c.linso4.le100b10s c.linso4.le50b10s c.linso2.le100b10s c.linso2.le50b10s
%     c.outso4.le100b10s c.outso4.le50b10s c.outso2.le100b10s c.outso2.le50b10s];
% b = bar(x5,y5);
% b(1).FaceColor = [0 120 213]./256; b(1).BarWidth = 1;
% b(2).FaceColor = [0 195 227]./256; b(2).BarWidth = 1;
% b(3).FaceColor = [256 96 0]./256; b(3).BarWidth = 1;
% b(4).FaceColor = [256 183 16]./256; b(4).BarWidth = 1;
% errorbar(x5+eshift,y5,s5,'.k','LineWidth',0.25); hold off
% 
% ax = gca;
% ax.FontSize = 15; 
% ax.XLabel.String = 'Tactors'' Prosthetic Layer';
% ax.YLabel.String = 'Locating Error (cm)';
% ax.YLim = [0 10];
% ax.XTickLabelMode = 'manual';
% ax.XTick = [1 2 3];
% ax.XTickLabel = {'Liner-Skin';'Liner-Socket';'Outer Socket'};
% lgd = legend({'4kPa,100%','4kPa,50%','2kPa,100%','2kPa,50%'},'Location','northwest','Orientation','vertical','FontSize',11);
% lgd.Position = [0.14 0.68 0.10 0.22];
% title('Effect of Tactors'' Separation Distance on Locating Error','FontSize',16);
% text('String','*Five bars in each group represent locating error under tactor separation','FontSize',10,'Unit','normalized','Position',[0.15 0.93]);
% text('String','distance of 2cm, 4cm, 6cm, 8cm, 10cm, respectively','FontSize',10,'Unit','normalized','Position',[0.16 0.88]);
% 
% sigstar({[2.091+eshift(8) 2.091+xshift*4+eshift(8)]},0.018);
% 
% saveas(fig,'LocatingErrorB.png');

% Figure 8: Locating Error In-depth Analysis
% Plot: Pie Chart
% Overall weighted percentage of error to each direction
% Splits for liner/skin, liner/socket, outer socket

% Figure 9: Outcome Measure Interaction Analysis
fig = figure;
fig.Name = 'Outcome Measure Interaction Analysis';
fig.Color = 'w';
fig.Units = 'normalized';
fig.Position = [0.05 0.35 1.0 0.5];

subplot(1,2,1);
y = c.comprtra;
b = bar(y,'hist'); hold on
b(1).FaceColor = [18 173 42]./256;
b(2).FaceColor = [205 0 0]./256;
errorbar([0.86 1.14;1.86 2.14;2.86 3.14],y,c.comprtras,'.k','LineWidth',0.25);

ax = gca;
ax.FontSize = 14; 
ax.XLabel.String = 'Layer';
ax.YLabel.String = 'Response Time (s)';
ax.YLim = [0 1];
ax.XTickLabelMode = 'manual';
ax.XTickLabel = {'Liner-Socket';'Liner-Skin';'Outer Socket'};
lgd = legend({'Correct Response','Incorrect Response'},'Location','northwest','FontSize',11);
% lgd.Position = [0.01 0.07 0.09 0.11];
% title('Response Time Splits Between Correct vs. Incorrect Responses','FontSize',14);

subplot(1,2,2);
y = c.complera;
b = bar(y,'hist'); hold on
b(1).FaceColor = [18 173 42]./256;
b(2).FaceColor = [205 0 0]./256;
errorbar([0.86 1.14;1.86 2.14;2.86 3.14],y,c.compleras,'.k','LineWidth',0.25);

ax = gca;
ax.FontSize = 14; 
ax.XLabel.String = 'Layer';
ax.YLabel.String = 'Locating Error (cm)';
ax.YLim = [0 10];
ax.XTickLabelMode = 'manual';
ax.XTickLabel = {'Liner-Socket';'Liner-Skin';'Outer Socket'};
lgd = legend({'Correct Response','Incorrect Response'},'Location','northwest','FontSize',11);
% lgd.Position = [0.01 0.07 0.09 0.11];
% title('Locating Errors Splits Between Correct vs. Incorrect Responses','FontSize',14);

saveas(fig,'OutcomeMeasureSplits.png');
