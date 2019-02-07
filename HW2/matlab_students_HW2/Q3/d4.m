T=1; a=30;b=40;K=0.0004;

%reading data
I=im2double(imread('blur.bmp'));

%generating frequencies for the blurring model
u=linspace(-0.5,0.5,size(I,2));
v=linspace(-0.5,0.5,size(I,1));

[U,V]=meshgrid(u,v);

H=(T./(pi*(U*a+V*b))).*sin(pi*(U*a+V*b)).*exp(-1i*pi*(U*a+V*b));

I_f=fft2(I);
I_motion_fn=fftshift(I_f);

H2 = H.^2;
wFilt = (1./H).*(H2./(H2+K));

I_recon_fn=I_motion_fn.*wFilt;

I_recon=ifft2(ifftshift(I_recon_fn));
imshow(abs(I_recon), []);
title('reconstruction from degraded image with wiener')