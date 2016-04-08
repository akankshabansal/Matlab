% I = im2double(imread('brain.png'));
% level = graythresh(I);
% BW = im2bw(I,level);
% subplot(3,2,1), imshow(I,[]);
% subplot(3,2,2), imshow(BW,[]);
% 
% x=132; y=76;
% J = regiongrowing(BW,x,y,level); 
% subplot(3,2,3), imshow(I+J,[]);
% 
% [M N]=size(I);
% R=imnoise2('gaussian',M,N,0.05,0.05);
% B=im2double(I);
% F=B+R;
% subplot(3,2,4),imshow(F,[]);
% 
% level = graythresh(F);
% BW = im2bw(F,level);
% subplot(3,2,5),imshow(BW,[]);
% J = regiongrowing(BW,x,y,level); 
% subplot(3,2,6), imshow(F+J,[]);
% 
i=imread('brain.png');
subplot(2,3,1);imshow(i,[]);title('Original Image');
l=graythresh(i);
i=im2bw(i,l);
subplot(2,3,2);imshow(i,[]);title('Thresholded Image');
S=zeros(size(i));
S(132,76)=255;
[g,p,q,r]=regiongrow(i,S,0.1);
subplot(2,3,3);imshow(g,[]);title('After region growing');

[M N]=size(i);
R=imnoise2('gaussian',M,N,0.05,0.05);
B=im2double(i);
F=B+R;
subplot(2,3,4),imshow(F,[]);title('Noisy Image');

i=medfilt2(i);
subplot(2,3,5);imshow(i,[]);title('Restored Image');
[g,p,q,r]=regiongrow(i,S,0.1);
subplot(2,3,6);imshow(g,[]);title('Region growing on restored image');
