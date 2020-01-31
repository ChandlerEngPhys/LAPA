clear
close all

%Boundary conditions

nx = 20;
ny = 20;
V_new = zeros(nx,ny);
V_old = zeros(nx,ny);
maxiterations = 100;

%Set boundary conditions 1
for x = 1:nx
    V_new(x,1) = 1;
end
%Set boundary conditions 2
for x = 1:nx
    V_new(x,ny)= 1;
end

for iter = 1:maxiterations
    for n=2:1:nx-1
        for m=2:1:ny-1
            V_new(m,n)=(V_old(m+1,n)+V_old(m-1,n)+V_old(m,n+1)+V_old(m,n-1))/4;
        end
    end
    %Free nodes
%     for n=2:1:nx-1
%         V_new(ny,n)=(V_old(m-1,n));
%     end
%     for n=2:1:nx-1
%         V_new(1,n)=(V_old(m-1,n));
%     end
    V_old = V_new;
    %Apply a filter
%      filter = imboxfilt(V_new);
%      V_new=filter;
    %Plot variables
    surf(V_new);
end
[ex,ey]=gradient(V_new);
figure;
surf(-ex,-ey);
figure;
quiver(-ex,-ey);