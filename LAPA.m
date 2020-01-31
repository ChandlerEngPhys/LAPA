clear
clf

%Boundary conditions
LBC = 1;
RBC = 0;

nx = 10;
ny = 10;
V = zeros(nx+1,ny+1);
maxiterations = 5;

for iter = 1:1:maxiterations
    for n=2:1:nx
        for m=2:1:ny
            V(m,n)=(V(m+1,n)+V(m-1,n)+V(m,n+1)+V(m,n-1))/4;
        end
    end
end