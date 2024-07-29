function f=homogenity_v(val,C,w)
vector=[w(1,1)-C(1,1),w(1,2)-C(1,2)];
norm_vector=norm(vector);
f=(val./norm_vector).*(vector);


