function v=hmean(A)
A=im2double(A);
[m n]=size(A);
v=m*n./imfilter(1./(g+eps),ones(m,n),'replicate');
end
