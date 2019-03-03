%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function Circles=CVunhough(H,m,b,P)
%CVunhough finds lines from a Hough histogram
%function [SL,TL,intSL,intTL]=CVunhough(H,m,b,P)
%	H votes histogram of size [nT,nS]
%	P percentage threshold
%	m and b: distance mapping parameters
%           [1..nS] = [Smin...Smax]*m + b
%	SL distances of selected lines
%	TL orientations of selected lines
%	intSL distances of selected lines after mapping to 1:nS
%	intTL orientations of selected lines after mapping to 1:nT
%
%	See also: CVimage, CVhough, CVunhough, CVedge, CVline, CVproj

DILATEFRAC=.02;


if nargin<3
   error('require at least 3 input arguments: histogram matrix H, 2 distance mapping parameters m & b');
elseif nargin<4
   warning('defualt value of 0.7 assigned to percentage threshold P');
   P=0.7;
end
   
[w, h, r]=size(H);

%locate the peeks in the histogram with
%votes more than P*100% of the highest vote
%note: r~orientation, c~distance
%TMP% [r,c]=find(H>=P*max(H(:)));

%Theshhold H --> TH
%TH=im2bw(H,P*max(H(:)));
TH=H>P*max(H(:));

%Morphological
se = strel('sphere', 1)
H1=imdilate(TH, se);

%Labeling
Circles = regionprops3(H1, 'centroid');
end