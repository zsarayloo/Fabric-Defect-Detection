function E=Err(I_O,IM)
    K=I_O;
    A=sum(sum(IM&K));
    B=sum(sum((1-IM)&(1-K)));
    C=sum(sum(IM))+sum(sum((1-IM)));
    E=1-((A+B)/C);
    E_O=E;
end