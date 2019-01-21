A = imread('lena512.bmp');
F = fftshift(fft2(A));
F_abs = abs(F);
figure(1); 
subplot(4,2,1);imshow(log(1+F_abs), []);title('FFT');
subplot(4,2,2);imshow(ifft2(ifftshift(F)), []);
radius_power = get_radius_power(F_abs);
[M,N]=size(F);
;%0.5%
r1 = get_radius(radius_power, 0.005);
for i=1:M
    for j=1:N
        if r1^2 < ((i-M/2)^2 + (j-N/2)^2)
            F(i, j)=0;
        end
    end
end
subplot(4,2,3);imshow(log(1+abs(F)), []);title('REMOVE 0.5%');
subplot(4,2,4);imshow(ifft2(ifftshift(F)), []);
%5.4%
r2 = get_radius(radius_power, 0.054);
for i=1:M
    for j=1:N
        if r2^2 < ((i-M/2)^2 + (j-N/2)^2)
            F(i, j)=0;
        end
    end
end
subplot(4,2,5);imshow(log(1+abs(F)), []);title('REMOVE 5.4%');
subplot(4,2,6);imshow(ifft2(ifftshift(F)), []);
%8%
r3 = get_radius(radius_power, 0.08);
for i=1:M
    for j=1:N
        if r3^2 < ((i-M/2)^2 + (j-N/2)^2)
            F(i, j)=0;
        end
    end
end
subplot(4,2,7);imshow(log(1+abs(F)), []);title('REMOVE 8%');
subplot(4,2,8);imshow(ifft2(ifftshift(F)), []);
