%% Initialistions and constants
clear();
global L;global N;global dt; global m; global si; global ep;
si=30; ep=1;
t(1)=0;
count=10000;
L=100;N=10;dt=0.002;t=0;velocity=zeros(N,2); m=1000000;
acceleration=zeros(N,2);prev_acceleration=zeros(N,2);
location(:,:)=L*rand(N,2);velocity(:,:)=-30+60*rand(N,2);
kinetic=0;potential=0;
t_kinetic=0;t_potential=0;
x=@(t,v) v*t;
ft=zeros(N);
%% main
while(1)
    [force,ft,ds]=cal_force(location); 
    [kinetic,potential]=cal_energy(velocity,ds);
    if(length(t)==count)
        %plot(t,t_kinetic-t_potential,'-')
        %axis([0 count* ds 0 max(t_kinetic)-max(t_potential)])
        for(i=2:count)
            t(i-1)=t(i);
            t_kinetic(i-1)= t_kinetic(i);
            t_potential(i-1)=t_potential(i);
        end
        t(count)=t(count-1)+dt;
        t_kinetic(count)= kinetic;
        t_potential(count)=potential;
    else
        t(length(t)+1)=t(length(t))+dt;
        t_kinetic(length(t))= kinetic;
        t_potential(length(t))=potential;
        
    end
    
    draw(location,force,ft);
    prev_acceleration=acceleration;
    acceleration=force/m;
    velocity(:,:)= velocity(:,:)+(prev_acceleration(:,:)+acceleration(:,:))*dt/2;
    location(:,:)=location(:,:)+x(dt,velocity(:,:)); %advance in location
    for j=1:N %periodic boundary conditions
        for k=1:2
            while(location(j,k)>L)
                location(j,k)=location(j,k)-L;
            end
            while(location(j,k)<0)
                location(j,k)=location(j,k)+L;
            end
        end
    end   
end
%%