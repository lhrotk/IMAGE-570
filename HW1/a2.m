%(a)
h1 = [0 0 0;1 2 1;0 0 0];
h2 = [0 1 0;0 0 0;0 -1 0];
h3 = conv2(h1, h2, 'same');
%(b) this is sobel operator, it dectect lines and thus is highpass
%(c)
MRI = imread('mri.tif');
MRI_CONV = imfilter(MRI, h3);
figure(1);
subplot(2,1,1); imshow(MRI); title('ORIGINAL');
subplot(2,1,2); imshow(MRI_CONV); title('CONV RESULT');
%(c)
h1 = [0 0 0;1 2 1;0 0 0];
h2 = [0 1 0;0 2 0;0 1 0];
h3 = conv2(h1, h2, 'same');
h3 = h3./sum(h3(:));
MRI_CONV = imfilter(MRI, h3);
figure(2);
subplot(2,1,1); imshow(MRI); title('ORIGINAL');
subplot(2,1,2); imshow(MRI_CONV); title('CONV RESULT');
