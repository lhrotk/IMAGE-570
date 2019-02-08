%{
RAFEEF GARBI - EECE 570: Fundamentals of Visual Computing 2019
HW 2 - PROBLEM 5- Student File
%}
clear all; close all; clc;

%%
pltstp=40; %plot step of polar 
maxAngRange=0:720:720; % step size of twist

A=uint8(255*checkerboard(16));% initial checkerboard
subplot(131); imshow(A);

%%
%Mid point of the image
midr=ceil(size(A,1)/2); % rows increase downwards
midc=ceil(size(A,2)/2); % columns increase to the right

hold on
plot(midc,midr,'r.','markersize',20);
text(midc+3,midr+3,'origin','FontSize',20,'color',[1 0 0]);
nRows=size(A,1);
nCols=size(A,2);

%%
[r,c]=ndgrid(1:nRows,1:nCols);
x=c-midc;
y=midr-r;

%%
[th,rho]=cart2pol(x,y);% change to polar coordinate

for maxAngDeg=maxAngRange,
    
    maxRho=max(rho(:));
    maxAng=maxAngDeg*pi/180;%max angle in rad
    
    th2=th+(rho/maxRho)*maxAng;        
    rho2=rho;
    
    subplot(132);hold off
    polar(th2(1:pltstp:end),rho2(1:pltstp:end),'go')%plot the polar coordinate
    
    [x2,y2]=pol2cart(th2,rho2);%convert from polar to x-y
    
    c2=x2+midc;
    r2=midr-y2;
    
    % find the corresponding points in A and B
    B=uint8(zeros(size(A)));
    for r=1:nRows, %
        for c=1:nCols,
            if r2(r,c)>=1 && r2(r,c)<=nRows && ...
                    c2(r,c)>=1 && c2(r,c)<=nCols, % don't go out of A              
                
                
                B(r,c,:)=A(round(r2(r,c)),round(c2(r,c)),:);% Points in B are rotated from A
            end
        end
    end   
    subplot(133)
    imshow(B);
    
    pause(0.5)
end