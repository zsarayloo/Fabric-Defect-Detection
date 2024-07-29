%lower detection error
%I= image after doing algorithm
% T=ground truth
%LDE=error -> percent of pixel that lower detection and 
% exist in  original image, but not detected after algorithm
%
function e=LDE(I,tru_I)
t=im2double(rgb2gray(tru_I));
level = graythresh(t);%%threshold by otsu methode
bw = im2bw(t,level);%%binary image
T=bw;

A=sum((1-I)&(T));
B=sum(sum(T));%total spot pixel in original image
e=sum(A)/B;%lower detection error(LDE)
end
