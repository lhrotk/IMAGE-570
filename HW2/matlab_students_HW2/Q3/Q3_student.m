%{
RAFEEF GARBI - EECE 570: Fundamentals of Visual Computing 2019
HW 2 - PROBLEM 3 - student file
%}
close all; clear all; clc;

%% Mathematical Model of the Motion Blur
mn=0; st=0.0;%0.001 0.1  %noise level

USE_PSUEDO=0; % use psuedo filter
    
%parameter T (observation time) and motion rate
T=1; a=90;

%reading data
I=im2double(imread('cameraman.tif'));

%generating frequencies for the blurring model
u=linspace(-0.5,0.5,size(I,2));
v=linspace(-0.5,0.5,size(I,1));

[U,V]=meshgrid(u,v);

H=(T./(pi*U*a)).*sin(pi*U*a).*exp(-1i*pi*U*a);
surf(abs(H),'EdgeColor','none');

%% Applying Motion Blur
% filtering in f domain
I_f=fft2(I);
I_motion_f=fftshift(I_f).*H;

%if you want to add noise to degradation
N=mn+st*randn(size(I));
N_f=fft2(N);
I_motion_fn=I_motion_f+N_f;

figure;
subplot(1,3,1), imagesc(I), colormap(gray)
title('original image')

%back to spatial domain
I_motion_n=ifft2(ifftshift(I_motion_fn));
subplot(1,3,2); imagesc(abs(I_motion_n))
title('image after degradation')

%% Reconstruction
InvFilt = 1./H;
if USE_PSUEDO
    threshold = 0.1;
    InvFilt(abs(H)<threshold)=0;
end

I_recon_fn=I_motion_fn.*InvFilt;

I_recon=ifft2(ifftshift(I_recon_fn));
subplot(1,3,3),imagesc(abs(I_recon))
title('reconstruction from degraded image')