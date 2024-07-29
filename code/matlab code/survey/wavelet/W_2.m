clc
close all
clear all
I=imread('Im (18).jpg');
I=rgb2gray(I);
I = imresize(I, [200 300]);
D=I;D1=I;
s=size(I);


w=10;
k1=ceil((s(1)/w)*(s(2)/w));
B=zeros(w,w,k1);

k=1;

for i=1:w:s(1)
    for j=1:w:s(2)
        B(:,:,k)=I(i:i+w-1,j:j+w-1);
        k=k+1;
    end
end

G=zeros(k1,8);

for i=1:k1
    [cA,cH,cV,cD] = dwt2(B(:,:,i),'db2');
    G(i,1)=mean(mean(cA));
    G(i,2)=std(std(cA));
    G(i,3)=mean(mean(cH));
    G(i,4)=std(std(cH));
    G(i,5)=mean(mean(cV));
    G(i,6)=std(std(cV));
    G(i,7)=mean(mean(cD));
    G(i,8)=std(std(cD));
end
IDX = kmeans(G,2);
%%
s1=size(find(IDX==1));
s2=size(find(IDX==2));
if s1(1)>s2(1)
    a=1;
else
    a=0;
end
k=1;


for i=1:w:s(1)
    for j=1:w:s(2)
        if IDX(k)==1
            if a==1
                D(i:i+w-1,j:j+w-1)=1;
                D1(i:i+w-1,j:j+w-1)=255;
            else
                D(i:i+w-1,j:j+w-1)=0;
                D1(i:i+w-1,j:j+w-1)=0;
            end
        else
            if a==1
                D(i:i+w-1,j:j+w-1)=0;
                D1(i:i+w-1,j:j+w-1)=0;
            else
                D(i:i+w-1,j:j+w-1)=1;
                D1(i:i+w-1,j:j+w-1)=255;
            end
        end
        k=k+1;
    end
end
%%
% IM=manually(102);

subplot(1,2,1), subimage(I)
subplot(1,2,2), subimage(D1)
% subplot(1,3,3), subimage(IM)
level = graythresh(D1);
BW = im2bw(I,level);
BW2 = bwareaopen(BW, 50);
imshow(BW2)
% 
% 
% E=Err(D,IM)
% ODE=Ode(D,IM)
% F=FOM(D,IM)