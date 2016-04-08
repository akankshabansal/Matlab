a=imread('im6.jpg');
b=rgb2gray(a);
c=ordfilt2(b,9,ones(3,3));
subplot(1,2,1),imshow(b);
subplot(1,2,2),imshow(c);