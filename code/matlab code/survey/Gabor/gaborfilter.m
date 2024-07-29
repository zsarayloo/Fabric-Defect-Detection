% 
function [G,GABOUT]=gaborfilter(I,S,F,W,P);

if isa(I,'double')~=1
    I=double(I);
end
size=fix(1.5/S); % exp(-1.5^2*pi) < 0.1%
%k=2*pi*S^2;
%F=S^2/sqrt(2*pi);
k=1;
for x=-size:size
    for y=-size:size
        G(size+x+1,size+y+1)=k*exp(-pi*S^2*(x*x+y*y))*...
            (exp(j*(2*pi*F*(x*cos(W)+y*sin(W))+P))-exp(-pi*(F/S)^2+j*P));
    end
end

GABOUT=conv2(I,double(G),'same');
