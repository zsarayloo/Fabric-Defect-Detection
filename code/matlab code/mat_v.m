function k=mat_v(I,W,M)
z=0;
for i=1:M
    for j=1:M
        z=z+1;
        a=W(1,z);
        b=W(2,z);
        
        k(i,j)=I(a,b);
    end
end
