clear all;
A = imread('swirled.bmp');

%Mid point of the image
midr=ceil(size(A,1)/2); % rows increase downwards
midc=ceil(size(A,2)/2); % columns increase to the right

nRows=size(A,1);
nCols=size(A,2);

[r,c]=ndgrid(1:nRows,1:nCols);
x=c-midc;
y=midr-r;

[th,rho]=cart2pol(x,y);% change to polar coordinate

maxAngDeg = 720;

maxRho=max(rho(:));
maxAng=maxAngDeg*pi/180;%max angle in rad
    
th2=th+(rho/maxRho)*maxAng;        
rho2=rho;
    
[x2,y2]=pol2cart(th2,rho2);%convert from polar to x-y
    
c2=x2+midc;
r2=midr-y2;
    
% find the corresponding points in A and B
B=uint8(zeros(size(A)));
for r=1:nRows, %
    for c=1:nCols,
        if r2(r,c)>=1 && r2(r,c)<=nRows && ...
                c2(r,c)>=1 && c2(r,c)<=nCols, % don't go out of A                  
            B(round(r2(r,c)),round(c2(r,c)),:)=A(r,c,:);% Points in B are rotated from A
        end
    end
end

B2=medfilt2(B, [6,6])
for r=1:nRows, %
    for c=1:nCols,
        if B(r,c,:)==0
            B(r,c,:) = B2(r,c,:);
        end
    end
end
imshow(B)