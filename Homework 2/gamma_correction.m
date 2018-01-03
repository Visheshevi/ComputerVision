clc;
clear all;
original_image = imread('image.bmp');
original_image = double(original_image);
c = min(min(original_image));
d = max(max(original_image));
factor = (d-c)/(d+c);
gamma = 0.3;

for i = 1:948
    for j = 1:1268
        new_image(i,j) = factor * (original_image(i,j) ^ gamma);
    end
end

imshowpair(original_image,new_image,'montage')