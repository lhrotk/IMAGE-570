%{
RAFEEF GARBI - EECE 570: Fundamentals of Visual Computing 2019
HW 2 - PROBLEM 4 - Student File
Requires: dftuv.m, lpfilter.m, notch.m
%}
close all; clear all; clc;

%% Loading the image and computing the FFT
A = im2double(imread('halftone.png'));

figure; imshow(A);
title('Original Image');
F = fftshift(fft2(A));
mag = abs(F); %Get the absolute value of fourier

%%
ratio = 0.015; %a threshold to find the 'peeks' in fourier
mask = mag > ratio*max(mag(:)); % find the 'peaks'
mask = bwmorph(mask,'dilate',2); % link close cluster points together
mask = bwmorph(mask,'shrink',100); % find the single core to represet clusters
mask(size(F,1)/2+1,size(F,2)/2+1) = 0; % exclude the (0,0), this the original image low frequency compenent not halftone

%%
rad = 30; %a mask the radius of circle to cover the halftone frequency component
[x,y] = find(double(mask)); %get the circle center position
F2 = F;

for i=1:size(x,1)
    H = notch('gaussian',size(F,1),size(F,2),rad,y(i),x(i)); % a lowpass filter to remove the frequency caused by halftone
    F2 = F2.*H;
end

H = 1-notch('gaussian',size(F,1),size(F,2),80,size(F,2)/2,size(F,1)/2); % a lowpass filter to remove the frequency caused by halftone
F2 = F2.*H;

figure; imshow(log(abs(F)),[]);
title('');
figure; imshow(log(abs(F2)),[]);
title('');
figure; imshow(real(ifft2(ifftshift(F2))));
title('Resulting Image');