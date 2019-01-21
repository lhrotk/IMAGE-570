E = imread('eight.tif');
%(a)
figure(1);
subplot(2,2,1);imshow(E);title('ORIGINAL');
subplot(2,2,2);imshow(imnoise(E, 'salt & pepper', 0.05));title('DENSITY 0.05');
subplot(2,2,3);imshow(imnoise(E, 'salt & pepper', 0.10));title('DENSITY 0.10');
subplot(2,2,4);imshow(imnoise(E, 'salt & pepper', 0.15));title('DENSITY 0.15');
%(b)
figure(2);
subplot(2,2,1);imshow(E);title('ORIGINAL');
subplot(2,2,2);imshow(imnoise(E, 'gaussian', 0, 0.01));title('GAUSSIAN VAR=0.01');
subplot(2,2,3);imshow(imnoise(E, 'gaussian', 0, 0.05));title('GAUSSIAN VAT=0.05');
subplot(2,2,4);imshow(imnoise(E, 'gaussian', 0, 0.1));title('GAUSSIAN VAR=0.1');
%(c)
figure(3);
E_shot = imnoise(E, 'salt & pepper', 0.05);
E_gaussian = imnoise(E, 'gaussian', 0, 0.01);
subplot(2,2,1);imshow(E_shot);title('SHOT NOISE');
subplot(2,2,2);imshow(E_gaussian);title('GAUSSIAN NOISE');
subplot(2,2,3);imshow(medfilt2(E_shot));title('SHOT NOISE AFTER MEDIAN FILTER');
subplot(2,2,4);imshow(medfilt2(E_gaussian));title('GAUSSIAN NOISE AFTER MEDIAN FILTER');