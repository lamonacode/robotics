"""Core robot behavior model."""

from dataclasses import dataclass


@dataclass
class Robot:
    """Simple robot state container for team projects."""

    name: str = "robot"
    speed: int = 50

    def move_forward(self, distance: int = 1) -> int:
        """Return the distance to be traveled."""
        return distance

    def stop(self) -> str:
        """Return a stop command."""
        return f"{self.name}: stopped"
