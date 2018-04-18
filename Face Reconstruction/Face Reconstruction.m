clc;
clear all;
close all;
load faces.mat
F = FACES;

mean_face = zeros(40);
for i=1:9
     subplot(3,3,i);
    fac = transpose(vec2mat(F(:,i),40,40));
    original_faces(:,:,i) = fac;
    imshow(uint8(fac));
     imagesc(fac);
    mean_face = mean_face + fac;
end
    
mean_face = mean_face/9;
figure;
imshow(mean_face,[])

for i=1:9
    subtracted_faces(:,:,i) = original_faces(:,:,i) - mean_face;
end


for i = 1:9
    p = 1;
    for j = 1:40
        for k = 1:40
            subtracted_faces_vector(p,i) = subtracted_faces(j,k,i);
            p = p+1;
        end
    end
end

A = [subtracted_faces_vector(:,1) subtracted_faces_vector(:,2) subtracted_faces_vector(:,3) subtracted_faces_vector(:,4) subtracted_faces_vector(:,5) subtracted_faces_vector(:,6) subtracted_faces_vector(:,7) subtracted_faces_vector(:,8) subtracted_faces_vector(:,9)];
temp = A'*A;
temp = temp/9;

[u,D] = eig(temp);
[D, ind] = sort(diag(D), 'descend');
 u = u(:, ind);
 final_vector = A*u;
 final_vector = final_vector/norm(final_vector);
 
 for i = 1:9
     final_vector_matrix(:,:,i) = (vec2mat(final_vector(:,i),40,40));
 end
 
 figure;
 for i=1:9
    subplot(3,3,i);
    imshow(uint8(final_vector_matrix(:,:,i)));
    imagesc(final_vector_matrix(:,:,i));
end
 
 temp_1 = zeros(1600,9);
 %temp_1(:,1:6) = final_vector(:,1:6); %% Taking 6 eigen vectors
 temp_1(:,1:3) = final_vector(:,1:3); %% Taking 3 eigen vectors
 temp_2 = A'*temp_1;
 final = temp_2*final_vector';
 final = final';

 
 for i = 1:9
     final_mat(:,:,i) = (vec2mat(final(:,i),40,40));
     final_mat(:,:,i) = final_mat(:,:,i) + mean_face;
 end
 
figure;
for i=1:9
    subplot(3,3,i);
    imshow(uint8(final_mat(:,:,i)));
    imagesc(final_mat(:,:,i));
end


