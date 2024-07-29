clc
close all
clear all
I=imread('Im (18).jpg');
I=rgb2gray(I);
I = imresize(I, [200 300]);
D=I;D1=I;
s=size(I);

w=2;
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
KK1=zeros(15000,1);
KK1(:,:)=1;

I=imread('11.jpg');
I=rgb2gray(I);
I = imresize(I, [200 300]);
D=I;D1=I;
s=size(I);

w=2;
k1=ceil((s(1)/w)*(s(2)/w));
B=zeros(w,w,k1);

k=1;

for i=1:w:s(1)
    for j=1:w:s(2)
        B(:,:,k)=I(i:i+w-1,j:j+w-1);
        k=k+1;
    end
end

G1=zeros(k1,8);

for i=1:k1
    [cA,cH,cV,cD] = dwt2(B(:,:,i),'db2');
    G1(i,1)=mean(mean(cA));
    G1(i,2)=std(std(cA));
    G1(i,3)=mean(mean(cH));
    G1(i,4)=std(std(cH));
    G1(i,5)=mean(mean(cV));
    G1(i,6)=std(std(cV));
    G1(i,7)=mean(mean(cD));
    G1(i,8)=std(std(cD));
end
T=[G;G1];
KK2=zeros(15000,1);
KK2(:,:)=2;
KK=[KK1 ;KK2];

T=T';
KK=KK';

%%



net = newff(T,KK,8);
net.trainParam.epochs = 50;
net = train(net,T,KK);

%%
I=imread('09.jpg');
I=rgb2gray(I);
I = imresize(I, [200 300]);
D=I;D1=I;
s=size(I);

w=2;
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
G=G';
Y = sim(net,G);
IDX=I;
for i=1:k1
    if Y(i)>1.5
        IDX(i)=2;
    else
        IDX(i)=1;
    end
end
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
%IM=manually(102);

subplot(1,2,1), subimage(I)
subplot(1,2,2), subimage(D1)
% subplot(1,3,3), subimage(IM)
% 
% 
% E=Err(D,IM)

