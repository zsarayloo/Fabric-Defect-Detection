
%main- new method2
clear all
close all
clc

%% preprocessing

I=imread('Im (2).jpg');% read image
tru_I=imread('Imt (2).jpg');% read ground truth image for calculate error
I1=preprocess(I);
subplot(1,2,1)
imshow(I)
title('Original Image')
subplot(1,2,2)
imshow(I1)
title('Image after preprocessing')

%% Homogenity and Correlation Image
mask=25;%mask size


[H CO]=Generate_HIm(I1,mask);

% normalization
H_min=min(min(H));
H_max=max(max(H));
H_normal=(H-H_min)./(H_max-H_min);

CO_min=min(min(CO));
CO_max=max(max(CO));
CO_normal=(CO-CO_min)./(CO_max-CO_min);

figure, 
subplot(3,1,1)
imshow(I1)
title('Original Image')
subplot(3,1,2)
imshow(H_normal)
title('Homogeneity Image')
subplot(3,1,3)
imshow(CO)
title('correlation Image')

B= kmeans_extended(H,CO)

label=bwlabel(B);

cluster=max(max(label));
figure,imshow(B)
title('image after processing')
if min(min(B))==max(max(B))
    display('no defect')
else
    display('End processing: ALARM!! defect detection')
end

I=B;

display('Over Detection Error is:')
overDetection_Error=ODE(I,tru_I)

display('Local Error is:')
Local_Error=local_error(I,tru_I)

display('Lower Detection Error is:')
LowerDetection_Error=LDE(I,tru_I)






