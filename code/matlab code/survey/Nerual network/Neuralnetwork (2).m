clc
close all
clear all
x=0:255;
beta=1.5;alfa=1.6;
P = wblpdf(x,alfa,beta);
plot(x,P)
P=abs(randn(1,50));
parmhat= wblfit(P)
