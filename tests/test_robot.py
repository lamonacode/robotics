from app.robot import Robot


def test_robot_starts_with_default_speed():
    robot = Robot(name="bot")
    assert robot.speed == 50


def test_robot_can_move_forward():
    robot = Robot(name="bot")
    assert robot.move_forward(3) == 3


def test_robot_can_stop():
    robot = Robot(name="bot")
    assert robot.stop() == "bot: stopped"
