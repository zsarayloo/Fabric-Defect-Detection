function [IO T]=Otsu(I)
    HK=round(I);
    histo=zeros(256,1);
    for i=1:256
        [row,col,v] = find(HK==i);
        if row>0
            histo(i)=row(1);
        end
    end
    I=HK;
    H=histo;
    P=zeros(1,256);
    for i=1:256
        P(1,i)=H(i,1)/sum(H);
    end

    MuT=0;
    for i=1:256
        MuT=MuT+((i-1)*P(i));
    end

    B=zeros(256,6);
    B(:,1)=1:256;
    for i=1:256
        B(i,2)=sum(P(1:i));
        B(i,3)=sum(P(i+1:256));
    end
    for j=1:256
        for i=1:j
            B(j,4)=B(j,4)+(((i-1)*P(i)));
        end
    end
    B(:,4)=B(:,4)./B(:,2);

    for j=1:256
        for i=j+1:256
            B(j,5)=B(j,5)+(((i-1)*P(i)));
        end
    end
    B(:,5)=B(:,5)./B(:,3);

    for i=1:256
        B(i,6)=(B(i,2).*((B(i,4))-MuT).^2)+(B(i,3).*((B(i,5))-MuT).^2);
    end

    R = sortrows(B,6);
    N=isnan(R);
    for i=256:-1:1
        y=N(i,6);
        if y==0
            T_O=R(i,1)
            break
        end
    end


    a=size(I);
    for i=1:1:a(1)
        for j=1:1:a(2)
            if I(i,j)>T_O
                I2(i,j)=255;
            else
                I2(i,j)=0;
            end
        end
    end
    IO=I2;
    T=T_O;
end