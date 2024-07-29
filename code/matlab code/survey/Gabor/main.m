clc
close all
clear all
kkk=48;
% for oi=1:47
I=imread('Im (18).jpg');
I = rgb2gray(I);
I = imresize(I, [256 512]);
Ec=I;
%imshow(I); 
% IM=manually(91,I);
%%  
I2=ImExtend(I);
m=size(I2,1);
n=size(I2,2);
%% Gabor
phi = 7*pi/8;
theta = 2;
sigma = 0.65*theta; 
filterSize = 6; 
G =zeros(filterSize);
for i=0:filterSize-1:filterSize 
    for j=0:filterSize:filterSize
        xprime= j*cos(phi);  
        yprime= i*sin(phi);   
        K = exp(2*pi*theta*sqrt(-1)*(xprime+ yprime)); 
        G(round((i+1)*filterSize),round((j+1)*filterSize)) = exp(-(i^2+j^2)/(sigma^2))*K;
    end
end
%% Convolve
U = conv2(I2,G);
J=U(256:511,512:1023);
%figure
HK=real(J);

%R=imshow(real(J),[]);
HK=round(HK);
histo=zeros(256,1);
for i=1:256
    [row,col,v] = find(HK==i);
    if row>0
        histo(i)=row(1);
    end
end
PP=imhist(real(J));
%%
[IO T]=Otsu(HK);



h=figure;
subplot(1,2,1), subimage(I)
subplot(1,2,2), subimage(IO)
%subplot(1,3,3), subimage(IM)

% saveas(h,num2str(kkk),'jpg')
% kkk=kkk+1;
% close all
% % end