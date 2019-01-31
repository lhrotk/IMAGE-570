A = imread('blurry_moon.tif');
subplot(3,1,1);imshow(A);
F = fftshift(fft2(A));
[M, N] = size(F);
Laplace = zeros(M, N);
for i=1:M
    for j=1:N
        Laplace(i,j) = -4*pi^2*((i-M/2)^2 + (j-N/2)^2);
    end
end
F = F.*Laplace;
A_rec = ifft2(ifftshift(F));
subplot(3,1,2);imshow(A_rec,[]);title('frequency laplacian filter')
kernel = [0 1 0; 1 -4 1; 0 1 0];
subplot(3,1,3);imshow(imfilter(A, kernel),[]);title('spatial filter')