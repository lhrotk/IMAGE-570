I = imread('grid.JPG');
I = rgb2gray(I);
F = fftshift(fft2(I));
figure;
subplot(1,3,1);imshow(I);
subplot(1,3,2);imshow(log(1+abs(F)), []);
ang_degree = 0:5:355;
S_theta = zeros(1,72);
center_x = size(F,1)/2;
center_y = size(F,2)/2;
subplot(1,3,3);
for i = 1:72
    for r = 10:30
            x_pos = round(center_x + r*sind(ang_degree(1,i)));
            y_pos = round(center_y + r*cosd(ang_degree(1,i)));
            S_theta(1, i) = S_theta(1, i) + abs(F(x_pos, y_pos));
    end
end
plot(ang_degree, S_theta);
