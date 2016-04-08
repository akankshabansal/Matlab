s=imread('2.jpg');

%Gaussian Noise
g = imnoise(s, 'gaussian');

arith_mean = fspecial('average', [5 5]);
arith_filtered = imfilter(g, arith_mean);

med_filt = medfilt2(g, [5 5]);

max = ordfilt2(g, 3*3, ones(3, 3));
min = ordfilt2(g, 1, ones(3, 3));
midpt_filt = (max + min) * 0.5;

figure(1);
subplot(5, 2, 1), imshow(s);title('Original Image');
subplot(5, 2, 2), imhist(s);
subplot(5, 2, 3), imshow(g);title('With Gaussian Noise');
subplot(5, 2, 4), imhist(g);
subplot(5, 2, 5), imshow(med_filt);title('Corrected using Median(5) Filter');
subplot(5, 2, 6), imhist(med_filt);
subplot(5, 2, 7), imshow(arith_filtered);title('Corrected using Arith. Mean Filter');
subplot(5, 2, 8), imhist(arith_filtered);
subplot(5, 2, 9), imshow(midpt_filt);title('Corrected with Mid Point Filter');
subplot(5, 2, 10), imhist(midpt_filt);


%Salt and Pepper (Impulse) Noise
g1 = imnoise(s, 'salt & pepper');

max_filter = ordfilt2(g1, 3*3, ones(3, 3));
min_filter = ordfilt2(g1, 1, ones(3, 3));
med_filt1 = medfilt2(g1, [5 5]);


figure(2);
subplot(5, 2, 1), imshow(s);title('Original Image');
subplot(5, 2, 2), imhist(s);
subplot(5, 2, 3), imshow(g1);title('With Salt & Pepper Noise');
subplot(5, 2, 4), imhist(g1);
subplot(5, 2, 5), imshow(med_filt1);title('Corrected using Median(5) Filter');
subplot(5, 2, 6), imhist(med_filt1);
subplot(5, 2, 7), imshow(max_filter);title('Corrected using Max Filter');
subplot(5, 2, 8), imhist(max_filter);
subplot(5, 2, 9), imshow(min_filter);title('Corrected using Min Filter');
subplot(5, 2, 10), imhist(min_filter);

%Rayleigh Noise
[M N]=size(s);
R=imnoise2('rayleigh',M,N,0.05,0.05);
B=im2double(s);
ray_n=B.*R;

arith_mean_r = fspecial('average', [5 5]);
arith_filtered_r = imfilter(ray_n, arith_mean_r);

ray_d = im2double(ray_n);

geo_filtered_r = exp(imfilter(log(ray_d), ones(3, 3), 'replicate')).^(1/3/3);

med_filt_r = medfilt2(ray_n, [5 5]);
max_r = ordfilt2(ray_n, 3*3, ones(3, 3));
min_r = ordfilt2(ray_n, 1, ones(3, 3));
midpt_filt_r = (max_r + min_r) * 0.5;

figure(3);
subplot(5, 2, 1), imshow(ray_n);title('Original Image(with Rayleigh Noise)');
subplot(5, 2, 2), imhist(ray_n);
subplot(5, 2, 3), imshow(arith_filtered_r);title('Corrected using Arith. Mean Filter');
subplot(5, 2, 4), imhist(arith_filtered_r);
subplot(5, 2, 5), imshow(geo_filtered_r);title('Corrected using Geom. Mean Filter');
subplot(5, 2, 8), imhist(geo_filtered_r);
subplot(5, 2, 7), imshow(max_r);title('Corrected using Max Filter');
subplot(5, 2, 8), imhist(max_r);
subplot(5, 2, 9), imshow(med_filt_r);title('Corrected using Median(5) Filter');
subplot(5, 2, 10), imhist(med_filt_r);


%Uniform Noise
[M N]=size(s);
R=imnoise2('uniform',M,N,0.1,0.05);
B=im2double(s);
uni=B.*R;

arith_mean_u = fspecial('average', [5 5]);
arith_filtered_u = imfilter(uni, arith_mean_u);

uni_d = im2double(uni);

geo_filtered_u = exp(imfilter(log(uni_d), ones(3, 3), 'replicate')).^(1/3/3);

med_filt_u = medfilt2(uni, [5 5]);

max_u = ordfilt2(uni, 3*3, ones(3, 3));
min_u = ordfilt2(uni, 1, ones(3, 3));
midpt_filt_u = (max_u + min_u) * 0.5;

figure(5);
subplot(3, 2, 1), imshow(s);title('Original Image');
subplot(3, 2, 2), imshow(uni);title('Original Image(with Uniform Noise)');
subplot(3, 2, 3), imhist(uni);
%subplot(3, 2, 3), imshow(arith_filtered_u);title('Corrected using Arith. Mean Filter');
subplot(3, 2, 4), imshow(geo_filtered_u);title('Corrected using Geom. Mean Filter');
subplot(3, 2, 5), imshow(med_filt_u);title('Corrected using Median(5) Filter');
subplot(3, 2, 6), imshow(midpt_filt_u);title('Corrected using Mid Point Filter');

%Exponential Noise
[M N]=size(s);
R=imnoise2('exponential',M,N,2,0.05);
B=im2double(s);
nexp=B.*R;

arith_mean_e = fspecial('average', [5 5]);
arith_filtered_e = imfilter(nexp, arith_mean_e);

nexp_e = im2double(nexp);

geo_filtered_e = exp(imfilter(log(nexp_e), ones(3, 3), 'replicate')).^(1/3/3);

med_filt_e = medfilt2(nexp, [5 5]);

max_e = ordfilt2(nexp, 3*3, ones(3, 3));
min_e = ordfilt2(nexp, 1, ones(3, 3));
midpt_filt_e = (max_e + min_e) * 0.5;

figure(6);
subplot(3, 2, 1), imshow(s);title('Original Image');
subplot(3, 2, 2), imshow(nexp);title('Original Image(with Exponential Noise)');
subplot(3, 2, 3), imhist(nexp);
%subplot(3, 2, 3), imshow(arith_filtered_e);title('Corrected using Arith. Mean Filter');
subplot(3, 2, 4), imshow(geo_filtered_e);title('Corrected using Geom. Mean Filter');
subplot(3, 2, 5), imshow(med_filt_e);title('Corrected using Median(5) Filter');
subplot(3, 2, 6), imshow(midpt_filt_e);title('Corrected using Mid Point Filter');
