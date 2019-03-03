%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


if exist('I','var')==0 
   I=[];
end

if(isempty(I))
   I=CVimage;
   if(isempty(I))
      return;
   end
else
   Iold=I;
   I=CVimage;
   if(isempty(I))
      I=Iold;
      return;
   end;
end
subplot(3,2,2);
imagesc(I);
colormap(gray);
title('Image');
H=findobj(gcf,'Tag','EditTextNDist');
set(H,'String',num2str(round(1.2*max(size(I)))));
subplot(3,2,4);cla;
subplot(3,2,6);cla;
H=findobj(gcf,'Tag','PushbuttonEdge');set(H,'Enable','on');
H=findobj(gcf,'Tag','PushbuttonHough');set(H,'Enable','off');
H=findobj(gcf,'Tag','PushbuttonUnhough');set(H,'Enable','off');
