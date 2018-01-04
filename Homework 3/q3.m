clc;
close all;
imgOpen = [0 0 0 0 1 0 0;0 0 1 1 1 0 0; 0 1 1 1 1 1 0;0 1 1 1 1 1 0; 0 1 1 1 0 0 0; 0 0 1 0 0 0 0; 0 0 0 0 0 0 0];
temp = imgOpen;
tempImage = temp;
tempImage = padarray(tempImage,[1,1],0);

%forward pass
forward_temp = tempImage;
backward_temp = tempImage;
for i = 2:8
    for j= 2:8
        if(forward_temp(i,j) >= 1)
            forward_temp(i,j) = min((forward_temp(i,j-1)+1),forward_temp(i-1,j)+1);
        end
    end
end

for i = 8:-1:2
    for j = 8:-1:2
        if(backward_temp(i,j) >= 1)
            temp_min = min((backward_temp(i,j+1)+1),(backward_temp(i+1,j)+1));
            backward_temp(i,j) = min(temp_min,forward_temp(i,j));
        end
    end
end


