function r= quanZxi(x,D)
%   quantizing a complex number to rings of imaginary quadratic fields
%   parameters: input: x in \C; ring parameter: D; (e.g., D=3 for Eisenstein; D=1 for Gaussian)
%               output: quantized element r in a ring ZZ
%   written by Shanxiang Lyu (shanxianglyu@gmail.com), Jinan University
%   Last updated on July 2021

if nargin==1
    D=3;
end

if mod(-D,4)==1 %%TYPE II
    
    r1=round(real(x))+sqrt(-D)*round(imag(x)/sqrt(D));
    s=.5+.5*sqrt(-D);
 
    r2=round(real(x-.5))+sqrt(-D)*round(imag(x-.5*sqrt(-D))/sqrt(D))+s;
    
    if abs(x-r1)<abs(x-r2)
        r=r1;
    else
        r=r2;
    end
else %% TYPE I
    r=round(real(x))+sqrt(-D)*round(imag(x)/sqrt(D));
end
