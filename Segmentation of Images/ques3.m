a=imread('bottles.tif');
i = imread('bottles.tif');
img = i;
filled_pixel = i(200,170);
[m n]= size(i);
for j=1:m
    for k=1:n
        if (i(j,k)-filled_pixel)>60
            i(j,k)=255;
        else
            i(j,k)=0;
        end
    end
end
figure(1)
imshow(i);title('Binary Image to show the contents of the Bottle');
x = 78;
flag=0;
    for w=220:290
          if i(x,w)~=255;
             flag=1;
          end
    end
 error = 'bottles.tif';
if flag==0
    figure(4)
    imshow(error);title('Bottle not filled compeletly:Error');
end
figure(2);
subplot(2,2,1), imshow(img);
subplot(2,2,2), imhist(img);
subplot(2,2,3), imshow(i);
subplot(2,2,4), imhist(i);
