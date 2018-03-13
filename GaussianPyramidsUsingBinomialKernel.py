import numpy as np
import cv2
import matplotlib.pyplot as plt


def display(image):
    cv2.imshow("original_image",image)
    cv2.waitKey(0)
    cv2.destroyAllWindows()

def findsize(image):
    return image.shape

def Gauss(image,kernel):
    height,width,channels = findsize(image)
    image_b,image_g,image_r = cv2.split(image)
    image_b = np.pad(image_b, ((2,2),(2,2)), 'constant', constant_values=(0))
    image_g = np.pad(image_g, ((2,2),(2,2)), 'constant', constant_values=(0))
    image_r = np.pad(image_r, ((2,2),(2,2)), 'constant', constant_values=(0))
    temp_b = np.zeros((height//2,width//2))
    temp_g = np.zeros((height//2,width//2))
    temp_r = np.zeros((height//2,width//2))
    p = 0
    for i in range(3, height+2,2):
        q = 0
        for j in range(3,width+2,2):
            temp_b[p][q] = int(kernel[0]*image_b[i][j-2] + kernel[1]*image_b[i][j-1] + kernel[2]*image_b[i][j] + kernel[3]*image_b[i][j+1] + kernel[4]*image_b[i][j+2])
            temp_g[p][q] = int(kernel[0]*image_g[i][j-2] + kernel[1]*image_g[i][j-1] + kernel[2]*image_g[i][j] + kernel[3]*image_g[i][j+1] + kernel[4]*image_g[i][j+2])
            temp_r[p][q] = int(kernel[0]*image_r[i][j-2] + kernel[1]*image_r[i][j-1] + kernel[2]*image_r[i][j] + kernel[3]*image_r[i][j+1] + kernel[4]*image_r[i][j+2])
            q = q+1
        p = p+1

    image = cv2.merge((temp_b,temp_g,temp_r))
    image = image.astype(np.uint8)
    display(image)
    return image


def main():
    n = int(input("Number of Pyramids "))
    image = cv2.imread('2.jpg')
    kernel = [1/16, 1/4, 6/16, 1/4, 1/16]
    display(image)
    for i in range(0,n):
        height,width,channels = findsize(image)
        if(height >4 and width >4):
            image = Gauss(image,kernel)
        else:
            print("Cant do more bro!!!")
            break
main()
