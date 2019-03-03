%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

H=findobj(gcf,'Tag','EditTextUnhough');     
P=str2num(get(H,'String'));   
Circles=CVunhough(HF,m,b,P);    
Circles = table2array(Circles);
subplot(3,2,6)  
imagesc(I);       
hold on 
colormap(gray);
ang=0:0.01:2*pi;
for i = 1:size(Circles)
    xp=Circles(i,3)*cos(ang);
    yp=Circles(i,3)*sin(ang);
    plot(Circles(i,2)+xp,Circles(i,1)+yp, 'r','linewidth',8);
end              
title(['Image with ', num2str(size(Circles,1)),' detected circles'])     
hold off  