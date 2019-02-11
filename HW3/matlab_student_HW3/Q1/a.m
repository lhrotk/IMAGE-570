I = imread('peppers.png');
Ycbcr = rgb2ycbcr(I);
Y = Ycbcr(:,:,1);
Cb = Ycbcr(:,:,2);
Cr = Ycbcr(:,:,3);
Y_down = imresize(Y, 0.5, 'bilinear');
Y_up = imresize(Y_down, 2, 'bilinear');
Cb_down = imresize(Cb, 0.5, 'bilinear');
Cb_up = imresize(Cb_down, 2, 'bilinear');
Cr_down = imresize(Cr, 0.5, 'bilinear');
Cr_up = imresize(Cr_down, 2, 'bilinear');
immse(Y,Y_up)
immse(Cb,Cb_up)
immse(Cr,Cr_up)
I_recon_Y = ycbcr2rgb(cat(3, Y_up, Cb, Cr));
I_recon_C = ycbcr2rgb(cat(3, Y, Cb_up, Cr_up));
subplot(1,3,1);imshow(I);title('original');
subplot(1,3,2);imshow(I_recon_Y);title('reconstruct Y downsample');
subplot(1,3,3);imshow(I_recon_C);title('reconstruct Chroma downsample');