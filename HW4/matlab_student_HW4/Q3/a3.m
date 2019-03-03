I = imread('rice.png');
level = graythresh(I);
BW = imbinarize(I,level);
%b
se = strel('disk',15);
Io = imopen(I,se);
%c
Io = I-Io;
%d
Io = imadjust(Io);
%e
level = graythresh(Io);
BW_e = imbinarize(Io,level);
se = strel('disk',1);
BW_e = imopen(BW_e, se);
subplot(2,1,1);imshow(BW);title('original');
subplot(2,1,2);imshow(BW_e);title('substract opening');
r = regionprops(BW_e);
areas = zeros(size(r));
for i=1:size(r)
    areas(i) = r(i).Area;
end
Max = max(areas(:));
Min = min(areas(:));
figure;
histogram(areas);