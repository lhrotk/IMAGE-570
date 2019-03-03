function [H, m, b] =CVhough(I, edgedata,nT,nS)
%CVhough Hough transform of a binary matrix
%
%function [H,m,b]=CVhough(edgedata,nT,nS)
%	edgedata a 2-row matrix, with the x and y coordinates of the edges
%	nT number of orientations(thetas)~ 1/orientation resolution
%	nS number of distances 				~ 1/distance resolution
%	H votes histogram
%	m and b: distance mapping parameters
%           [1..nS] = [Smin...Smax]*m + b%
%
%	See also: CVimage, CVhough, CVunhough, CVedge, CVline, CVproj

MAXDIST=1.2;


if nargin<1
   error('require at least one input argument: binary image')
elseif nargin<2
   warning('defualt value of 200 assigned to number of orientations nT')
   nT=200;
   warning(['defualt value of', max(edgedata(:))*MAXDIST, 'assigned to number of orientations nS'])
   nS=max(edgedata(:))*MAXDIST;
elseif nargin<3
   warning(['defualt value of', max(edgedata(:))*MAXDIST, 'assigned to number of orientations nS'])
   nS=max(edgedata(:))*MAXDIST;
end

row=edgedata(2,:);
col=edgedata(1,:);

n = size(edgedata,2 );
%defining the range of the orientations of line
%Ts=[0:pi/nT:pi-pi/nT]';
[w, h] = size(I);

H = zeros(w,h,999+round(sqrt(w^2 + h^2)));%store the temp result, avoid atomic operation

%Note:	H is [nT,nS]
%			rmS is [nP,nT]  nP:number of edge points

hw=waitbar(0,'Performing Hough Transform...');
for a = 1:w
    for b = 1:h
          for i= 1:n
              r = 1+round(sqrt((row(i)-b)^2+(col(i)-a)^2));
              H(a,b,r) = H(a,b,r) + 1;
          end
    end
    waitbar(a/w,hw);
end
close(hw);

m = w;
b = h;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  USING 3D MATRICES
%
%  we tried to calculate the votes for all the S,T pairs
%  in the hough transform using 3D matrices and without
%	using for loops, but 3D matrices took a lot of memory 
% 	and resulted in slower performance. (See below...)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%counting number of specific distances for each angle
%first produce a 3D matrix with repS(:,:,i)=i, where i=1:nS

%TMP% repS=shiftdim(repmat(1:nS,[nT,1,length(row)]),2);

%then we repeat the rmS matrix and get a 3D reprmS(:,:,i)=rmS, where i=1:nS

%TMP% reprmS=repmat(rmS,[1 1 nS]);

%then we compare repS with reprmS
%dim1=#nonzeros pixels
%dim2=number of orientations nT
%dim3=number of distances nS

%TMP% isEq=(repS==reprmS);

%we sum up the ones for each direction at each distance 
%and obtain H(histogram of votes) of size [nT,nS]

%TMP% H=squeeze(sum(isEq,1));