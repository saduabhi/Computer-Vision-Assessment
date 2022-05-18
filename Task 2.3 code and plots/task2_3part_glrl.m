clear all
clc
a = imread('ImgPIA.jpg');
figure
imshow(a)

a = rgb2gray(a);
title('OriginalImage')
Im = a;
a1=Im(1:size(Im,1)/2,1:size(Im,2)/2,:);subplot(2,2,1);imshow(a1);
subplot(2,2,1);
title('figure1')
a2=Im(size(Im,1)/2+1:size(Im,1),1:size(Im,2)/2,:);subplot(2,2,2);imshow(a2);
subplot(2,2,2);
title('figure2')
a3=Im(1:size(Im,1)/2,size(Im,2)/2+1:size(Im,2),:);subplot(2,2,3);imshow(a3);
subplot(2,2,3);
title('figure3')
a4=Im(size(Im,1)/2+1:size(Im,1),size(Im,2)/2+1:size(Im,2),:);subplot(2,2,4);imshow(a4);
subplot(2,2,4);
title('figure4')

image1= a4 %imcrop(image);
image2=image1(1:128,1:128);
image2=double(image2);
[e,f]=size(image2);

% --------- bit-depth image------------------
bit_size = 16; % 4 bits - 16, 6 bits - 32, 8 bits - 64, 

Image_max=max(max(image2));
Image_min=min(min(image2));
newimage=image2-Image_min;
New_max=max(max(newimage));
New_min=min(min(newimage));
Q=round(New_max/bit_size);
[e,f]=size(newimage);
Quant=0;
for i=1:e
    for j=1:f
        Im = newimage(i,j);
        for B = 1:bit_size
            if (Im>Quant)&(Im<=Quant+Q)
                newimage(i,j)=B/bit_size;
                Quant=Quant+Q;
            end            
        end
    end
end
newim_max=max(max(newimage));
newim_1=newimage/newim_max;
newim_2=round(newim_1*bit_size)+1;
dir=0; 
dist1=1;
if (dir == 1)
    newim_2=newim_2';
end
cx = max(max(newim_2));
cn = min(min(newim_2));
hl = (cx-cn)+1;
[k,l] = size(newim_2);
f=k*l;
count=1;
e=1;
col=1;
glrl(cx,k)=0;
maxcount(k*l)=0;
mc=0;

%---------------------using the glrl matrix---------------
for j=1:k
    for k=1:l-dist1
        mc=mc+1;
        g=newim_2(j,k);
        a=newim_2(j,k+dist1);
        if (g==a)&(g~=0)
            count=count+1;
            e=count;
            col=count;
            maxcount(mc)=count;
        else glrl(g,e)=glrl(g,e)+1;col=1;
            count=1;
            e=1;
        end
    end
    glrl(a,col)=glrl(a,col)+1;
    count=1;
    e=1;
end
Im=(cx:cn);
e=glrl(cn:cx,:);
m1=e';
maxrun=max(max(maxcount));
S=0;
G(hl)=0;
R(l)=0;
for u=1:hl
    for v=1:l
        G(u)=G(u)+e(u,v);
        S=S+e(u,v);
    end
end
for u1=1:l
    for v1=1:hl
        R(u1)=R(u1)+m1(u1,v1);
    end
end
[dim,dim1]=size(G);
Short_Run_Emphasis=0; LRE=0; Gray_level_NonUniformity=0; RLN=0; Run_Percentage=0; low_gray_level_run_emphasis=0; high_gray_level_run_emphasis=0;
for h1= 1:maxrun
    Short_Run_Emphasis=Short_Run_Emphasis+(R(h1)/(h1*h1));
    LRE=LRE+(R(h1)*(h1*h1));
    RLN=RLN+(R(h1)*R(h1));
    Run_Percentage=Run_Percentage+R(h1);
end
ShortRE1=Short_Run_Emphasis/S;
LongRE1=LRE/S;
RunLN1=RLN/S;
RunPer1=Run_Percentage/f;
for h2=1:hl
    Gray_level_NonUniformity=(Gray_level_NonUniformity+G(h2)^2);
    low_gray_level_run_emphasis=low_gray_level_run_emphasis+(G(h2)/(h2*h2));
    high_gray_level_run_emphasis=high_gray_level_run_emphasis+(h2*h2)*G(h2);
end
GrayLevelNon_1=Gray_level_NonUniformity/S;
LowGREY_level1=low_gray_level_run_emphasis/S;
High_gray_level_run1=high_gray_level_run_emphasis/S;
clc

% ---------------------------DISPLAY THE PARAMETERS------------------------



disp(sprintf('%6.4f',ShortRE1))
disp(sprintf('%6.4f',LongRE1))
disp(sprintf('%6.4f',GrayLevelNon_1))
disp(sprintf('%6.4f',RunPer1))
disp(sprintf('%6.4f',RunLN1))
disp(sprintf('%6.4f',LowGREY_level1))
disp(sprintf('%6.4f',High_gray_level_run1))
