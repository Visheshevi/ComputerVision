clc;
clear all;
original_image = imread('image.bmp');
c = min(min(original_image));
d = max(max(original_image));
L = 256;
p = zeros(1,256);
total_pixels = 948 * 1268;

for i = 1:948
    for j = 1:1268
        temp = original_image(i,j);
        p(1,temp) = p(1,temp) + 1;
    end
end
sum = 0;

for i = 1:256
    p(1,i) = double(p(1,i)/total_pixels);
    sum = sum + p(1,i);
    cdf(i) = sum;
end



for i = 1:948
    for j = 1:1268
        new_image(i,j) = floor((L-1)*cdf(original_image(i,j))) ;
    end
end
imshowpair(original_image,new_image,'montage');
