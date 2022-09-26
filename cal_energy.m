function [kinetic,potential]=cal_energy(velocity,ds)
global ep;global si;global N;global m;
potential=0;kinetic=0;
for i=1:N-1
    for j=i+1:N
        potential=potential+4.*ep*(2.*(si/ds(i,j,1)).^12-(si/ds(i,j,1)).^6);
        potential=potential+4.*ep*(2.*(si/ds(i,j,2)).^12-(si/ds(i,j,2)).^6);
    end
end
for(i=1:N)
    kinetic=kinetic+m./2.*velocity(i,1).^2;
    kinetic=kinetic+m./2.*velocity(i,2).^2;

end
end
