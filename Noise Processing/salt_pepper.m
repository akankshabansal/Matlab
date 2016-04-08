a=rgb2gray(imread('1.jpg'));
b=imnoise(a,'salt & pepper');
g=medfilt2(b);
subplot(2,2,1);imshow(a,[]);title('Original Image');
subplot(2,2,2);imshow(b,[]);title('Noisy Image');
subplot(2,2,3);imshow(g,[]);title('Median Filter');