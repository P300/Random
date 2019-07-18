%? how to add lable after using xaxis off
%read files
% *** needs edit
A=dlmread('error.txt');
B=dlmread('correct.txt');
C=dlmread('error1.txt');
D=dlmread();
ChanA=A(:,[6 7 8])%selected channels/montage ***
ChanB=B(:,[6 7 8])
ChanC=B(:,[62 63])
ChanD=B(:,[62 63])
MA=mean(ChanA,2)% average selected channels/montage 
MB=mean(ChanB,2)
MC=mean(ChanC,2)
MD=mean(ChanC,2)
xvalue=[-196:4:600]%x axis range: time window ***
xvalue1=xvalue'; %transpose
cc=[xvalue1 MA(:,:) MB(:,:) MC(:,:) MD(:,:)]% combine all columns into one file

%ploting
set(gca, 'box', 'off')
hold on
plot(cc(:,1),cc(:,2),'--b','LineWidth',2)%condintion1
plot(cc(:,1),cc(:,3),'b','LineWidth',2)%condintion2
plot(cc(:,1),cc(:,4),'--k','LineWidth',2)
plot(cc(:,1),cc(:,5),'k','LineWidth',2)
% xlabel('ms') 
% ylabel('µV')
%use "insert" to add x label.
annotation(figure1,'textbox',...
    [0.825999999999998 0.723809523809528 0.0632857142857149 0.0571428571428572],...
    'String',{'ms'},...
    'FitBoxToText','off',...
    'EdgeColor','none');

h = gca; h.XAxis.Visible = 'off';%remove xaxis and label, this removes the lable since it's children to this axis
h = gca; h.YAxis.Visible = 'off';%remove yaxis and label
% set(gca,'Visible','off')
drawaxis(gca, 'x', 0, 'movelabel', 1)% add drawasix.m. https://www.mathworks.com/matlabcentral/answers/100506-how-do-i-move-the-x-axis-so-that-it-always-intercepts-the-y-axis-at-y-0-on-a-two-dimensional-plot
drawaxis(gca, 'y', 0, 'movelabel', 1)
% plot(xvalue1,cc(:,63),'kd')
title('My Title')
xlabel('ms') 
ylabel('µV')

legend ({'correct','error','error1'},'Location','northeast')
ax = gca;
% ax.XColor = 'red'%xasis color
ax.FontSize = 15;
% figure background color to blue
% fig = gcf;
% fig.Color = [[0 0.6 0.8]];

%subplot
% subplot(2,1,1)
% plot(x,y1,'--r','LineWidth',2)
% subplot(2,1,2)
% plot(x,y2,'b','LineWidth',2)

% b     blue
% g     green
% r     red
% c     cyan
% m     magenta
% y     yellow
% k     black
% w     white
