function edgeposfine=rowedges(row,b,threshold);

  x = (-ceil(b)*3):(ceil(b)*3);
  dg1 = 1/sqrt(2*pi*b^2)*(-x/b^2).*exp(-(x).^2/(2*b^2));
  drow1 = conv2(row,dg1,'same');
  adrow1=abs(drow1);
  n=size(adrow1,2);
  i0=2:(n-1);
  ih=3:n;
  iv=1:(n-2);
  edgepts= (adrow1(i0)>adrow1(ih)) & (adrow1(i0)>adrow1(iv)) & (adrow1(i0)>threshold);
  edgepos=[find(edgepts)+1];

% Iterative improvement of edges at these postions
  edgeposfine=edgepos;
  for i=1:size(edgepos,2);
    xk=edgepos(1,i);
    for k=1:5,
     [m1,m2,m3]=calcw123_1(row,xk,b);
     xk=xk-max(min(m2/m3,0.3),-0.3);
   end;
   edgeposfine(1,i)=xk;
  end;
