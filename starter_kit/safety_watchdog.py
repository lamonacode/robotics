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
