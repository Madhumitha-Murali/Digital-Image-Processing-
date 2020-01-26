clc
clear all
close all
i1=imread('cameraman.jpg');%read the image
i=rgb2gray(i1);
figure,imshow(i);


scale = [0.5 0.5];               %# The resolution scale factors: [rows columns]
os = size(i)                  %# Get the size of your image
ns = floor(scale.*os)        %# Compute the new image size

%# Compute an upsampled set of indices:

rowIndex = min(round(((1:ns(1))-0.5)./scale(1)+0.5),os(1));
colIndex = min(round(((1:ns(2))-0.5)./scale(2)+0.5),os(2));

%# Index old image to get new image:

outputImage = i(rowIndex,colIndex,:);

figure,imshow(outputImage);