clc
clear all
close all

imgclr=imread('lena.jpg');
figure,imshow(imgclr);

a=imnoise(imgclr,'salt & pepper',0.1);
figure,imshow(a);

p=input('Enter the size of kernel of median filter, (n for nxn matrix):'); %specify the window size

pad=uint8(zeros(size(a)+(p-1)));

%loop for padding the zeros
for x=1:size(a,1)
            for y=1:size(a,2)
                pad(x+p-1,y+p-1)=a(x,y); 
            end
end 

out=zeros(size(a));

 for i= 1:size(pad,1)-(p-1)
    for j=1:size(pad,2)-(p-1)
        window=uint8(ones((p)^2,1)); 
        t=1;
        for x=1:p
          for y=1:p
                window(t)=pad(i+x-1,j+y-1);
                t=t+1;
          end
        end
        filt=sort(window);
        out(i,j)=filt((t)/2);
    end
 end
 
 figure,imshow(out); %show the final recovered image
 
 pad;
 out