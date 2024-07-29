function I=manually(TM,J)
    %I = imresize(J, [200 300]);
    %I=rgb2gray(I);
    I=J;
    T_M=TM;
    a=size(I);
    for i=1:1:a(1)
        for j=1:1:a(2)
            if I(i,j)>T_M
                IM(i,j)=0;
            else
                IM(i,j)=1;
            end
        end
    end
    I=IM;
   %figure
    %imshow(IM)
    %title('Manually')
    
end

