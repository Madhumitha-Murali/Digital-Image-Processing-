clc;
clear all;
close all;

imgclr=imread('pout-dark.jpg')
im1=rgb2gray(imgclr);

%imshow(a)
r=size(im1,1);
c=size(im1,2);
n=r*c;
im1 = imread('pout-dark.jpg');
refimg = imread('pout-bright.jpg');
matched_img = zeros(256,1,'uint8'); 

f1=zeros(256,1);
pdf1=zeros(256,1);
f2=zeros(256,1);
pdf2=zeros(256,1);

cdf1=zeros(256,1);
cum1=zeros(256,1);
out1=zeros(256,1);
cdf2=zeros(256,1);
cum2=zeros(256,1);
out2=zeros(256,1);

for i=1:r
    for j=1:c
        value=im1(i,j);
        f1(value+1)=f1(value+1)+1;
        pdf1(value+1)=f1(value+1)/n;
        
        value=refimg(i,j);
        f2(value+1)=f2(value+1)+1;
        pdf2(value+1)=f2(value+1)/n;
    end
end

sum1=0; sum2=0;
for i=1:256
    sum1=sum1+pdf1(i);
    cum1(i)=sum1;
    cdf1(i)=cum1(i)/n;
    out1(i)=round(cdf1(i)*255);
    
    sum2=sum2+pdf2(i);
    cum2(i)=sum2;
    cdf2(i)=cum2(i)/n;
    out2(i)=round(cdf2(i)*255);
end

% hist1 = imhist(im1); 
% hist2 = imhist(refimg);
% cdf1 = cumsum(hist1) / numel(im1); %compute the cdf of im1
% cdf2 = cumsum(hist2) / numel(refimg); %compute the cdf of im2
 
for idx = 1 : 256
    diff = abs(cdf1(idx) - cdf2);
    [~,ind] = min(diff);
    matched_img(idx) = ind-1;
end
 
 
%matching here
out1 = matched_img(double(im1)+1);
 
subplot(2,3,1),imshow(im1);
title('Pout-Dark');
subplot(2,3,2),imshow(refimg);
title('Pout-Bright');
subplot(2,3,3),imshow(out1);
title('Histogram matched Pout-Dark');
subplot(2,3,4),imhist(im1);
title('Histogram of Pout-Dark');
subplot(2,3,5),imhist(refimg);
title('Histogram of Pout-Bright');
subplot(2,3,6),imhist(out1);
title('Histogram of matched image');

