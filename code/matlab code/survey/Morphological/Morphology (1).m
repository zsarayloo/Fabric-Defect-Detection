clc
close all
clear all
I=imread('Im (18).jpg');
I=rgb2gray(I);
 I = imresize(I, [200 300]);
E=edge(I);
hclosing = video.MorphologicalClose;
 hclosing.Neighborhood = strel('disk', 5);
 closed = step(hclosing, E);
 subplot(1,2,1),imshow(E); title('Original image');
 subplot(1,2,2),imshow(closed); title('Closed image');