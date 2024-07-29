clc
close all
clear all
I=imread('09.jpg');
I=rgb2gray(I);
I = imresize(I, [200 300]);
i=1;w=10;j=1;
B=I(i:i+w-1,j:j+w-1);
DI=diff(B);
H=imhist(DI);
H=(H/max(H))';