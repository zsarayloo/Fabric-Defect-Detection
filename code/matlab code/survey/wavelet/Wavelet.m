F=zeros(200,300);
for i=1:w:s(1)
    for j=1:w:s(2)
        F(i,j)=(D(i,j))-(IM(i,j));
    end
end
imshow(F)