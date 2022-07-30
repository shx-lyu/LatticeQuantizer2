function [vhat]= quanEm(y)
%   quantizing y over the Z[w] based lattice E_{m}
%   author: shanxianglyu@gmail.com

w=.5+.5*sqrt(-3);i=sqrt(-1);
m=max(size(y)); 
x=zeros(m,1);
for k=1:m
	x(k)=quanZxi(y(k));
end
 
SumFlag=in1wZw(sum(x));%test the domain of sum(x)
if SumFlag==1
    vhat=x;
else    
    if SumFlag==2
        Sflag=0;
    else
        Sflag=1;
    end

    for k=1:m
        r(k)=quanAngle(y(k)-x(k),Sflag);
        IncDis(k)=abs(x(k)+r(k)-y(k))^2 - abs(x(k)-y(k))^2;
    end
    IND=find(IncDis==min(IncDis));%find the shortest incremental distance
    xpi=x;
    xpi(IND(1))=xpi(IND(1))+r(IND(1));%update one element
 
    if m==1 %this case has only xpi and exclude xpi2
        vhat=xpi;
    else
        for k=1:m
            r(k)=quanAngle(y(k)-x(k),1-Sflag);
            IncDis(k)=abs(x(k)+r(k)-y(k))^2 - abs(x(k)-y(k))^2;
        end

        [~,IND]=sort(IncDis);
        xpi2=x;
        xpi2(IND(1))=xpi2(IND(1))+r(IND(1));%update one element
        xpi2(IND(2))=xpi2(IND(2))+r(IND(2));%update another element

        %------------------------------------
         if norm(y-xpi)^2 <= norm(y-xpi2)^2
            vhat=xpi;
         else
            vhat=xpi2;
         end
    end
    
end

end