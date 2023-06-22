clear all;

%==============
dx(1)=1;     dy(1)=1;
Nghost=4;
fdir_data='../data/';
fdir_work='../work/';
%==============


% base grid -------------------------
grid=load('subgrid_info.txt');
dep{1}=load([fdir_data 'base.txt']);
num_grid = size(grid,1)+1;
[n(1), m(1)]=size(dep{1});
x{1} = 0 : dx(1) : (m(1)-1)*dx(1);
y{1} = 0 : dy(1) : (n(1)-1)*dy(1);
[Xgrid{1}, Ygrid{1}]=meshgrid(x{1},y{1});
%-----------------------------------------

% subgrid ---------------------------
for k=2:num_grid
m(k)=grid(k-1,1);
n(k)=grid(k-1,2);
isk(k)=grid(k-1,3);
trackx(k)=grid(k-1,4);
tracky(k)=grid(k-1,5);

dx(k)=dx(k-1)/isk(k);
dy(k)=dy(k-1)/isk(k);

x{k} = 0 : dx(k) : (m(k)-1)*dx(k);
y{k} = 0 : dy(k) : (n(k)-1)*dy(k);

x{k} = x{k} + x{k-1}(1)+(trackx(k)-Nghost-1)*dx(k-1) + Nghost*dx(k); 
y{k} = y{k} + y{k-1}(1)+(tracky(k)-Nghost-1)*dy(k-1) + Nghost*dy(k);

[Xgrid{k}, Ygrid{k}]=meshgrid(x{k},y{k});
dep{k}=load([fdir_data 'dep_child1.txt']);
end
%----------------------------------------


figure(1)
clf
colormap jet;

hold on
for k=1:num_grid
pcolor(Xgrid{k},Ygrid{k},-dep{k}),shading flat

colorbar

plot( [Xgrid{k}(1,1) Xgrid{k}(1,end) Xgrid{k}(end,end) Xgrid{k}(end,1) Xgrid{k}(1,1)], ...
    [Ygrid{k}(1,1) Ygrid{k}(1,end) Ygrid{k}(end,end) Ygrid{k}(end,1) Ygrid{k}(1,1)], ...
    'k--', 'LineWidth', 2 )

end

box on;
%caxis([-0.5 0.5])


