A = imread('lena512.bmp');
F = abs(fft2(A));
C = ifft2(F);
subplot(2,1,1);imshow(C,[]);title('Magnitude');
F = fft2(A);
F = F./abs(F);
C = ifft2(F);
subplot(2,1,2);imshow(C,[]);title("Phase");