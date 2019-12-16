close all
clear all
clc

%% 将视频按帧转换成图片
% v = VideoReader('影流之主（原版）.mp4');
% 
% i = 1;
% while hasFrame(v)
%     video = readFrame(v);
% %     imwrite(video,['.\result\',num2str(i),'.bmp']);
%     imwrite(video,['.\result\',num2str(i,'%03d'),'.bmp']);
% %     imwrite(video,'.\result\1.bmp');
% i = i+1;
% end


%% 开始你的表演！
% % implay('影流之主（原版）.mp4')  % 同时播放原视频，效果不太好

path = '.\result\';%注意文件夹路径的选取，注意该文件夹下需要大量图片，以方便做成动画效果
dir1 = dir([path '*.bmp']);
for i = 1:length(dir1)
    disp(i);
    img = imread([path dir1(i).name]);
    img = rgb2gray(img);
    detection = edge(img,'canny');%算子边缘检测,roberts,sobel,log三种算子的效果都不如canny
    
    set(gcf,'NumberTitle','off','Name','影流之主');
    [x,y] = find(detection ==1);
    scatter(y,-x,'.');%描点
    
    [m,n] = size(img);
    axis([0 n -m 0]); 
    axis equal
    pause(0.02);
end