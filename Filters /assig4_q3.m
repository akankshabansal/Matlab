a=imread('im6.jpg');
b=rgb2gray(a);
c=medfilt2(b);
subplot(1,2,1),imshow(b);
subplot(1,2,2),imshow(c);