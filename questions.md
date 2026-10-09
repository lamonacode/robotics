# Questions to Answer Before Building the Robot Project

These are the key questions we need to answer before choosing hardware, software, architecture, and validation steps for the robotics project.

## Hardware and Platform

1. What robot platform or board will the club use?
   - Example: Raspberry Pi, ESP32, Arduino, custom controller, or FRC/RobotPy system.
2. What motors, sensors, and actuators are available or planned?
   - DC motors, servos, stepper motors, encoders, IMUs, distance sensors, camera, etc.
3. Is the robot expected to run on a laptop, embedded controller, or both?
4. Is the project meant to be autonomous, teleoperated, or both?
5. What is the power source and voltage system for the robot?
6. Is there a preferred chassis or mechanical design already chosen?

## Software and Runtime

7. What Python runtime is expected to be used?
   - Standard Python, Raspberry Pi OS, MicroPython, CircuitPython, or another environment.
8. Is the project limited to Python, or are other languages acceptable?
9. Will the robot use a camera for vision processing?
10. Will the robot need network or Wi-Fi communication?
11. Does the project require real-time control or only simpler timing-based control?

## Project Scope and Goals

12. What is the learning goal for the club?
   - Basic movement, sensor integration, autonomous navigation, computer vision, or game-style competition behavior?
13. What are the minimum viable capabilities for the first version?
14. What should the robot be able to do by the end of the first month?
15. Are there any specific competitions, challenges, or tutorials the project should align with?

## Safety and Reliability

16. What safety constraints are important for the robot?
   - Emergency stop, watchdog, obstacle detection, low-speed mode, etc.
17. Are there any rules or requirements around using a camera, motors, or moving platforms?
18. How should faults or disconnected sensors be handled?

## Development Workflow

19. Do we want a simulation/test-first workflow before physical hardware testing?
20. What approach should we use for validation and debugging?
   - Logs, unit tests, telemetry, or hardware bench tests.
21. Who will maintain the codebase and update hardware configuration as the project evolves?

## Decisions Needed to Move Forward

22. What is the exact hardware platform we are targeting?
23. What is the minimum runtime we can support?
24. What is the first milestone we are trying to reach?
25. What is the simplest possible version that still teaches the intended robotics concepts?

These questions should be answered as a group before adding more project-specific code or architecture.
