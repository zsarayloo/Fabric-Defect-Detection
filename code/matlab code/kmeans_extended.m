%kmeans clustering
function B= kmeans_extended(H,CO)


[a,b]=size(H);
c=2;
X=zeros(a*b,c);

x1=reshape(H,[a*b,1]);
x2=reshape(CO,[a*b,1]);
X(:,1)=x1;
X(:,2)=x2;

[IDX,~] = kmeans(X,2,'distance','city','emptyaction','singleton','onlinephase','on','start','sample');

new_I=reshape(IDX,[a,b]);
 for i=1:a
     for j=1:b
         temp=new_I(i,j);
         if temp==2
             new_I(i,j)=0;
         else
             new_I(i,j)=1;
         end
     end
 end
        
L=graythresh(new_I);
B=im2bw(new_I,L);
label=bwlabel(B);
k_1=find(label==0);
k1=length(k_1);
k_2=find(label==1);
k2=length(k_2);
M=imread('margine.jpg');
M=rgb2gray(M);
L=graythresh(M);
M=im2bw(M,L);
if (k2>k1)
    B=~B;
    B=B.*M;
else
   
    B=B.*M;
end
se = strel('disk',4);
B = imopen(B,se);
