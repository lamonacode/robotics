# Set target folder
$target = "C:\Users\jlamo\repos\robotics\starter_kit"

# Create folder if it doesn't exist
if (!(Test-Path $target)) {
    New-Item -ItemType Directory -Path $target | Out-Null
}

# README.md
@"
# Python Robotics Dev Toolkit

This toolkit contains:
- Teleop driving (joystick control)
- Autonomous driving (sensor-based)
- Vision tracking (OpenCV)
- PID control example
- Camera-based autonomous navigation
- Safety watchdog

## Setup

### FRC (RobotPy)
pip install robotpy[commands]

### Raspberry Pi
pip install gpiozero opencv-python

## Running Code
- Teleop: python3 -m robotpy deploy
- Autonomous: Switch to autonomous mode in Driver Station
- Vision: python3 vision_tracking.py
- PID: python3 pid_control.py
- Camera Navigation: python3 camera_navigation.py
- Safety Watchdog: python3 safety_watchdog.py
"@ | Set-Content "$target\README.md"

# teleop_drive.py
@"
import wpilib

class MyRobot(wpilib.TimedRobot):
    def robotInit(self):
        self.joystick = wpilib.Joystick(0)
        self.left_motor = wpilib.PWMSparkMax(0)
        self.right_motor = wpilib.PWMSparkMax(1)

    def teleopPeriodic(self):
        left_speed = self.joystick.getY()
        right_speed = self.joystick.getThrottle()
        self.left_motor.set(left_speed)
        self.right_motor.set(right_speed)

if __name__ == "__main__":
    wpilib.run(MyRobot)
"@ | Set-Content "$target\teleop_drive.py"

# autonomous_drive.py
@"
import wpilib

class MyRobot(wpilib.TimedRobot):
    def robotInit(self):
        self.motor = wpilib.PWMSparkMax(0)
        self.sensor = wpilib.Ultrasonic(1, 2)

    def autonomousPeriodic(self):
        distance = self.sensor.getRangeInches()
        if distance > 12:
            self.motor.set(0.5)
        else:
            self.motor.stopMotor()

if __name__ == "__main__":
    wpilib.run(MyRobot)
"@ | Set-Content "$target\autonomous_drive.py"

# vision_tracking.py
@"
import cv2

cap = cv2.VideoCapture(0)

while True:
    ret, frame = cap.read()
    hsv = cv2.cvtColor(frame, cv2.COLOR_BGR2HSV)

    lower_red = (0, 120, 70)
    upper_red = (10, 255, 255)
    mask = cv2.inRange(hsv, lower_red, upper_red)

    cv2.imshow('Mask', mask)
    if cv2.waitKey(1) & 0xFF == ord('q'):
        break

cap.release()
cv2.destroyAllWindows()
"@ | Set-Content "$target\vision_tracking.py"

# pid_control.py
@"
import wpilib

class MyRobot(wpilib.TimedRobot):
    def robotInit(self):
        self.motor = wpilib.PWMSparkMax(0)
        self.encoder = wpilib.Encoder(0, 1)
        self.pid = wpilib.controller.PIDController(0.1, 0.01, 0.0)
        self.pid.setSetpoint(100)  # Target encoder ticks

    def autonomousPeriodic(self):
        output = self.pid.calculate(self.encoder.getDistance())
        self.motor.set(output)

if __name__ == "__main__":
    wpilib.run(MyRobot)
"@ | Set-Content "$target\pid_control.py"

# camera_navigation.py
@"
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
"@ | Set-Content "$target\camera_navigation.py"

# safety_watchdog.py
@"
import wpilib

class MyRobot(wpilib.TimedRobot):
    def robotInit(self):
        self.motor = wpilib.PWMSparkMax(0)
        self.watchdog = wpilib.Watchdog(0.5, self.stopMotors)

    def stopMotors(self):
        self.motor.stopMotor()
        print('Watchdog triggered: Motors stopped')

    def teleopPeriodic(self):
        self.watchdog.feed()
        self.motor.set(0.5)

if __name__ == "__main__":
    wpilib.run(MyRobot)
"@ | Set-Content "$target\safety_watchdog.py"

# requirements.txt
@"
robotpy
gpiozero
opencv-python
"@ | Set-Content "$target\requirements.txt"

# Create ZIP
Compress-Archive -Path "$target\*" -DestinationPath "$target\robotics_toolkit.zip" -Force

Write-Host "Full robotics toolkit created and zipped at $target\robotics_toolkit.zip"
