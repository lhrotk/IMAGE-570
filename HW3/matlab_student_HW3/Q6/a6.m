f = double(imread('cameraman.tif'));
I = imread('cameraman.tif');
[m, n] = size(f);
for j=n:-1:2
    for i = 1:m
        f(i, j) = f(i, j) - f(i, j-1);
    end
end
figure;
subplot(2,1,1);imshow(I);title('Original');
subplot(2,1,2);imshow(f, []);title('Predicted');
e = entropy(f);
for j=2:n
    for i = 1:m
        f(i, j) = f(i, j) + f(i, j-1);
    end
end
figure;
subplot(2,1,1);imshow(I);title('Original');
subplot(2,1,2);imshow(f, []);title('Predicted');