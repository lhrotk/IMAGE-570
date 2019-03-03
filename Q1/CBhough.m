%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

watchon;
H=findobj(gcf,'Tag','EditTextNDist');
nS=str2num(get(H,'String'));   
H=findobj(gcf,'Tag','EditTextNAng'); 
nT=str2num(get(H,'String'));
[HF,m,b]=CVhough(edgedata,nT,nS);   
subplot(3,2,4);  
imagesc(HF);
colormap(gray); 
title('Hough transform')  
xlabel('Distance');   
ylabel('Orientation');  
drawnow  
subplot(3,2,6);  
cla    
watchoff;  
H=findobj(gcf,'Tag','PushbuttonUnhough');     
set(H,'Enable','on');    