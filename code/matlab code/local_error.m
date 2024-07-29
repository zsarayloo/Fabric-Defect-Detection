%calculate local error
%I = image extracted 
%T=Ground truth
%e= local error that represent incorrect pixel

function e=local_error(I,tru_I)
t=im2double(rgb2gray(tru_I));
level = graythresh(t);%%threshold by otsu methode
bw = im2bw(t,level);%%binary image
T=bw; 
S=size(I);
B=sum(I&(1-T));
F=sum((1-I)&(T));
e=(sum(B)+sum(F))./((S(1).*S(2)));%local error
end

