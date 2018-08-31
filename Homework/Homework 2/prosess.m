function [u,t]=prosess(u,t)
    l=length(u);
    L=length(u);
    for i=2:2:(l-2)*2
        u=[u(1:i) u(i:L)];
        L=length(u);
    
    end
    
    lt=length(t);
    Lt=length(t);
    
    for i=2:2:(lt-2)*2
        t=[t(1:i) t(i:Lt)];
        Lt=length(t);
    end
    
    LT=length(t);
    for i=2:LT
        if t(i)==t(i-1)
            t(i)=t(i)+0.33333;
            t(i-1)=t(i-1)-0.33333;
        end
    end
       

