This Repository contains some of the techniques used in Computer Vision. These all files are a part of the homework assignments given to me in the ECE 415 class at UIC.

No existing libraries were used to complete the assignments. Every code is written from scratch ad in MATLAB.

The Homework 2 folder contains the basics of image analysis like Thresholding, Histogram equalization, Gamma Correction and contrast stretching.

The Homework 3 folder contains 2 MATLAB files namely q2 and q3, 2 image files that are needed for image analysis and a report named Vishesh_Chanana_ECE_415_Homework_3.pdf
In the q2.m file, we create the Histogram of the given image, do its thresholding and then study the effects of erosion and dilation of the image.
The q3.m file displays an image that has some holes in it. We fill those holes by applying the concepts that we learnt from the file q2.m i.e. we use a technique called morphological clsoing. In this technique, we first dilate the image and then erode it. 

The Homework 4 folder deals with 3 things. The q1.m file has the program to perform the Connected Components of an image. The code2.m deals with finding the gaussian and the laplacian pyramids of a given image. The Gaussian pyramid is used to get a final smoothed image while the laplacian pyramid helps to get an image with sharpened edges. 

The HW5 folder deals with feature matching. The image is first binarized then rotated. Then, features are mapped between the two thresholded images using a harris detector.  