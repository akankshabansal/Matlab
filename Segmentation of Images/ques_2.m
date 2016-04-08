i = imread('SegmentationImage.png');
%figure(1)
mask = fspecial('average');
i=imfilter(i,mask);

subplot(2,2,1),imshow(i);title('Original Image');
subplot(2,2,2),imhist(i);title('Histogram of the Image');
 
for x=1:64
    for y=1:64
        if i(x,y) <=105
            i(x,y)=0;
        else
            i(x,y)=255;
        end
    end
end
%figure(2)
%imshow(i)
for x=1:64
    for y=65:128
        if i(x,y) <=120
            i(x,y)=0;
        else
            i(x,y)=255;
        end
    end
end
%figure(3)
%imshow(i);
for x=1:64
    for y=129:196
        if i(x,y) <=180
            i(x,y)=0;
        else
            i(x,y)=255;
        end
    end
end
%figure(4)
%imshow(i);
for x=1:64
    for y=197:256
        if i(x,y) <=1200
            i(x,y)=0;
        else
            i(x,y)=255;
        end
    end
end
%figure(5)
%imshow(i);
for x=65:128
 
    for y=1:64
        if i(x,y) <=105
            i(x,y)=0;
        else
            i(x,y)=255;
        end
    end
end
%figure(7)
%imshow(i)
for x=65:128
    for y=65:128
        if i(x,y) <=120
 
            i(x,y)=0;
        else
            i(x,y)=255;
        end
    end
end
%figure(8)
%imshow(i);
for x=65:128
    for y=129:196
        if i(x,y) <=180
 
            i(x,y)=0;
        else
            i(x,y)=255;
        end
    end
end
for x=65:128
    for y=197:256
        if i(x,y) <=1200
 
            i(x,y)=0;
        else
            i(x,y)=255;
        end
    end
end
for x=129:196
 
    for y=1:64
        if i(x,y) <=105
            i(x,y)=0;
        else
            i(x,y)=255;
        end
    end
end
%figure(7)
%imshow(i)
for x=129:196
    for y=65:128
        if i(x,y) <=120
 
            i(x,y)=0;
        else
            i(x,y)=255;
        end
    end
end
%figure(8)
%imshow(i);
for x=129:196
    for y=129:196
        if i(x,y) <=180
 
            i(x,y)=0;
        else
            i(x,y)=255;
        end
    end
end
for x=129:196
    for y=197:256
        if i(x,y) <=1200
 
            i(x,y)=0;
        else
            i(x,y)=255;
        end
    end
end
for x=197:256
    for y=1:256  
        i(x,y)=0;
    end
end
%figure(9)
subplot(2,2,3),imshow(i);
