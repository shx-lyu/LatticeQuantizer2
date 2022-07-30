function SumFlag=in1wZw(y)
%   test the domain of the input element
%   author: shanxianglyu@gmail.com

%SumFlag=1: y in (1+w)Z[w]
%SumFlag=2: y in (1+w)Z[w]+1
%SumFlag=3: y in (1+w)Z[w]+w

 B1w=[3/2,0;
     sqrt(3)/2,sqrt(3)];
 
 y1=[real(y);imag(y)];
 y2=y1-[1;0];
 y3=y1-[1/2;sqrt(3)/2];
 
c1=inv(B1w)*y1;
c2=inv(B1w)*y2;
c3=inv(B1w)*y3;
 
 if sum(abs(c1-round(c1)))<1e-4 
     SumFlag=1; %in (1+w)Z[w]
 elseif  sum(abs(c2-round(c2)))<1e-4 
     SumFlag=2; %in (1+w)Z[w]+1
 else
     SumFlag=3; %in (1+w)Z[w]+w
 end
 
end