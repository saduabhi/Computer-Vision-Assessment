clear all
clc
a = imread('ImgPIA.jpg');
figure;
imshow(a);
a = rgb2gray(a);
title('our ImgPIA image')

%transform of our ImgPIA image
B = fft2(a,256,256);
figure;
imshow(B)

% SEGMENTing our ImgPIA INTO four different SECTION 
I = a;
a1=I(1:size(I,1)/2,1:size(I,2)/2,:);subplot(2,2,1);imshow(a1);
subplot(2,2,1);
title('figure1')
a2=I(size(I,1)/2+1:size(I,1),1:size(I,2)/2,:);subplot(2,2,2);imshow(a2);
subplot(2,2,2);
title('figure2')
a3=I(1:size(I,1)/2,size(I,2)/2+1:size(I,2),:);subplot(2,2,3);imshow(a3);
subplot(2,2,3);
title('figure3')
a4=I(size(I,1)/2+1:size(I,1),size(I,2)/2+1:size(I,2),:);subplot(2,2,4);imshow(a4);
subplot(2,2,4);
title('figure4')

%using fourier transform 
B = fft2(a,256,256);
figure;
imshow(B);
B = fftshift(B); % using discrete fourier transform function for four sections
figure;
imshow(B);

% Measuring the min and max value of the transform amplitudes.
min(min(abs(B)))
max(max(abs(B)))
figure;
imshow(abs(B),[0 100]); colormap(jet); colorbar
figure;
imshow(log(1+abs(B)),[0,3]); colormap(jet); colorbar
% Looking at the phases
figure;
imshow(angle(B),[-pi,pi]); colormap(jet); colorbar

%now using inverse of fourier transform
I = ifft2(B,256,256);
figure;
imshow(I);

% using the fourier with inverse function together
B = fft2(a,256,256);
figure;
imshow(B);
B = fftshift(B); % using discrete fourier transform function for four sections
figure;
imshow(B);

% Measuring the min and max value of the transform amplitudes.
min(min(abs(B)))
max(max(abs(B)))
figure;
imshow(abs(B),[0 100]); colormap(jet); colorbar
figure;
imshow(log(1+abs(B)),[0,3]); colormap(jet); colorbar
% Looking for phases
figure;
imshow(angle(B),[-pi,pi]); colormap(jet); colorbar

B = fft2(a,256,256);
figure;
imshow(B);

I = ifft2(B,256,256);
figure;
imshow(I);

% TASK 2 part 1:  selecting the features for both radius and direction
% which is
%described in the Spectral Approach session from the Feature Extraction
%lecture.

figure;
imshow(a);
figure;
%%offset value 2,4,6,8
% My offset =2
offsets = [0 2];
co_curmatrix = graycomatrix(a, 'offset', offsets,'NumLevels', 256, 'Symmetric',true);
subplot(2,2,1);imshow(co_curmatrix); 
title('Angle of deg= 0 degree, offset val 2')

offsets = [-2 2];
co_curmatrix = graycomatrix(a, 'offset', offsets,'NumLevels', 256, 'Symmetric',true);
subplot(2,2,2);imshow(co_curmatrix);
title('Angle of deg= 45 degree, offset val 2')

offsets = [-2 0];
co_curmatrix = graycomatrix(a, 'offset', offsets,'NumLevels', 256, 'Symmetric',true);
subplot(2,2,3);imshow(co_curmatrix);
title('Angle of deg= 90 degree, offset val 2')

offsets = [-2 -2];
co_curmatrix = graycomatrix(a, 'offset', offsets,'NumLevels', 256, 'Symmetric',true);
subplot(2,2,4);imshow(co_curmatrix);
title('Angle of deg= 135 degree, offset val 2')


figure;
% My offset =4
offsets = [0 4];
co_curmatrix = graycomatrix(a, 'offset', offsets,'NumLevels', 256, 'Symmetric',true);
subplot(2,2,1);imshow(co_curmatrix); 
title('Angle of deg= 0 degree, offset val 4')

offsets = [-4 4];
co_curmatrix = graycomatrix(a, 'offset', offsets,'NumLevels', 256, 'Symmetric',true);
subplot(2,2,2);imshow(co_curmatrix);
title('Angle of deg= 45 degree, offset val 4')

offsets = [-4 0];
co_curmatrix = graycomatrix(a, 'offset', offsets,'NumLevels', 256, 'Symmetric',true);
subplot(2,2,3);imshow(co_curmatrix);
title('Angle of deg= 90 degree, offset val 4')

offsets = [-4 -4];
co_curmatrix = graycomatrix(a, 'offset', offsets,'NumLevels', 256, 'Symmetric',true);
subplot(2,2,4);imshow(co_curmatrix);
title('Angle of deg= 135 degree, offset val 4')

figure;
% My offset =6
offsets = [0 6];
co_curmatrix = graycomatrix(a, 'offset', offsets,'NumLevels', 256, 'Symmetric',true);
subplot(2,2,1);imshow(co_curmatrix); 
title('Angle of deg= 0 degree, offset val 6')

offsets = [-6 6];
co_curmatrix = graycomatrix(a, 'offset', offsets,'NumLevels', 256, 'Symmetric',true);
subplot(2,2,2);imshow(co_curmatrix);
title('Angle of deg= 45 degree, offset val 6')

offsets = [-6 0];
co_curmatrix = graycomatrix(a, 'offset', offsets,'NumLevels', 256, 'Symmetric',true);
subplot(2,2,3);imshow(co_curmatrix);
title('Angle of deg= 90 degree, offset val 6')

offsets = [-6 -6];
co_curmatrix = graycomatrix(a, 'offset', offsets,'NumLevels', 256, 'Symmetric',true);
subplot(2,2,4);imshow(co_curmatrix);
title('Angle of deg= 135 degree, offset val 6')


figure;
% My offset =8
offsets = [0 8];
co_curmatrix = graycomatrix(a, 'offset', offsets,'NumLevels', 256, 'Symmetric',true);
subplot(2,2,1);imshow(co_curmatrix); 
title('Angle of deg= 0 degree, offset val 8')

offsets = [-8 8];
co_curmatrix = graycomatrix(a, 'offset', offsets,'NumLevels', 256, 'Symmetric',true);
subplot(2,2,2);imshow(co_curmatrix);
title('Angle of deg= 45 degree, offset val 8')

offsets = [-8 0];
co_curmatrix = graycomatrix(a, 'offset', offsets,'NumLevels', 256, 'Symmetric',true);
subplot(2,2,3);imshow(co_curmatrix);
title('Angle of deg= 90 degree, offset val 8')

offsets = [-8 -8];
co_curmatrix = graycomatrix(a, 'offset', offsets,'NumLevels', 256, 'Symmetric',true);
subplot(2,2,4);imshow(co_curmatrix);
title('Angle of deg= 135 degree, offset val 8')


% plotting the values = ["Degree";"Offset1";"Offset2";"Offset3";"Offset4"];

Degree = [0;45;90;135];
Offset2 = [0 2; -2 2; -2 0; -2 -2];
Offset4 = [0 4; -4 4; -4 0; -4 -4];
Offset6 = [0 6; -6 6; -6 0; -6 -6];
Offset8 = [0 8; -8 8; -8 0; -8 -8];
%T = table("Degree";"Offset2";"Offset4";"Offset6";"Offset8")
T = table(Degree,Offset2,Offset4,Offset6, Offset8)
%writetable(T,'offsetvaltest.xlsx','Sheet',1);

