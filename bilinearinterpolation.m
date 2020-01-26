clc;
clear all;
close all;
img2=imread('lena.jpg');
img=imresize(img2,[256,256]);
[r,c]=size(img);
fac=2;%factor of resizing
for i=0:(fac*r-1)
    for j=0:(fac*c-1)
        x=i/fac;
        y=j/fac;
        a=floor(x);
        b=floor(y);
        if mod(x,1)==0 && mod(y,1)==0
            res(i+1,j+1)=img(x+1,y+1);
        else if mod(x,1)==0 && mod(y,1)~=0
                k=y-b;
                if b+2>=c
                    b=c-2;
                end
                pel1=img(x+1,b+1);
                pel2=img(x+1,b+2);
                l=k*pel2+(1-k)*pel1;
                res(i+1,j+1)=uint8(round(l));
            else if mod(x,1)~=0 && mod(y,1)==0
                    m=x-a;
                    if a+2>=r
                        a=r-2;
                    end
                    pel3=img(a+1,y+1);
                    pel4=img(a+2,y+1);
                    n=m*pel4+(1-m)*pel3;
                    res(i+1,j+1)=uint8(round(n));
                else if mod(x,1)~=0 && mod(y,1)~=0
                        if a+2>=r
                        a=r-2;
                        end
                        if b+2>=c
                            b=c-2;
                        end
                        tl=img(a+1,b+1);
                        tr=img(a+1,b+2);
                        bl=img(a+2,b+1);
                        br=img(a+2,b+2);
                        breadth=y-b;
                        height=x-a;
                        k=1-height;
                        l=1-breadth;
                        pel=k*l*tl+k*breadth*tr+height*l*bl+height*breadth*br;
                        pel=round(pel);
                        res(i+1,j+1)=uint8(pel);
                    end
                end
            end
        end
    end
end
figure;imshow(img);title('original image');
figure;imshow(res);title('new image');