imgclr=imread('Lena_colour.jpg');
figure,imshow(imgclr);


[A,B,C]=imsplit(imgclr);

a=A;


r=size(a,1);
c=size(a,2);
ah=uint8(zeros(r,c));
bh=uint8(zeros(r,c));
ch=uint8(zeros(r,c));
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


he=histeq(A);

a=B;


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
        bh(i,j)=out(a(i,j)+1);
    end
end


he1=histeq(B);

a=C;


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
        ah=he;
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
        ch(i,j)=out(a(i,j)+1);
    end
end


he2=histeq(C);
subplot(8,1,1),imshow(ah);
title('Red');
subplot(8,1,2),imshow(bh);
title('Green');
subplot(8,1,3),imshow(ch);
title('Blue');
finalrgb=cat(3,ah,bh,ch);
subplot(8,1,4),imshow(finalrgb);
title('Final Using Own Function');

subplot(8,1,5),imshow(he);
title('Red');
subplot(8,1,6),imshow(he1);
title('Green');
subplot(8,1,7),imshow(he2);
title('Blue');
finalrgb1=cat(3,he,he1,he2);
subplot(8,1,8),imshow(finalrgb1);
title('Final - Using Inbuilt Function');
figure,imshow(finalrgb1);title('Final Output');
