a = imread('2.jpg');
b = a(1:10 , 1:10);
low = 0.0;
high = 1.0;
[m n] = size(b);
h=imhist(b);
[count x] = imhist(b);
p = count./(m*n);
low_arr = zeros(1,256);
high_arr = zeros(1,256);
high_arr(1) = p(1);
for i=2:256
    low_arr(i) = high_arr(i-1);
    high_arr(i) = low_arr(i) + p(i);
end
b_flat = b(:);
for i=1:size(b_flat, 1)
    range= high-low;
    temp = low;
    low = low + range*(low_arr(b_flat(i)+1));
    high = temp + range*(high_arr(b_flat(i)+1));
end
low = vpa(low,50);
save low ;
