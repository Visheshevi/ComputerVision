import cv2
import numpy as np
from matplotlib import pyplot as plt
np.set_printoptions(threshold=np.nan)

def display(image):
    cv2.imshow("original_image",image)
    cv2.waitKey(0)
    cv2.destroyAllWindows()

def lapl(image,laplacian):
    temp_l = cv2.Laplacian(image,cv2.CV_64F)
    laplacian.append(image - temp_l)
    image = cv2.pyrDown(image)
    return image

def gaus(image,gaussian):
    image = cv2.pyrDown(image)
    gaussian.append(image)
    return image

def createMask(image):
    height,width = image.shape
    for i in range (0,height):
        for j in range(0,width):
            if(j<340):
                image[i][j] = 1
            elif(j > 400):
                image[i][j] = 0
            else:
                image[i][j] = (400 - j)/60
    #display(image)
    return image


def main():
    n = int(input("Number of Pyramids "))
    image_1 = cv2.imread('8.jpg')
    image_2 = cv2.imread('9.jpg')
    gaussian_1 = []
    gaussian_2 = []
    laplacian_1 = []
    laplacian_2 = []
    h,w,c = image_1.shape
    # mask_1 = np.zeros((h,w))
    # mask_2 = np.zeros((h,w))
    # mask_1 = createMask(mask_1)
    # mask_2 = np.fliplr(mask_1)
    mask_1 = np.zeros_like(image_1, dtype='float32')
    mask_1[:,int(image_1.shape[1]/2):] = 1
    mask_2 = 1 - mask_1
    for i in range(0,n):
        image_1 = lapl(image_1,laplacian_1)
        image_2 = lapl(image_2,laplacian_2)
    gaussian_1.append(mask_1)
    gaussian_2.append(mask_2)
    for i in range(0,n-1):
        mask_1 = gaus(mask_1,gaussian_1)
        mask_2 = gaus(mask_2,gaussian_2)
    mul_1 = []
    mul_2 = []
    final_product = []
    for i in range(0,len(gaussian_1)):
        # image_b,image_g,image_r = cv2.split(laplacian_1[i])
        # image_b = image_b*gaussian_1[i]
        # image_g = image_b*gaussian_1[i]
        # image_r = image_b*gaussian_1[i]
        # temp_image = cv2.merge((image_b,image_g,image_r))
        temp_image = laplacian_1[i]*gaussian_1[i]
        mul_1.append(temp_image)
        # image_b,image_g,image_r = cv2.split(laplacian_2[i])
        # image_b = image_b*gaussian_2[i]
        # image_g = image_b*gaussian_2[i]
        # image_r = image_b*gaussian_2[i]
        # temp_image = cv2.merge((image_b,image_g,image_r))
        temp_image = laplacian_2[i]*gaussian_2[i]
        mul_2.append(temp_image)
    for i in range(0,len(gaussian_1)):
        final_product.append(mul_1[i] + mul_2[i])
    #display(final_product[0])
    img = final_product[4]
    for i in range(n-2,0,-1):
        img = cv2.pyrUp(ls_)
        img = cv2.add(ls_, final_product[i])
    cv2.imwrite("lpb.png",img)
main()
