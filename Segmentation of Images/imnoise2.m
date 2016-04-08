function [ R ] = imnoise2( type, M,N,a,b )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

if nargin ==1
    a=0; b=1;
    M=1;N=1;
elseif nargin==3
    a=0;b=1;
end

switch lower(type)
    case 'uniform'
        R=a+(b-a)*randn(M,N);
    case 'gaussian'
        R=a+b*randn(M,N);
    case 'salt & pepper'
%         if nargin <=3
%             a=0.05;b=0.05;
%         end
%         if(a+b)>1
%             error('The sum of Pa and Pb must not exceed 1.');
%         end
%         R(1:M,1:N)=0.5;
%         X=rand(M,N);
%         c=find(X<=a);
%         R(c)=0;
%         u=a+b;
%         c=find(X>a & X<=u);
%         R(c)=1;  
    case 'rayleigh'
        R=a+(-b*log(1-rand(M,N))).^0.5;
    case 'exponential'
        if nargin<=3
            a=1;
        end
        if a<=0
            error('Parameter a must be positive dor exponential type.');
        end
        k=-1/a;
        R=k*log(1-rand(M,N));
    case 'erlang'
        if nargin<=3
            a=2;b=5;
        end
        k=-1/a;
        R=zeros(M,N);
        for j=1:b
            R=R+k*log(a-rand(M,N));
        end
    otherwise
        error('Unkown distribution type');
end

