clc;
clear all;
original_image = imread('image.bmp');
a = 0;
b = 255;
c = min(min(original_image));
d = max(max(original_image));
range = d-c;
limit = double((double(range)/100)*5);


factor = (d - c)/(d + c);
for i = 1:948
    for j = 1:1268
        if((((original_image(i,j) - factor)*(b - a)/(d - c)) + a)>= 0)
            if((original_image(i,j)>(c +limit) || original_image(i,j)<(d - limit)))
                part1 = (original_image(i,j) - factor);
                const = (b - a)/(d - c);
                fina = part1*const + a;
                new_image(i,j) = fina;
            elseif((original_image(i,j)<(c +limit)))
                new_image(i,j) = a;
            elseif(original_image(i,j)<(d - limit))
                new_image(i,j) = b;
            end
        else
            new_image(i,j) = 0;
        end
    end
end
imshowpair(original_image,new_image,'montage')