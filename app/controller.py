"""Host-side control logic for robot operations."""

from app.robot import Robot


def run_cycle(robot: Robot) -> str:
    """Placeholder control loop for a robot cycle."""
    robot.move_forward()
    return robot.stop()
