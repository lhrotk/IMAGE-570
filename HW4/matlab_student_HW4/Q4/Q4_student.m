%EECE 570- RAFEEF GARBI 
%Assignment 4
%Question_4 Student File

close all; clear all

RGB = imread('rectangles_paintings.png'); 
imshow(RGB);


I = rgb2gray(RGB);

I = imgaussfilt(I,0.5);%smooth
bw = imbinarize(I);%binary image
figure;
imshow(bw)


bw = bwareaopen(bw,30);%remove small objects

se = strel('disk',2);
bw = imclose(bw,se);
bw = imfill(bw,'holes');

figure;
imshow(bw)

[B,L] = bwboundaries(bw,'noholes');

imshow(label2rgb(L, @jet, [.5 .5 .5]))
hold on

for k = 1:length(B)
  boundary = B{k};
  plot(boundary(:,2), boundary(:,1), 'w', 'LineWidth', 2)
end


stats = regionprops(L,'Area','Centroid');

threshold = 0.93;

% loop over the boundaries
for k = 1:length(B)

  boundary = B{k};

  
  b = minBoundingBox(boundary');
  
  w = sqrt((b(1,1)-b(1,2))^2+(b(2,1)-b(2,2))^2)+1;
  h = sqrt((b(1,1)-b(1,4))^2+(b(2,4)-b(2,1))^2)+1;
  
  area = stats(k).Area;
  
  % compute the roundness metric
  metric = area/(w*h);

  % display the results
  metric_string = sprintf('%2.2f',metric);

  % mark objects above the threshold with a black circle
  if metric > threshold
    centroid = stats(k).Centroid;
    plot(centroid(1),centroid(2),'ko');
  end
  
  text(boundary(1,2)-35,boundary(1,1)+13,metric_string,'Color','y',...
       'FontSize',14,'FontWeight','bold');
  
end

title(['Metrics closer to 1 indicate that ',...
       'the object is approximately rectangle']);
   
   