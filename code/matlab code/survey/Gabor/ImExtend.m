function Ie=ImExtend(I)
q=zeros(768,1536);
for i=1:256
    for j=1:512
        q(i,j)=I(257-i,513-j);
    end
end
for i=257:512
    for j=513:1024
        q(i,j)=I(i-256,j-512);
    end
end
for i=513:768
    for j=1025:1535
        q(i,j)=I(769-i,1537-j);
    end
end
for i=1025:1535
    q(257:512,i)=I(1:256,1536-i);
end
for i=1:512
    q(257:512,i)=I(1:256,513-i);
end
for i=1:256
    q(i,513:1024)=I(257-i,1:512);
end
for i=513:768
    q(i,513:1024)=I(769-i,1:512);
end
for i=513:768
    for j=1:512
        q(i,j)=I(769-i,513-j);
    end
end
for i=1:256
    for j=1025:1536
        q(i,j)=I(257-i,1537-j);
    end
end
Ie=q;
end