f=im2double(rgb2gray(imread('im_0.jpg')));
PQ=size(f);
[U, V]=dftuv(PQ(1),PQ(2));
D0=0.05*PQ(2);
F=fft2(f,PQ(1),PQ(2));
Gau=exp(-(U.^2+V.^2)/(2*(D0^2)));
g=dftfilt(f,Gau);
D=sqrt(U.^2+V.^2);

id=double(D<=D0);
Idim=dftfilt(f,id);

btw=1./(1+(D./D0).^(2*2)); % n=1 
btwim=dftfilt(f,btw);% change to image

subplot(3,3,1); imshow(f); title('Image');
subplot(3,3,2); imshow(fftshift(Gau)); title('Fourier Spectrum Gaussian');
subplot(3,3,3); imshow(g); title('Gaussian');
subplot(3,3,5); imshow(fftshift(id)); title('Ideal');
subplot(3,3,6); imshow(Idim); title('Ideal image');
subplot(3,3,8); imshow(fftshift(btw)); title('Butter worth');
subplot(3,3,9); imshow(btwim); title('butter worth image');
