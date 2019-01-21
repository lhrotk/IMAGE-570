E = imread('eight.tif');
E = imgaussfilt(E);
[dy, dx] = gradient(double(E));
M = sqrt(dx.^2+dy.^2);
figure(1);
subplot(1,2,1);imshow(M);
subplot(1,2,2);quiver(dy,dx);
figure(2);
imshow(imbinarize(M,15));
figure(3);
laplace = [0 1 0; 1 -4 1; 0 1 0];
subplot(2,1,1);imshow(imfilter(E, laplace));title('LAPLACE');
gx = [-1 -2 -1; 0 0 0; 1 2 1]
gy = [-1 0 1; -2 0 2; -1 0 1]
Ex = imfilter(E, gx);
Ey = imfilter(E, gy);
subplot(2,1,2);imshow((Ex+Ey)./2);title('SOBEL');