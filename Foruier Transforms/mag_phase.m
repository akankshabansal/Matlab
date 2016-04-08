a=imread('2.jpg');
a=im2double(a);
f=fft2(a);%Fourier Transform 2 D
fshift=fftshift(f); %Fourier Transform 1 D with shift
mag=abs(f);
fphase=atan(f);
i=ifft2(mag);
iphase=ifft2(fphase);

subplot(2,3,1); imshow(a,[]); title('Image');
subplot(2,3,2); imshow(f,[]); title('Fourier transform ');
subplot(2,3,3); imshow(iphase,[]); title('image from phase');
subplot(2,3,4); imshow(mag,[]); title('Fourier Spectrum');
subplot(2,3,5); imshow(i,[]); title('Image from Magnitude');
