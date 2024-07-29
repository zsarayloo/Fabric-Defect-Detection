function F=FOM(D,IM);    
    Distanc=0;
    s=size(D);
    for i=1:s(1)
        for j=1:s(2)
            flag=0;
            if D(i,j)==0
                for t=0:min(min(s(2)-j,j),min(s(1)-i,i))
                    if t==0
                        NP=0;
                    else
                        if t==1
                            NP=1;
                        else
                            NP=(((2*t)+1)^2)-(((2*(t-1))+1)^2)-1;
                        end
                    end
                    for m=-NP:NP
                        for n=-NP:NP
                            if D(i,j)==IM(i-m,j-n)
                                Distanc=Distanc+(1/(1+(((m)^2)+((n)^2))));
                                flag=1;
                                break                            
                            end
                        end
                    end
                    if flag==1
                        break
                    end
                end
            end
        end
    end
    F=Distanc/max(sum(sum(D)),sum(sum(IM)));
end
