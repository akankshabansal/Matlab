% f=imread('2.jpg');
% PQ=paddedsize(size(f));
% D0=0.05*PQ(1);
% H1=hpfilter('ideal',PQ(1),PQ(2),D0);
% H2=hpfilter('btw',PQ(1),PQ(2),D0);
% H3=hpfilter('gaussian',PQ(1),PQ(2),D0);
% g1=dftfilt(f,H1);
% g2=dftfilt(f,H2);
% g3=dftfilt(f,H3);
% subplot(2,2,1);imshow(f,[]);title('Original image');
% subplot(2,2,2);imshow(g1,[]);title('Using ideal high pass filter');
% subplot(2,2,3);imshow(g2,[]);title('Using butterworth high pass filter');
% subplot(2,2,4);imshow(g3,[]);title('Using gaussian high pass filter');


%hpfilter: To generate high pass filters


f=im2double(imread('2.jpg'));
PQ=size(f);
[U, V]=dftuv(PQ(1),PQ(2));
D0=0.05*PQ(2);
F=fft2(f,PQ(1),PQ(2));
Gau=exp(-(U.^2+V.^2)/(2*(D0^2)));
HGau=1-Gau;
g=dftfilt(f,HGau);

D=sqrt(U.^2+V.^2);
id=double(D<=D0);
Hid=1-id;
Idim=dftfilt(f,Hid);

btw=1./(1+(D./D0).^(2*2)); % n=1 
Hbtw=1-btw;
btwim=dftfilt(f,Hbtw);% change to image


subplot(3,3,1); imshow(f); title('Image');
subplot(3,3,2); imshow(fftshift(HGau)); title('Fourier Spectrum Gaussian');
subplot(3,3,3); imshow(g); title('High pass Gaussian');
subplot(3,3,5); imshow(fftshift(Hid)); title('high pass Ideal');
subplot(3,3,6); imshow(Idim); title('Ideal image');
subplot(3,3,8); imshow(fftshift(Hbtw)); title('Butter worth');
subplot(3,3,9); imshow(btwim); title('butter worth image');
