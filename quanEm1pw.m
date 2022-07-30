function vhat = quanEm1pw(y)
%   quantizing y over the Z[w] based lattice E_{m,1+w}^+
%   author: shanxianglyu@gmail.com
 
m=size(y,1); 
w=.5+.5*sqrt(-3);i=sqrt(-1);

 dither1=ones(m,1)*w;dither1(m,1)=m+w;
 dither1=dither1/(1+w); 
 dither2=w*dither1;
 dither3=(.5-.5*sqrt(-3))*dither1; 
 
 VEC(1:m,1)=quanEm(y);FIT(1)=norm(y-VEC(1:m,1));
 VEC(1:m,2)=quanEm(y-dither1)+dither1;FIT(2)=norm(y-VEC(1:m,2));
 VEC(1:m,3)=quanEm(y-dither2)+dither2;FIT(3)=norm(y-VEC(1:m,3));
 
K=find(FIT==min(FIT));
vhat= VEC(1:m,K(1));
 
 