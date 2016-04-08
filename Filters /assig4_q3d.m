b=imread('test_4.jpg');
%b=rgb2gray(a);
c=imnoise(b,'gaussian');
subplot(1,2,1),imshow(b);
subplot(1,2,2),imshow(c);