b=imread('im11.jpg');
%b=rgb2gray(a);
f=[1 2 1; 0 0 0;-1 -2 -1];% Sobel Filter
c=imfilter(b,fspecial('sobel'));
d=imfilter(b,fspecial('average',4));
subplot(2,2,1),imshow(b);
subplot(2,2,2),imshow(d);
subplot(2,2,3),imshow(c);
subplot(2,2,4),imshow(d+c);