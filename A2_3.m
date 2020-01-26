clc
clear all
close all

imgclr=zeros(200,200);
%figure,imshow(imgclr);
imgres=zeros(200,200);
imgcol=zeros(200,200);
imgd1=zeros(200,200);
imgd2=zeros(200,200);


%Initialisation

for i=50:150
    for j=50:150
imgclr(i,j)=100;
    end
end

figure,imshow(imgclr);title('Original image');

rsum=zeros(200,1);
csum=zeros(1,200);
d1sum=zeros(1,200);
d2sum=zeros(1,200);
dd2sum=zeros(1,199);
d1sum=zeros(1,200);
dd1sum=zeros(1,199);

for i=1:200
    for j=1:200
        csum(j)=csum(j)+imgclr(i,j);
    end
end

csum

for i=1:200
    for j=1:200
        rsum(i)=rsum(i)+imgclr(i,j);
    end
end

rsum

for i=1:200
    j=200-i+1;
    k=1;
    while(j<=200)
        d2sum(200-i+1)=d2sum(200-i+1)+imgclr(k,j);
        j=j+1;
        k=k+1;
    end
end

d2sum

for i=1:199
    j=1;
    k=i+1;
    while((j<=199)&&(k<=200))
        dd2sum(i)=dd2sum(i)+imgclr(k,j);
        k=k+1;
        j=j+1;
    end
end

dd2sum

for i=1:200
    j=1;
    k=i;
    while((k>=1)&&(j<=200))
        d1sum(i)=d1sum(i)+imgclr(j,k);
        j=j+1;
        k=k-1;
    end
end

d1sum

for i=1:199
    j=200;
    k=i;
    while((k<=200)&&(j>=2))
        dd1sum(i)=dd1sum(i)+imgclr(k,j);
        j=j-1;
        k=k+1;
    end
end

dd1sum


%Result of Row Sum
for i=1:200
    for j=1:200
        imgres(i,j)=rsum(i);
    end
end

%Result of Column Sum
for i=1:200
    for j=1:200
        imgcol(i,j)=csum(j);
    end
end

%Result of Diagonal 2 Sum - Upper Triangle
for i=1:200
    
    j=200-i+1;
    k=1;
    while(j<=200)
        imgd2(k,j)=d2sum(200-i+1);
        j=j+1;
        k=k+1;
    end
end

%Result of Diagonal 2 Sum - Lower Triangle
for i=1:199
    
    j=1;
    k=i+1;
    while((j<=200-1)&&(k<=200))
        imgd2(k,j)=imgd2(k,j)+dd2sum(i);
        j=j+1;
        k=k+1;
    end
end

% %Result of Diagonal 1 Sum - Upper Triangle
for i=1:200
    j=1;
    k=i;
    while((k>=1)&&(j<=200))
        imgd1(j,k)=imgd1(j,k)+d1sum(i);
        j=j+1;
        k=k-1;
    end
end

%Result of Diagonal 1 Sum - Lower Triangle
for i=1:199
    j=200;
    k=i+1;
    while((k<=200)&&(j>=2))
        imgd1(k,j)=imgd1(k,j)+dd1sum(i);
        j=j-1;
        k=k+1;
    end
end

imgfinal=zeros(200,200);

for i=1:200
    for j=1:200
        imgfinal(i,j)=imgres(i,j)+imgcol(i,j)+imgd1(i,j)+imgd2(i,j);
        
    end
end
 
imgfinal=mat2gray(imgfinal,[5200,40400]);


figure,imshow(imgres);title('Back Projection Across Rows');
figure,imshow(imgcol);title('Back Projection Across Columns');
figure,imshow(imgd2);title('Back Projection Across Diagonal - 135');
figure,imshow(imgd1);title('Back Projection Across Diagonal - 45');
figure,imshow(imgfinal);title('Final Back Projected Image');
    

