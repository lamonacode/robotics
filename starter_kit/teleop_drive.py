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
