A=imread('2.jpg');
[M N]=size(A);
R=imnoise2('gaussian',M,N,0.05,0.05);
B=im2double(A);
F=B+R;
C=imnoise(A,'gaussian');
h=colfilt(F,[3 3],'sliding',@gmean);
f=fspecial('average');
g=imfilter(F,f);
%h=colfilt(F,[3 3],'sliding',@hmean);

subplot(2,3,1);imshow(A);title('Original Image');
subplot(2,3,2);imshow(F);title('Noisy Image using noise2');
subplot(2,3,3);imshow(C);title('Noisy Image');
subplot(2,3,4);imshow(g,[]);title('Arithmetic Mean Filter');
subplot(2,3,5);imshow(h,[]);title('Geometric Mean Filter');