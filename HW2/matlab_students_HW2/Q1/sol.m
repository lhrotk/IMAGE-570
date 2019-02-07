clear all; close all;
load('flujet','X','map');
for i=1:8
    map(i, 3)=0;
end
imagesc(X);colormap(map);
axis off