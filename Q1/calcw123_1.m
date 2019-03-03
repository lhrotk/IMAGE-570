function [m1,m2,m3]=calcw123_1(row,x,b);

x0=x;
[m,n]=size(row);
NN=round(b*3);
cutx=max(round(x0)-NN,1):min(round(x0)+NN,n);
if size(cutx,2)<3,
  error('x outside row');
else
  cutrow=row(cutx);
  x=cutx;

  filt0 = 1/(b*sqrt(2*pi)).*exp(-((x-x0).^2)/(2*b^2));
  filt1 = ( (x-x0)/(b^2) ).*filt0;
  filt2 = ( ((x-x0).^2 - b^2)/b^4 ).*filt0;
  filt3 = ( (x-x0).*((x-x0).^2 - 3*b^2)/b^6 ).*filt0;
  m1=sum(filt1.*cutrow);
  m2=sum(filt2.*cutrow);
  m3=sum(filt3.*cutrow);

end;

