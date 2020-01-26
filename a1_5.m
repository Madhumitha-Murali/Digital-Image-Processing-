imgclr=imread('pout-dark.jpg');
a=rgb2gray(imgclr);

imshow(a)
r=size(a,1);
c=size(a,2);
ah=uint8(zeros(r,c));
n=r*c;
f=zeros(256,1);
pdf=zeros(256,1);
cdf=zeros(256,1);
cum=zeros(256,1);
out=zeros(256,1);

for i=1:r
    for j=1:c
        value=a(i,j);
        f(value+1)=f(value+1)+1;
        pdf(value+1)=f(value+1)/n;
    end
end

sum=0; L=255;

for i=1:256
    sum=sum+f(i);
    cum(i)=sum;
    cdf(i)=cum(i)/n;
    out(i)=round(cdf(i)*255);
end

for i=1:r
    for j=1:c
        ah(i,j)=out(a(i,j)+1);
    end
end

out
he=histeq(a);

subplot(3,1,1),imshow(a);
title('Pout-Dark');
subplot(3,1,2),imshow(ah);
title('Pout-Dark after Equalization');
subplot(3,1,3),imshow(he);
title('Histogram eq using pre-defined function Pout-Dark');
