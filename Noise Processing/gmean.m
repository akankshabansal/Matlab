function v=gmean(A)
A=im2double(A);
mn=size(A,1);
v=prod(A,1).^(1/mn);