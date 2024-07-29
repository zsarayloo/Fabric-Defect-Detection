function  W=window(C,N)
k=0;

for i=C(1,1)-N:C(1,1)+N
    for j=C(1,2)-N:C(1,2)+N
        k=k+1;
        W(:,k)=[i;j];
    end
end


