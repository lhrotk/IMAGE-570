%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

watchon;
H=findobj(gcf,'Tag','EditTextNDist');
nS=str2num(get(H,'String'));   
H=findobj(gcf,'Tag','EditTextNAng'); 
nT=str2num(get(H,'String'));
[HF,m,b]=CVhough(I, edgedata,nT,nS);   
subplot(3,2,4);  
c = find(HF>0.7*max(HF(:)));
[X,Y,Z] = ind2sub(size(HF), c);
scatter3(X,Y,Z);
title('Hough transform')  
subplot(3,2,6);  
cla    
watchoff;  
H=findobj(gcf,'Tag','PushbuttonUnhough');     
set(H,'Enable','on');    