clear all; clc; close all;

%Name of the file of interest, including directory if not in working
%directory and including file extension
file = 'YourFavoriteSong.mp3'; 

[dat,sampRat] = audioread(file);
% Note: dat(:,1) = left channel
% dat(:,2) = right channel

figL = round(sampRat/4,1);
figH = 100; %100 seemed like a decent number

runtime = length(dat)/sampRat;
t = linspace(0,runtime,length(dat));

%% Filter Data
n = 50; %Number of points in moving avg
filtDat = movmean(dat(:,1),n); %Simple moving avg

%% Plot the Signal
plot(t,filtDat,'k'); %Black is default color
hold on;
set(gcf,'pos',[0 0 figL,figH]); %Set figure width, pixels
set(gca,'visible','off'); %Remove axes
set(gca,'color','none'); %Remove plot background
hold off;

%% Save the current plot to EPS
filename = file(1:end-4);

% Save the plot in BW
print(filename,'-deps'); %Use '-dsvg' for SVG formatted vector line