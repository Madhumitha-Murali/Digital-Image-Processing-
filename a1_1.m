imgclr=imread('lena.jpg');
figure,imshow(imgclr);

J=(zeros(512,512));

for i=1:100

J = J+double(imnoise(imgclr,'gaussian',rand()*(-1)^randi([-2 1],1,1)));

end

meanimg=uint8(J/100);

 figure,imshow(meanimg);

meanimg


% I0 = imread('0.1s_1.tif')
% sumImage = double(I0); % Inialize to first image.
% for i=2:10 % Read in remaining images.
%   rgbImage = imread(['0.1s_',num2str(i),'.tif']));
%   sumImage = sumImage + double(rgbImage);
% end;
% meanImage = sumImage / 10;