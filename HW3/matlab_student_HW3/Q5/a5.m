I = imread('cameraman.tif');
e = entropy(I);
y = sort(I(:));
p = find([true;diff(y)~=0;true]);%find the pos of first element
values = y(p(1:end-1));%find different values
instances = diff(p);%find occurance of each value
p = instances/numel(I);%frequency of each value
[dict, avglen] = huffmandict(values,p);%huffman code and average length