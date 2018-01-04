clc;
clear all;
original_image = imread('bottle.bmp');
%imshow(original_image);

max_intensity = max(max(original_image));
histo = zeros(1,max_intensity+1);

%Histogram creation
for i = 1:600
    for j = 1:800
        temp = original_image(i,j);
        histo(1,temp+1) = histo(1,temp+1) + 1;
    end
end
plot(histo);

%Thresholding

meanIntensity = mean(mean(original_image));
for i = 1:600 
    for j = 1:800
        if original_image(i,j) >= meanIntensity
            tempImage(i,j) = 1;
        else
            tempImage(i,j) = 0;
        end
     end
end

imshow(tempImage);
o = original_image;
x = tempImage;
original_image = tempImage;
temp = original_image;  
surrounding_size = 3;


structuring_element = [1 1 1;1 1 1;1 1 1];
for z =1:3
temp = padarray(temp,[1,1],1);
    for i = 2:601
    for j = 2:801
        m = 1;
        for k = i-1:i+1
            n= 1;
            for l = j-1:j+1
                surrounding(m,n) = temp(k,l);
                n = n+1;
            end
            m = m+1;
        end
        if(surrounding == structuring_element)
            x(i-1,j-1) = 1;
        else
            x(i-1,j-1) = 0;
        end
    end
    end
    temp = x;
end

structuring_element = [0 0 0;0 0 0;0 0 0];

for z =1:3
temp = padarray(temp,[1,1],1);

    for i = 2:601
    for j = 2:801
        m = 1;
        for k = i-1:i+1
            n= 1;
            for l = j-1:j+1
                surrounding(m,n) = temp(k,l);
                n = n+1;
            end
            m = m+1;
        end
        if(surrounding == structuring_element)
            x(i-1,j-1) = 0;
        else
            x(i-1,j-1) = 1;
        end
    end
    end
    temp = x;
end

%imshow(temp);
for i =1:600
    for j = 1:800
        if(temp(i,j) ==1)
            temp(i,j) = 0;
        else
            temp(i,j) = 1;
        end
    end
end

%imshow(temp);

tempImage = temp;
tempImage = padarray(tempImage,[1,1],0);

%forward pass
forward_temp = tempImage;
backward_temp = tempImage;
for i = 2:601
    for j= 2:801
        if(forward_temp(i,j) >= 1)
            forward_temp(i,j) = min((forward_temp(i,j-1)+1),forward_temp(i-1,j)+1);
        end
    end
end

for i = 601:-1:2
    for j = 801:-1:2
        if(backward_temp(i,j) >= 1)
            temp_min = min((backward_temp(i,j+1)+1),(backward_temp(i+1,j)+1));
            backward_temp(i,j) = min(temp_min,forward_temp(i,j));
        end
    end
end


final = uint8(backward_temp);
imshow(final)   
final_image = final(2:601,2:801);

max_value=max(max(final_image));
final = round(final_image*(256/max_value+1));
final=uint8(final);
area = 0;
for i = 1:600
    for j = 1:800
        if(final(i,j)>0)
            area = area +1;
        end
    end
end


count_peri = 0;
for i = 2:601
    for j = 2:802
        if(backward_temp(i,j) == 1)
            count_peri  = count_peri+1;
        end
    end
end

x_sum = 0;
y_sum = 0;
tot_count = 0
for i = 1:600
    for j = 1:800
        if(final(i,j)>=1)
            x_sum = x_sum + i;
            y_sum = y_sum + j;
            tot_count = tot_count +1;
        end
    end
end

cent_x = x_sum/tot_count;
cent_y = y_sum/tot_count;