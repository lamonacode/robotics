import cv2
import gpiozero
from time import sleep

motor = gpiozero.Motor(forward=17, backward=18)
cap = cv2.VideoCapture(0)

while True:
    ret, frame = cap.read()
    hsv = cv2.cvtColor(frame, cv2.COLOR_BGR2HSV)

    lower_blue = (100, 150, 0)
    upper_blue = (140, 255, 255)
    mask = cv2.inRange(hsv, lower_blue, upper_blue)

    moments = cv2.moments(mask)
    if moments['m00'] > 0:
        cx = int(moments['m10'] / moments['m00'])
        if cx < 300:
            motor.backward()
        elif cx > 340:
            motor.forward()
        else:
            motor.stop()
    else:
        motor.stop()

    if cv2.waitKey(1) & 0xFF == ord('q'):
        break

cap.release()
cv2.destroyAllWindows()
