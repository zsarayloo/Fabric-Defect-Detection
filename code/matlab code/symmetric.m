clc
clear all
close all
format long
I=imread('Im (18).jpg');
I=rgb2gray(I);


imshow(I)
figure
H=imhist(I);
P=zeros(1,256);
for i=1:256
    P(1,i)=H(i,1)/sum(H);
end

MuT=0;
for i=1:256
    MuT=MuT+(i*P(i));
end

B=zeros(256,6);
B(:,1)=1:256;
for i=1:256
    B(i,2)=sum(P(1:i));
    B(i,3)=sum(P(i+1:256));
end
for j=1:256
    for i=1:j
        B(j,4)=B(j,4)+((i*P(i)));
    end
end
B(:,4)=B(:,4)./B(:,2);

for j=1:256
    for i=j+1:256
        B(j,5)=B(j,5)+((i*P(i)));
    end
end
B(:,5)=B(:,5)./B(:,3);

for i=1:256
    B(i,6)=(B(i,2).*((B(i,4))-MuT).^2)+(B(i,3).*((B(i,5))-MuT).^2);
end

R = sortrows(B,6);
N=isnan(R);
for i=256:-1:1
    y=N(i,6);
    if y==0
        T=R(i,1)
        break
    end
end


a=size(I);
for i=1:1:a(1)
    for j=1:1:a(2)
        if I(i,j)>T
            I2(i,j)=255;
        else
            I2(i,j)=0;
        end
    end
end
Me=zeros(size(I2));
[x,y]=size(I2);
for i=2:1:x-1
    for j=2:1:y-1
        %Me(i,j)=(I2(i-1,j-1)+I2(i,j-1)+I2(i+1,j-1)+I2(i-1,j)+I2(i,j)+I2(i+1,j)+I2(i-1,j+1)+I2(i,j+1)+I2(i+1,j+1))/9;
        if ((I2(i-1,j-1)+I2(i,j-1)+I2(i+1,j-1)+I2(i-1,j)+I2(i,j)+I2(i+1,j)+I2(i-1,j+1)+I2(i,j+1)+I2(i+1,j+1)))>=5
            Me(i,j)=255;
        end
    end
end

imshow(Me)
figure

