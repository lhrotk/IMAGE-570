%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function I=CVimage;
%function I=CVimage;
%CVimage returns a normalized (0-1) grey scale image given the path
%	I 	returned image
%
%	See also: CVimage, CVhough, CVunhough, CVedge, CVline, CVproj


[F,P]=uigetfile('*.pgm;*.jpg;*.jpeg;*.tif;*.tiff;*.bmp;*.png;*.hdf;*.pcx;*.xwd','Choose Image');

if F==0
   I=[];
else
   PF=[P,F];
   ext=PF(findstr(PF,'.')+1:end);
   
   if strcmp(ext,'pgm')
      I  = readpgm(PF);
   else %matlab image types
      [Im,MAP]=imread(PF);
      if size(MAP,1)>2, 
         I = double(ind2gray(Im,MAP));
      else
         I  = double(Im);
      end
   end
   I = I/max(I(:));
end
