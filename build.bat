@echo off
set APP_TYPE=%1
set BUILD_TYPE=%2

flutter build apk ^
  --flavor %APP_TYPE% ^
  --%BUILD_TYPE% ^
  --dart-define=APP_TYPE=%APP_TYPE% ^
  --dart-define=BUILD_TYPE=%BUILD_TYPE%