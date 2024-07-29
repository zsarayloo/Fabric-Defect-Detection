function H=generate_patch(I,R,C)
% Genearate patch with R rows and C column
% H output cell 
%
S=size(I);
k1=ceil(S(1)/R);
k2=ceil(S(2)/C);

new_r=R*k1;
new_c=C*k2;
I=imresize(I,[new_r new_c]);
Blkr=R.*ones(1,k1);
Blkc=C.*ones(1,k2);
H=mat2cell(I,Blkr,Blkc);


        