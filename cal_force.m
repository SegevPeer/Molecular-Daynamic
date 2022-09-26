function [force,ft, ds] = cal_force(location)
global N; global ep; global si
L=100;
f=@(r,x) 24*ep/r^2*(2*(si/r)^12-(si/r)^6)*x;
force=zeros(N,2);
r=zeros(N,N);
ds=zeros(N,N,2);
    for j=1:N %force calculations
         for k=1:N
             for m=1:2
                 if(j~=k)
                     ds(j,k,m)=location(j,m)-location(k,m);
                     if(location(j,m)-location(k,m)>L/2)
                         ds(j,k,m)=location(j,m)-location(k,m)-L;
                     else
                         if(location(j,m)-location(k,m)<-L/2)
                             ds(j,k,m)=location(j,m)-location(k,m)+L;
                         end
                     end
                 end    
             end 
             if(j~=k)
                 r(j,k)=sqrt(ds(j,k,1).^2+ds(j,k,2).^2);
                 force(j,1)=force(j,1)+f(norma(ds(j,k,1),ds(j,k,2)),ds(j,k,1));
                 force(j,2)=force(j,2)+f(norma(ds(j,k,1),ds(j,k,2)),ds(j,k,2));
                 
             end
         end
         ft(j)=sqrt(force(j,1).^2+force(j,2).^2);
    end
end