im1=imread('SegmentationImage.png');
bwim1=adaptivethreshold(im,32,0.03,0);
subplot(2,2,1);imshow(im);
subplot(2,2,2);imshow(bwim1);
w=fspecial('average');
im2=imfilter(im,w);
bwim2=adaptivethreshold(im2,32,0.03,0);
subplot(2,2,3);imshow(im2,[]);
subplot(2,2,4);imshow(bwim2,[]);

im1=bwim2;
%im1=rgb2gray(im);
im1=medfilt2(im1,[3 3]); %Median filtering the image to remove noise%
BW = edge(im1,'sobel'); %finding edges 
[imx,imy]=size(BW);
msk=[0 0 0 0 0;
     0 1 1 1 0;
     0 1 1 1 0;
     0 1 1 1 0;
     0 0 0 0 0;];
B=conv2(double(BW),double(msk)); %Smoothing  image to reduce the number of connected components
L = bwlabel(B,8);% Calculating connected components
mx=max(max(L))
[r,c] = find((L<=50)&(L>=40));  
rc = [r c];
[sx sy]=size(rc);
n1=zeros(imx,imy); 
for i=1:sx
    x1=rc(i,1);
    y1=rc(i,2);
    n1(x1,y1)=255;
end % Storing the extracted image in an array
figure;
subplot(2,2,1);imshow(im);
subplot(2,2,2);imshow(im1);
subplot(2,2,3);imshow(B);
subplot(2,2,4);imshow(n1,[]);