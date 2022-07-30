%   the main function to test the NSM of the generalized checkerboard
%   lattices based on Z[w]
%   author: shanxianglyu@gmail.com

clc;clear all;
w=.5+sqrt(-3)/2;
 
n=6;%dimension in real domains
m=n/2;%dimension in complex domains
flag=1; % set flag=1 for Em; flag=2 for E_{m,2}^+; flag=3 for E_{m,1+w}^+ 
g=20;h=1e5; %the Monte Carlo run is T=g*h

%----- this block defines Em ---------%
Bc=1*eye(m); 
Bc(m,1:m)=ones(1,m)*w; 
Bc(m,m)=1+w; 

if flag==2
%----- this block defines E_{m,2}^+ ---------%
    Bc(1:m,1)=ones(m,1)*w; Bc(m,1)=m+w; 
    Bc(1:m,1)=Bc(1:m,1)/2; 
end

if flag==3
%----- this block defines E_{m,1+w}^+ ---------%
    Bc(1:m,1)=ones(m,1)*w; Bc(m,1)=m+w; 
    Bc(1:m,1)=Bc(1:m,1)/(1+w);
end
 
% the real-valued basis
B_Psi=[real(Bc),real(Bc)/2-imag(Bc)*sqrt(3)/2
    imag(Bc), imag(Bc)/2+real(Bc)*sqrt(3)/2];


 for k=1:g
    for t=1:h
        xc=rand(m,1)+rand(m,1)*w; 
        di=Bc*xc;
        
        if flag==1
        	r=di-quanEm(di);
        elseif flag==2
        	r=di-quanEmo2(di);
        else
        	r=di-quanEm1pw(di);
        end
        
        FIT(k,t)=1/n*norm(r/(abs(det(B_Psi))^(1/n)))^2;

    end
 end
 
format long
S=mean(FIT,2);

G=mean(S)
std_G=sqrt(var(S)/g)
 

