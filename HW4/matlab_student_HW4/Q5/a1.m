%I = load('input.mat');
%I = I.input;
I = zeros(50, 50);
for i=20:30
    for j=15:45
        I(i,j) = 1;
    end
end
I(19,30) = 1;
I(19,31) = 1;
I(19,32) = 1;
I(18,31) = 1;
subplot(2,1,1);imshow(I);
attacker = zeros(4,3,3,3);
attacker(1,1,:,:) = [-1 0 -1; 0 1 1;-1 1 1];
attacker(1,2,:,:) = [-1 1 1; 0 1 1;-1 0 -1];
attacker(1,3,:,:) = [-1 -1 1; 0 1 1;-1 -1 1];
attacker(2,1,:,:) = [-1 0 -1; 1 1 0;1 1 -1];
attacker(2,2,:,:) = [-1 0 -1; 0 1 1;-1 1 1];
attacker(2,3,:,:) = [-1 0 -1; -1 1 -1;1 1 1];
attacker(3,1,:,:) = [1 1 -1; 1 1 0;-1 0 -1];
attacker(3,2,:,:) = [-1 0 -1; 1 1 0;1 1 -1];
attacker(3,3,:,:) = [1 -1 -1; 1 1 0;1 -1 -1];
attacker(4,1,:,:) = [-1 1 1; 0 1 1;-1 0 -1];
attacker(4,2,:,:) = [1 1 -1; 1 1 0;-1 0 -1];
attacker(4,3,:,:) = [1 1 1; -1 1 -1;-1 0 -1];
[w, h] = size(I);
while true
    finish = false;
    for n=1:4
        maskmat = zeros(w,h);
        for i=2:w-1
            for j=2:h-1
                result = mask(I, maskmat, attacker(n,:,:,:),i, j);
                maskmat(i,j) = result;
                finish = result || finish;
            end
        end
        I = I & ~maskmat;
    end
    if ~finish
        break;
    end
end
subplot(2,1,2);imshow(I);