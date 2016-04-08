b=imread('test_5.jpg');
%b=rgb2gray(a);
f=[1 1 1; 1 1 1; 1 1 1]*(1/9);
c=imfilter(b,f);
f2=[1 1 1 1 1; 1 1 1 1 1; 1 1 1 1 1]*(1/20);
d=imfilter(b,f2);
subplot(2,2,1),imshow(b);
subplot(2,2,2),imshow(c);
subplot(2,2,3),imshow(d);