%(a)
I = zeros(200,200);
for i=90:150
    for j=70:90
        I(i,j) = 1;
    end
end
F = fftshift(fft2(I));
F = abs(F);
F = log(1+F);
subplot(4,2,1);imshow(I);title('ORIGIN');
subplot(4,2,2);imshow(F,[]);
%rotate
I = zeros(200,200);
for i=90:150
    for j=70:90
        I(i,j) = 1;
    end
end
I = imrotate(I, 45, 'bilinear', 'crop');
F = fftshift(fft2(I));
F = abs(F);
F = log(1+F);
subplot(4,2,3);imshow(I);title('ROTATE');
subplot(4,2,4);imshow(F,[]);
%thinner
I = zeros(200,200);
for i=90:150
    for j=87:93
        I(i,j) = 1;
    end
end
F = fftshift(fft2(I));
F = abs(F);
F = log(1+F);
subplot(4,2,5);imshow(I);title('THINNER');
subplot(4,2,6);imshow(F,[]);
%translated
I = zeros(200,200);
for i=110:170
    for j=100:120
        I(i,j) = 1;
    end
end
F = fftshift(fft2(I));
F = abs(F);
F = log(1+F);
subplot(4,2,7);imshow(I);title('TRANSLATE');
subplot(4,2,8);imshow(F,[]);

