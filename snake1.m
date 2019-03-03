I=imread('pear.bmp');   % read gray scale image
snake(I);			    % detect edge using snake

function snake(I)
% Snake

alpha=0.05; beta=0;      % alpha=0.5 beta=0 step=1
[x,y]=DrawLine(I);	% manually draw initial contour

a=2*alpha+6*beta; b=-(alpha+4*beta); c=beta;
J=[c b a b c]; h=max(size(x));
A=diagCyclMat(h,J);     % petadiagonal

II=eye(h); [m,~]=size(I);        % initial
I=double(I);

I1=-ff(I);                       % gaussian 
[I2x,I2y]=NGradient(I1);         % negative gradient
T=max(max(abs(I2x(:))),max(abs(I2y(:))));
I2x=I2x/T; I2y=I2y/T;            % 
fx=-1*I2x; fy=-1*I2y;            % 


for t=1:800                      % iteration 
    ffx=fx(m*(uint16(x)-1)+uint16(y));
    ffy=fy(m*(uint16(x)-1)+uint16(y));
    x=((II/(A+II))*(x'-ffx'))';
    y=((II/(A+II))*(y'-ffy'))';
end

I=uint8(I); imshow(I);  hold on
plot(x,y,'Color','Red','LineWidth',2)       % show snake contour
end

function I1=ff(I)
%negative gaussian gradient 

% smooth 5x5, sobel 
h=fspecial('gaussian',5,3); w1=fspecial('sobel'); w2=w1';

Is=imfilter(double(I),h,'conv','replicate');
%Is = double(I);
I1=imfilter(Is,w1,'replicate').^2+imfilter(Is,w2,'replicate').^2;

end

function [I2x,I2y]=NGradient(I)
%negative gradient
%sobel
w1=fspecial('sobel'); w2=w1';
I=double(I);
I2y=imfilter(I,w1,'replicate');
I2x=imfilter(I,w2,'replicate');
end

function A=diagCyclMat(n,J)
% A = diagonal cycle(J) matrix.
%生成一个以向量J为循环体的对角循环矩阵
l=length(J); h=(l+1)/2;
if n<l
    error('A is too small to hold J');
end
if mod(l,2)==0
    error('length.J is not odd');
end
A=zeros(n);
for i=1:n
    j=i;
    A(i,j)=J(h);
    k=1;
    while (h-k)~=0
        if (j-k)<1
            j=j+n;
        end
        A(i,j-k)=J(h-k);
        k=k+1;
    end
    k=1;
    while (h+k)~=l+1
        if (j+k)>n
            j=j-n;
        end
        A(i,j+k)=J(h+k);
        k=k+1;
    end
end
end

function [x,y]=DrawLine(I)

imshow(I)
hold on
tag=0; P=zeros(2); LX=[]; LY=[];
set(gcf,'WindowButtonDownFcn',@DoLine);
pause;
x=LX; y=LY;

function DoLine(~,~)
pt=get(gca,'CurrentPoint');
if tag==0
    P(1,1)=pt(1,1); P(1,2)=pt(1,2);
    tag=1;
else
    P(2,1)=pt(1,1); P(2,2)=pt(1,2);
    LinkLine(P);
    P(1,1)=P(2,1); P(1,2)=P(2,2);
end
end

function LinkLine(P)
xh=abs(P(2,1)-P(1,1));
yh=abs(P(2,2)-P(1,2));
if yh>xh
    n=int16(yh+1);
    k=double((P(2,1)-P(1,1))/(P(2,2)-P(1,2)));
    k1=(P(2,2)-P(1,2))/yh;
    X=zeros(1,n);Y=zeros(1,n);
    for i=1:n
        Y(i)=P(1,2)+(i-1)*k1;
        X(i)=P(1,1)+ceil((i-1)*k1*k);
    end
else
    n=int16(xh+1);
    k=double((P(2,2)-P(1,2))/(P(2,1)-P(1,1)));
    k1=(P(2,1)-P(1,1))/xh;
    X=zeros(1,n);Y=zeros(1,n);
    for i=1:n
        X(i)=P(1,1)+(i-1)*k1;
        Y(i)=P(1,2)+ceil(k*k1*(i-1));
    end
end
LX=[LX X]; LY=[LY Y];
plot(LX,LY,'Color','Red','LineWidth',2)
hold on
end
end