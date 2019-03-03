I = imread('grid.JPG');
I = rgb2gray(I);
F = fftshift(fft2(I));
figure;
subplot(1,3,1);imshow(I);
subplot(1,3,2);imshow(log(1+abs(F)), []);
center_x = size(F,1)/2;
center_y = size(F,2)/2;
[w,h] = size(F);
subplot(1,3,3);
r = 10;
S = zeros(1,999);
while true
     x_pos = round(center_x + r*sin(pi/4));
     y_pos = round(center_y + r*cos(pi/4));
     if x_pos>w||y_pos>h
         break;
     end
     S(1, r+1) =  abs(F(x_pos, y_pos));
     r = r+1;
end
S = S(1,1:r);
i = 0:1:size(S,2)-1;
plot(i, S);