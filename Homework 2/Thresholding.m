clc;
clear all;
image = imread('image.bmp');
image_size = size(image);
%max_intensity = max(max(image));
meanIntensity = mean(mean(image));  
for i = 1:948 
    for j = 1:1268
        if image(i,j) >= meanIntensity
            tempImage(i,j) = 1;
        else
            tempImage(i,j) = 0;
        end
     end
end

imshowpair(image,tempImage,'montage');