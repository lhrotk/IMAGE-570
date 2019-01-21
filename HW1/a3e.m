E = imread('eight.tif');
ref = double(imbinarize(E));
figure(1)
subplot(2,1,1);histogram(E);title('GRAY SCALE');
subplot(2,1,2);histogram(ref);title('BINARY');
figure(2)
E_binary = imhistmatch(E,ref);
imshow(E_binary);
