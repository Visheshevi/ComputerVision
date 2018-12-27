# Face Detection

# Importing libraries
import cv2

#Loading the cascades. These cascades consist of features that are required to find a face.
face_cascade = cv2.CascadeClassifier('Module_1_Face_Recognition/haarcascade_frontalface_default.xml')
eye_cascade = cv2.CascadeClassifier('Module_1_Face_Recognition/haarcascade_eye.xml')

# Define a funtion that will do the detection
def detect(gray_image, original_image):
	faces = face_cascade.detectMultiScale(gray_image, 1.3, 5) # gives the coordinates of the rectangel in the format [x,y,w,h]
	for (x,y,w,h) in faces:
		cv2.rectangle(original_image, (x,y), (x+w,y+h), (243,132,33), 2) # cv2's function to draw a rectangle. Takes in the image, the upper left and bottom right coordinates

		# require two region of interest. One for gray scale and other for original
		roi_gray = gray_image[y:y+h,x:x+w]
		roi_original = original_image[y:y+h,x:x+w]
		eyes = eye_cascade.detectMultiScale(roi_gray, 1.1, 3)
		for (ex,ey,ew,eh) in eyes:
			cv2.rectangle(roi_original, (ex,ey), (ex+ew,ey+eh), (212,14,5), 2)

	return original_image


video_capture = cv2.VideoCapture(0)
while True:
	_, frame = video_capture.read()
	gray_frame = cv2.cvtColor(frame,cv2.COLOR_BGR2GRAY)
	canvas = detect(gray_frame, frame)
	cv2.imshow('Video', canvas)
	if(cv2.waitKey(1) & 0xFF == ord('q')):
		break

# Turn of the webcam
video_capture.release(0)
cv2.destroyAllWindows()