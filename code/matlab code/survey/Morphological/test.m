clc
close all
clear all

kkk=48;
% for oi=1:47
I=imread('Im (18).jpg');
I = rgb2gray(I);
%imshow(I)
J=edge(I);
%figure
%imshow(J)
Ifill = imfill(J,'holes');
%figure, imshow(Ifill)
se = strel('disk', 5);
C= imclose(Ifill,se);
K=bwlabel(C);
S=size(K);
count=zeros(1,max(max(K)));
for k=1:max(max(K))
    for i=1:S(1)
        for j=1:S(2)
            if K(i,j)==k
                count(k)=count(k)+1;
            end
        end
    end
end
t=1:max(max(K));
count=[count;t];
count=count';
D=sortrows(count,1);


for i=1:S(1)
    for j=1:S(2)
        if (K(i,j)==D(end,2))
            C(i,j)=255;
        else
            C(i,j)=0;
        end
    end
end

Ce = imfill(C,'holes');
figure, imshow(Ce)

