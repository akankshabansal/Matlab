function Testthin

IterThinning = 100 ;
Im = imread('girl.jpeg') ;
Image=Im;
if isbw(Image) == 0
    Image = im2bw( Image ) ;
end
Raw = Image ;

for Iter = 1:IterThinning
    OutBW1 = Condition1( Image, 0 ) ;
    OutBW2 = Condition2( OutBW1, 0 ) ;
    Image = OutBW2 ;
end


I = bwmorph(Raw, 'thin',IterThinning );
close all ;
subplot(2,2,1),imshow( Im ) ;
subplot(2,2,2),imshow( Raw ) ;
subplot(2,2,3),imshow( I ) ;
subplot(2,2,4),imshow( OutBW2 ) ;