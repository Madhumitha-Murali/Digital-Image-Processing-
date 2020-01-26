clc
clear all
close all
i1=imread('cameraman.jpg');%read the image
i=rgb2gray(i1);
figure,imshow(i);

%Scale-Down-NN

scale=2;

[r,c]=size(i);

is=uint8(zeros(scale*r,scale*c));

for count1 = 1:scale*r
 
 for count2 = 1:scale*c
 
 is(count1,count2) = i(uint8(count1/scale),uint8(count2/scale));
 
 end
 
end

figure,imshow(is);
