function hist = colorhist(image, n1, n2, n3)
%COLORHIST Summary of this function goes here
%   0 is put into bin 1
image = uint16(image);
hist = zeros(1, n1+n2+n3);
offset = [0, n1, n1+n2];
[m,n,c]=size(image);
for ch=1:c
    for w=1:m
        for h=1:n
            hist(offset(ch)+image(w,h,ch)+1) = hist(offset(ch)+image(w,h,ch)+1)+1;
        end
    end
end
end

