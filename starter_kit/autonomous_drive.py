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
