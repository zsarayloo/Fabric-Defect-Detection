clc
close all
clear all
I=imread('09.jpg');
%I=rgb2gray(I);
I = imresize(I, [200 300]);
hcsc = video.ColorSpaceConverter;
 hcsc.Conversion = 'RGB to intensity';
 hautothresh = video.Autothresholder;
 hdilate = ...
   video.MorphologicalDilate('Neighborhood', ones(5,5));
 x1 = step(hcsc, I);
 x2 = step(hautothresh, x1);
 y = step(hdilate, x2);
 figure;
 subplot(3,1,1),imshow(I); title('Original image');
 subplot(3,1,2),imshow(x2); title('Thresholded Image');
 subplot(3,1,3),imshow(y); title('Dilated Image');
 
 IM=manually(102);
 E=Err(y,IM)