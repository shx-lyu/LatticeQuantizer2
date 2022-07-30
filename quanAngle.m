function [rk]= quanAngle(y_x,flag)
%   the element-wise quantizer based on using angles
%	rk= the nearest neighbor of y_x over S1 or S2
%   author: shanxianglyu@gmail.com

    ang_val=angle(y_x); 
    if ang_val< 0
        ang_val=2*pi+ang_val; %angle in (0,2*pi)
    end
    
    if flag==0 %quantization with S1={w^0,w^2,w^4}
        if ang_val>=0 && ang_val<pi*2/3
            ang_ind=pi*1/3;
        elseif ang_val>=pi*2/3 && ang_val<pi*4/3
            ang_ind=pi;
        else
            ang_ind=pi*5/3;
        end
        
    else %flag==1,%quantization with S2={w^1,w^3,w^5}
        if ang_val>=pi*1/3 && ang_val<pi
            ang_ind=pi*2/3;
        elseif ang_val>=pi  && ang_val<pi*5/3
            ang_ind=pi*4/3;
        else
            ang_ind=0;
        end
    
    end
    
    rk=exp(sqrt(-1)*ang_ind);
    