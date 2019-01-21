%(a)
A=zeros(30,30);
imshow(A)
for i=10:20
    for j=10:20
        A(i,j)=1;
    end
end
%(b) 
figure(1)
NN_25 = imrotate(A,25,'nearest','crop');
NN_45 = imrotate(A,45,'nearest','crop');
subplot(2,3,1); imshow(NN_25) ; title('NN 25') ; 
subplot(2,3,4); imshow(NN_45) ; title('NN 45') ;
Bilinear_25 = imrotate(A,25,'bilinear','crop');
Bilinear_45 = imrotate(A,45,'bilinear','crop');
subplot(2,3,2); imshow(Bilinear_25) ; title('BILINEAR 25') ; 
subplot(2,3,5); imshow(Bilinear_45) ; title('BILINEAR 45') ;
CUBIC_25 = imrotate(A,25,'bicubic','crop');
CUBIC_45 = imrotate(A,45,'bicubic','crop');
subplot(2,3,3); imshow(CUBIC_25) ; title('CUBIC 25') ; 
subplot(2,3,6); imshow(CUBIC_45) ; title('CUBIC 45') ;
%(d)
figure(2)
MRI=imread('mri.tif');
subplot(2,2,1);imshow(MRI);title('ORIGINAL');
MRI_BILINEAR=imresize(MRI,2,'bilinear');
subplot(2,2,2);imshow(MRI_BILINEAR);title('BILINEAR');
MRI_CUBIC=imresize(MRI,2,'bicubic');
subplot(2,2,3);imshow(MRI_CUBIC);title('BICUBIC');
MRI_NN=imresize(MRI,2,'nearest');
subplot(2,2,4);imshow(MRI_NN);title('NN');
