%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

H=findobj(gcf,'Tag','EditTextUnhough');     
P=str2num(get(H,'String'));   
[SL,TL,intSL,intTL]=CVunhough(HF,m,b,P);         
subplot(3,2,4)     
imagesc(HF);   
colormap(gray);   
hold on       
plot(intSL,intTL,'yo');      
title('Hough transform with detected peeks')        
xlabel('Distance');    
ylabel('Orientation');    
hold off   
X=1:size(I,1);      
[XL,YL]=CVline(SL,TL,X);       
subplot(3,2,6)  
imagesc(I);       
hold on      
colormap(gray)      
plot(YL-1,XL,'r')              
title(['Image with ', num2str(length(SL)),' detected lines'])     
hold off  