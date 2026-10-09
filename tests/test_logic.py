from app.controller import run_cycle
from app.robot import Robot


def test_run_cycle_returns_stop_message():
    robot = Robot(name="bot")
    assert run_cycle(robot) == "bot: stopped"
