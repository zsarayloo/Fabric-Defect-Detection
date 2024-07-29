function [H CO]=Generate_HIm(I1,mask)
S=size(I1);
N=(mask-1)/2;
F=(mask).^2;

I = padarray(I1,[N N]);

for i=1:S(1)
    for j=1:S(2)
        pc=I(i+N,j+N);
        C=[i+N j+N];
        W=window(C,N);%Generate window
        M=mat_v(I,W,mask);
        GLCM=graycomatrix(M,'offset',[0 5; -5 5; -5 0; -5 -5]);
        stats = graycoprops(GLCM,{'homogeneity','correlation'});
        h=stats.Homogeneity;
        c=stats.Correlation;
        CO(i,j)=mean(c);
        H(i,j)=mean(h);

        
    end
end




