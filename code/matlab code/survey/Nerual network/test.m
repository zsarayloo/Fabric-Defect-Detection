clc
close all
clear all

P=0:.1:10;
S=2:.1:12;
K=[P;S];
T=sin(P).*cos(S);

net = newff(K,T,5);
net.trainParam.epochs = 50;
net = train(net,K,T);

Y = sim(net,K);
plot(P,T,P,Y)