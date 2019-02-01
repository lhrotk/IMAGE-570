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
mag = abs(F); %

%%
ratio = 0.05; %
mask = mag > ratio*max(mag(:)); %
mask = bwmorph(mask,'dilate',2); %
mask = bwmorph(mask,'shrink',100); %
mask(size(F,1)/2+1,size(F,2)/2+1) = 0; %

%%
rad = 10; %
[x,y] = find(double(mask)); %
F2 = F;

for i=1:size(x,1)
    H = notch('ideal',size(F,1),size(F,2),rad,y(i),x(i)); %
    F2 = F2.*H;
end

figure; imshow(log(abs(F)),[]);
title('');
figure; imshow(log(abs(F2)),[]);
title('');
figure; imshow(real(ifft2(ifftshift(F2))));
title('Resulting Image');