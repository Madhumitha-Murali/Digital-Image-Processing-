% function s=sorting(kernel,t)
% % kernel=[3 2 1 4];
% % t=4;
% 
% 
% 
% end

clc
clear all
close all
i=imread('lena.jpg'); %read the image
% i=rgb2gray(i); %convert the rgb image to grayscale image
figure,imshow(i),title('Original image');  %show the original image
i=imnoise(i,'salt & pepper',0.05); %add S n P noise to original image 
figure,imshow(i),title('Corrupted image'); %show the corrupted  image 
p=input('Enter the size of kernel of median filter, (n for nxn matrix):'); %specify the kernel size
pad=uint8(zeros(size(i)+(p-1))); %padding the zeros
%loop for padding the zeros
for x=1:size(i,1)
            for y=1:size(i,2)
                pad(x+p-1,y+p-1)=i(x,y); 
            end
end 
%loop for finding the median & replacing the central pixel
 for i= 1:size(pad,1)-(p-1)
    for j=1:size(pad,2)-(p-1)
        kernel=uint8(ones((p)^2,1)); 
        t=1;
        for x=1:p
          for y=1:p
                kernel(t)=pad(i+x-1,j+y-1);
                t=t+1;
          end
        end
 for u=1:t
    for v=1:u
        if((v+1<t)&&(kernel(v)>kernel(v+1)))
            temp=kernel(v+1);
            kernel(v+1)=kernel(v);
            kernel(v)=temp;
        end
    end
end
        out(i,j)=kernel((t)/2);
    end
 end
figure,imshow(out),title('Output Image'); %show the final recovered image