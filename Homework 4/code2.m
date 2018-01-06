close all;
clc;

%% Gaussian pyramid %%
image= imread('image.bmp');
imshow(image);
title('Original Image'); % Level 1 Image for both Gaussian and Laplacian Pyramids
kernal=[1/16 1/4 6/16 1/4 1/16]; % Binomial Kernal used in both Gaussian and Laplacian Pyramids
%% Level 2 %%
rows=zeros(1,958);
cols=zeros(1,1274);
C1 = [cols;cols;image;cols;cols];
C2 = [rows;rows;transpose(C1);rows;rows];
C = transpose(C2);
for i=3:+2:956
    for j=3:+2:1276
        temp((i),(j))= kernal(1,1)*C(i,j-2) +  kernal(1,2)*C(i,j-1) + kernal(1,3)*C(i,j) + kernal(1,4)*C(i,j+1) + kernal(1,5)*C(i,j+2);
    end
end
D1=temp(3:2:end,:);
D2=transpose(D1);
temp=D2(3:2:end,:);
temp=transpose(temp); % Downsampling
figure;
imshow(temp);
title('Gaussian Pyramid Level-2');

%% Level 3 %%
rows=zeros(1,481);
cols=zeros(1,637);
C1 = [cols;cols;temp;cols;cols];
C2 = [rows;rows;transpose(C1);rows;rows];
C = transpose(C2);
for i=3:+2:479
    for j=3:+2:639
        temp((i),(j))= kernal(1,1)*C(i,j-2) +  kernal(1,2)*C(i,j-1) + kernal(1,3)*C(i,j) + kernal(1,4)*C(i,j+1) + kernal(1,5)*C(i,j+2);
    end
end
D1=temp(3:2:end,:);
D2=transpose(D1);
temp=D2(3:2:end,:);
temp=transpose(temp); % Downsampling
figure;
imshow(temp);
title('Gaussian Pyramid Level-3');

%% Level 4 %%
rows=zeros(1,243);
cols=zeros(1,319);
C1 = [cols;cols;temp;cols;cols];
C2 = [rows;rows;transpose(C1);rows;rows];
C = transpose(C2);
for i=3:+2:241
    for j=3:+2:321
        temp((i),(j))= kernal(1,1)*C(i,j-2) +  kernal(1,2)*C(i,j-1) + kernal(1,3)*C(i,j) + kernal(1,4)*C(i,j+1) + kernal(1,5)*C(i,j+2);
    end
end
D1=temp(3:2:end,:);
D2=transpose(D1);
temp=D2(3:2:end,:);
temp=transpose(temp); % Downsampling
figure;
imshow(temp);
title('Gaussian Pyramid Level-4');

%% Level 5 %%
rows=zeros(1,124);
cols=zeros(1,160);
C1 = [cols;cols;temp;cols;cols];
C2 = [rows;rows;transpose(C1);rows;rows];
C = transpose(C2);
for i=3:+2:122
    for j=3:+2:162
        temp((i),(j))= kernal(1,1)*C(i,j-2) +  kernal(1,2)*C(i,j-1) + kernal(1,3)*C(i,j) + kernal(1,4)*C(i,j+1) + kernal(1,5)*C(i,j+2);
    end
end
D1=temp(3:2:end,:);
D2=transpose(D1);
temp=D2(3:2:end,:);
temp=transpose(temp); % Downsampling
figure;
imshow(temp);
title('Gaussian Pyramid Level-5');
 


%% Laplacian Pyramid
%% Level 2 %%
rows=zeros(1,958);
cols=zeros(1,1274);
C1 = [cols;cols;image;cols;cols];
C2 = [rows;rows;transpose(C1);rows;rows];
C = transpose(C2);
for i=3:956
    for j=3:1276
        temp((i-2),(j-2))= kernal(1,1)*C(i,j-2) +  kernal(1,2)*C(i,j-1) + kernal(1,3)*C(i,j) + kernal(1,4)*C(i,j+1) + kernal(1,5)*C(i,j+2);
    end
end
Img=image-temp;
figure;
imshow(Img);
D1=temp(1:2:end,:);
D2=transpose(D1);
temp=D2(1:2:end,:);
temp=transpose(temp); % Downsampling
title('Laplacian Pyramid Level-2');

%% Level 3 %%
rows=zeros(1,481);
cols=zeros(1,637);
C1 = [cols;cols;temp;cols;cols];
C2 = [rows;rows;transpose(C1);rows;rows];
C = transpose(C2);
Org=temp;
for i=3:479
    for j=3:639
        temp((i-2),(j-2))= kernal(1,1)*C(i,j-2) +  kernal(1,2)*C(i,j-1) + kernal(1,3)*C(i,j) + kernal(1,4)*C(i,j+1) + kernal(1,5)*C(i,j+2);
    end
end
Img=Org-temp;
figure;
imshow(Img);
D1=temp(1:2:end,:);
D2=transpose(D1);
temp=D2(1:2:end,:);
temp=transpose(temp); % Downsampling
title('Laplacian Pyramid Level-3');

%% Level 4 %%
rows=zeros(1,243);
cols=zeros(1,319);
C1 = [cols;cols;temp;cols;cols];
C2 = [rows;rows;transpose(C1);rows;rows];
C = transpose(C2);
Org=temp;
for i=3:241
    for j=3:321
        temp((i-2),(j-2))= kernal(1,1)*C(i,j-2) +  kernal(1,2)*C(i,j-1) + kernal(1,3)*C(i,j) + kernal(1,4)*C(i,j+1) + kernal(1,5)*C(i,j+2);
    end
end
Img=Org-temp;
figure;
imshow(Img);
D1=temp(1:2:end,:);
D2=transpose(D1);
temp=D2(1:2:end,:);
temp=transpose(temp); % Downsampling
title('Laplacian Pyramid Level-4');

%% Level 5 %%
rows=zeros(1,124);
cols=zeros(1,160);
C1 = [cols;cols;temp;cols;cols];
C2 = [rows;rows;transpose(C1);rows;rows];
C = transpose(C2);
Org=temp;
for i=3:122
    for j=3:162
        temp((i-2),(j-2))= kernal(1,1)*C(i,j-2) +  kernal(1,2)*C(i,j-1) + kernal(1,3)*C(i,j) + kernal(1,4)*C(i,j+1) + kernal(1,5)*C(i,j+2);
    end
end
Img=Org-temp;
figure;
imshow(Img);
title('Laplacian Pyramid Level-5');


