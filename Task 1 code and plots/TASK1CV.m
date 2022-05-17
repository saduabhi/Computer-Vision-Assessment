close all
clc
%reading the files of skin lesion dataset of org images and GT images
Org_folder = dir('org data\*.jpg');
GT_folder=dir('GT\*.png');
for i=1:numel(Org_folder)
    basefile = Org_folder(i);
    fullfilename = fullfile(basefile.folder, basefile.name);
    file_segment = GT_folder(i);
    
    disp(fullfilename);
    filenamesegment=fullfile(file_segment.folder,file_segment.name);
    segmentimages=imread(filenamesegment);
    segment=logical(segmentimages);
    I = imread(fullfilename);
    Grayscaleimage=rgb2gray(I)
%     subplot(1,3,2)
%     imshow(Grayscaleimage)
    
    Binaryimage= im2bw(Grayscaleimage)
    compliment=imcomplement(Binaryimage)
%     subplot(1,3,3)
    imshow(compliment)
    impixelinfo
    imwrite(compliment,basefile.name)
    k(i)=dice(compliment,segment)
end
mean_value=mean(k)
std_devia=std(k)
bar(k)
Org_folder = Org_folder(~[Org_folder.isdir]);
Org_folder = {Org_folder.name}
dicescore1= categorical(Org_folder);
dice_similarity1= categorical(k(i))
bar(dicescore1,k())
xlabel('Total_Number_of_images')
ylabel('DICE-SCORES')
