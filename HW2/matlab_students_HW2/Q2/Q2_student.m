%{
RAFEEF GARBI - EECE 570: Fundamentals of Visual Computing 2019
HW 2 - PROBLEM 2 - Student File
%}
clear all; close all; clc;

%% Load and display the image
Img = imread('in_the_tunnel.png');

% figure;
% imagesc(Img); title('Original Image - RGB'); axis image;

Img = rgb2gray(im2double(Img));

figure;
subplot(2,1,1);imagesc(Img); title('Original Image - Greyscale'); 
axis image; colormap gray;

%% frequency domain approach (homomorphic filtering)
% Western Australia function
% https://www.peterkovesi.com/matlabfns/index.html
newim = homomorphic(Img, 0, 0.05, 10, 0, 5);
subplot(2,1,2);imagesc(newim); 
title('Resulting Image: Homomorphic filtering'); 
axis image; colormap gray;
