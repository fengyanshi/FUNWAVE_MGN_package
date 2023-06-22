dep1=load('dep_land0_ny1800mx2400_1014.dat');

cut_y1=1176;
cut_y2=1800;
cut_x1=0;
cut_x2=1792;

base=dep1(1+cut_y1+cut_y2,1+cut_x1:cut_x2);  % 1796x624

save -ASCII base.txt base

% child 1

chd1=load('dep_child1.dat');
msk1=load('mask_child1.dat');

Ccut_y1=1176;
Ccut_y2=1800;
Ccut_x1=0;
Ccut_x2=1792;

child1=chd1(1:1200,801:2000);  %1200x1200, ref: 1300 1350
mask1=msk1(1:1200,801:2000); 

save -ASCII dep_child1.txt child1
save -ASCII mask_child1.txt mask1

