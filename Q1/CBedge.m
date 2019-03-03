%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

watchon;

H=findobj(gcf,'Tag','PopupMenuEdge');
if get(H,'Value')==7
   M=1;
   H=findobj(gcf,'Tag','EditTextKernel');
   A=str2num(get(H,'String'));
else
   M=2;
   H=findobj(gcf,'Tag','PopupMenuEdge');
   A=get(H,'Value');
end

H=findobj(gcf,'Tag','EditTextThresh');
T=str2num(get(H,'String'));
edgedata=CVedge(I,M,T,A);

if isempty(edgedata)
   return
end

subplot(3,2,2);
imagesc(I);
hold on;
rita(edgedata,'r+');
colormap(gray);
title('Image with detected edges');
hold off
subplot(3,2,4);cla;
subplot(3,2,6);cla;
H=findobj(gcf,'Tag','PushbuttonHough');set(H,'Enable','on');
H=findobj(gcf,'Tag','PushbuttonUnhough');set(H,'Enable','off');

watchoff;
