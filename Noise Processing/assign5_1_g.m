a=rgb2gray(imread('1.jpg'));
b=imnoise(a,'gaussian');
h=colfilt(b,[3 3],'sliding',@gmean);
f=fspecial('average');
g=imfilter(b,f);
subplot(2,2,1);imshow(a,[]);title('Original Image');
subplot(2,2,2);imshow(b,[]);title('Noisy Image');
subplot(2,2,3);imshow(g,[]);title('Arithmetic Mean Filter');
subplot(2,2,4);imshow(h,[]);title('Geometric Mean Filter');