a=im2double(imread('im11.jpg'));
f=fft(a);%Fourier Transform 1 D
fshift=fftshift(f); %Fourier Transform 1 D with shift
mag=abs(f);
i=ifft(f);
f2=fft2(a);
mag2=abs(f2);
i2=ifft2(f2);
subplot(3,3,1); imshow(a); title('Image');
subplot(3,3,2); imshow(f); title('Fourier Spectrum');
subplot(3,3,3); imshow(fshift); title('Fourier Spectrum with shift');
subplot(3,3,4); imshow(mag); title('magnitude of Fourier Spectrum');
subplot(3,3,5); imshow(i); title('Inverse Fourier Spectrum');
subplot(3,3,6); imshow(f2); title('Fourier Spectrum 2');
subplot(3,3,7); imshow(mag2); title('magnitude of Fourier Spectrum 2');
subplot(3,3,8); imshow(i2); title('Inverse Fourier Spectrum 2');
