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
