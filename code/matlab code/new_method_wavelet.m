%main
clear all
close all
clc

%% preprocessing

I=imread('Im (18).jpg');% read image
% tru_I=imread('Imt (18).jpg');% read ground truth image for calculate error
I1=preprocess(I);% pre processing image
subplot(1,2,1)
imshow(I)
title('Original Image')
subplot(1,2,2)
imshow(I1)
title('Image after preprocessing')

% Otsu
level=graythresh(I1);
I_b=im2bw(I1,level);
figure,
subplot(1,2,1)
imshow(I1)
title('Original Image')
subplot(1,2,2)
imhist(I1)% show histogram of image
title('Histogram of Original Image ')

%% new method
S=size(I1);
pixel=S(1)*S(2);

V=reshape(I1,[1 pixel]);
Coef = cwt(V,1:2,'haar');
V2=Coef(2,:);

new_I=reshape(V2,S);
new_H=imhist(new_I);
T=graythresh(new_H);

I_t=im2bw(I1,T);

% morfological operation

se = strel('disk',2);
cBW = imclose(I_t,se);
cBW=~cBW;
cBW=bwareaopen(cBW,50);
cBW = imclose(cBW,se);

imshow(cBW)

label=bwlabel(cBW);

cluster=max(max(label));
figure,imshow(cBW)
title('image after processing')
if min(min(cBW))==max(max(cBW))
    display('no defect')
else
    display('End processing: ALARM!! defect detection')
end

I=cBW;

% display('Over Detection Error is:')
% overDetection_Error=ODE(I,tru_I)
% 
% display('Local Error is:')
% Local_Error=local_error(I,tru_I)
% 
% display('Lower Detection Error is:')
% LowerDetection_Error=LDE(I,tru_I)
