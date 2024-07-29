%over detection error
%I= image after doing algorithm
% T=ground truth
%ODE=error -> percent of pixel that over detection and 
%not exist in original image
%
function e=ODE(I,tru_I)
t=im2double(rgb2gray(tru_I));
level = graythresh(t);%%threshold by otsu methode
bw = im2bw(t,level);%%binary image
T=bw;
S=size(I)
A=sum((I)&(~T));
B=(S(1)*S(2))-sum(sum(T));%total spot pixel in original image
e=sum(A)/B;%lower detection error(LDE)
end
