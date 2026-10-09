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
