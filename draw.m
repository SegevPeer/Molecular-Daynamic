function []=draw(location,force,ft)
    global L;global N; global si; global ep;  
    hold on
    plot(location(:,1),location(:,2),'o')%show plots and then adds quiver
    axis([0 L 0 L])
    quiver(location(:,1),location(:,2),force(:,1)./abs(ft(:)),force(:,2)./abs(ft(:)),0.2);
    ax = gca;
    ax.Clipping = 'off';     
    pause(0.01)
    clf
end