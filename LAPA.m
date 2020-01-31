clear
close all

%Boundary conditions

nx = 20;
ny = 20;
V = zeros(nx,ny);
maxiterations = 10;

%Set boundary conditions 1
for x = 1:nx
    V(x,1) = 1;
end
%Set boundary conditions 2
for x = 1:nx
    V(x,ny)= 1;
end

for iter = 1:maxiterations
    for n=2:1:nx-1
        for m=2:1:ny-1
            V(m,n)=(V(m+1,n)+V(m-1,n)+V(m,n+1)+V(m,n-1))/4;
        end
    end
    %Apply a filter
%     filter = imboxfilt(V);
%     V=filter;
    %Plot variables
    imagesc(V);
end
[ex,ey]=gradient(V);
figure;
surf(-ex,-ey);
figure;
quiver(-ex,-ey);