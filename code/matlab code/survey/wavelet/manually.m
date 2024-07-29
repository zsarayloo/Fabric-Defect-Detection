function I=manually(TM)
    I=imread('Im (18).jpg');
    I = imresize(I, [200 300]);
    I=rgb2gray(I);
    T_M=TM
    a=size(I);
    for i=1:1:a(1)
        for j=1:1:a(2)
            if I(i,j)>T_M
                IM(i,j)=1;
            else
                IM(i,j)=0;
            end
        end
    end
    I=IM;
    figure
    imshow(IM)
    title('Manually')
    
end

