
close all
clc
%features =[]
a = imread('ImgPIA.jpg');
figure;
b=imhist(a);
imshow(a);
a = rgb2gray(a);
title('our ImgPIA image')

glcm_0_s = graycomatrix(a, 'offset', [0 1],'NumLevels', 256, 'Symmetric', true);
stats_0_s = graycoprops(glcm_0_s,{'contrast','correlation','energy','homogeneity'});
Angsecondmoment0deg = Angularsecondmomentum(glcm_0_s);
invdiffmoment0deg = inversedifferencemoment(glcm_0_s);
figure;
subplot(2,2,1);
imshow(glcm_0_s);
title('deg= 0 , glcm_ 0 _ s _ offset[0 1]')
%title('Angle of deg= 0 degree, offset val 2')


% 
% 
% glcm_0_ns = graycomatrix(a, 'offset', [0 1], 'NumLevels', 256,'Symmetric', false);
% stats_0_ns = graycoprops(glcm_0_ns,{'contrast','correlation','energy','homogeneity'});
% Angsecondmoment0deg = Angularsecondmomentum(glcm_0_ns);
% invdiffmoment0deg = inversedifferencemoment(glcm_0_ns);
% figure;
% subplot(2,2,1);
% imshow(glcm_0_ns);
% title('deg= 0, glcm_ 0 _ ns _ offset[0 1]')
% 



glcm_45_s = graycomatrix(a, 'offset', [-1 1],'NumLevels', 256, 'Symmetric', true);
stats_45_s = graycoprops(glcm_45_s,{'contrast','correlation','energy','homogeneity'});
Angsecondmoment45deg = Angularsecondmomentum(glcm_45_s);
invdiffmoment45deg = inversedifferencemoment(glcm_45_s);
figure;
subplot(2,2,2);
imshow(glcm_45_s);
title('deg= 45 , glcm_ 0 _ s _ offset[-1 1]')
%title('Angle of deg= 0 degree, offset val 2')


% 
% glcm_45_ns = graycomatrix(a, 'offset', [-1 1], 'NumLevels', 256,'Symmetric', false);
% stats_45_ns = graycoprops(glcm_45_ns,{'contrast','correlation','energy','homogeneity'});
% Angsecondmoment45deg = Angularsecondmomentum(glcm_45_ns);
% invdiffmoment45deg = inversedifferencemoment(glcm_45_ns);
% figure;
% subplot(2,2,2);
% imshow(glcm_45_ns);
% title('deg= 45, glcm_ 0 _ ns _ offset[-1 1]')



glcm_90_s = graycomatrix(a, 'offset', [-1 0],'NumLevels', 256, 'Symmetric', true);
stats_90_s = graycoprops(glcm_90_s,{'contrast','correlation','energy','homogeneity'});
Angsecondmoment90deg = Angularsecondmomentum(glcm_90_s);
invdiffmoment90deg = inversedifferencemoment(glcm_90_s);
figure;
subplot(2,2,3);
imshow(glcm_90_s);
title('deg= 90 , glcm_ 0 _ s _ offset[-1 0]')
%title('Angle of deg= 0 degree, offset val 2')

% 
% 
% glcm_90_ns = graycomatrix(a, 'offset', [-1 0], 'NumLevels', 256,'Symmetric', false);
% stats_90_ns = graycoprops(glcm_90_ns,{'contrast','correlation','energy','homogeneity'});
% Angsecondmoment90deg = Angularsecondmomentum(glcm_90_ns);
% invdiffmoment90deg = inversedifferencemoment(glcm_90_ns);
% figure;
% subplot(2,2,3);
% imshow(glcm_90_ns);
% title('deg= 90, glcm_ 0 _ ns _ offset[-1 0]')
% 



glcm_135_s = graycomatrix(a, 'offset', [-1 -1],'NumLevels', 256, 'Symmetric', true);
stats_135_s = graycoprops(glcm_135_s,{'contrast','correlation','energy','homogeneity'});
Angsecondmoment135deg = Angularsecondmomentum(glcm_135_s);
invdiffmoment135deg = inversedifferencemoment(glcm_135_s);
figure;
subplot(2,2,3);
imshow(glcm_135_s);
title('deg= 135 , glcm_ 0 _ s _ offset[-1 -1]')
%title('Angle of deg= 0 degree, offset val 2')



% 
% glcm_135_ns = graycomatrix(a, 'offset', [-1 -1], 'NumLevels', 256,'Symmetric', false);
% stats_135_ns = graycoprops(glcm_135_ns,{'contrast','correlation','energy','homogeneity'});
% Angsecondmoment135deg = Angularsecondmomentum(glcm_135_ns);
% invdiffmoment135deg = inversedifferencemoment(glcm_135_ns);
% figure;
% subplot(2,2,3);
% imshow(glcm_135_ns);
% title('deg= 135, glcm_ 0 _ ns _ offset[-1 -1]')
% 




%stats_0_s = graycoprops(glcm_0_s,{'contrast','correlation','energy','homogeneity'});


%features= ['contrast','correlation','energy','homogeneity']
%bar(features)