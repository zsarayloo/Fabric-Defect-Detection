function ODError=Ode(D,IM)
    ct=sum(sum(D));
    cs=sum(sum(IM));
    s=size(D);
    cts=0;
    for i=1:1:s(1)
        for j=1:1:s(2)
            if D(i,j)==1
                if IM(i,j)==0
                    cts=cts+1;
                end
            end
        end
    end
    ODError=cts/(abs(cs-ct));
end