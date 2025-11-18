@echo off
set APP_TYPE=%1
set BUILD_TYPE=%2

call setup.bat %APP_TYPE%

flutter build apk ^
  --flavor %APP_TYPE% ^
  --%BUILD_TYPE% ^
  --dart-define=APP_TYPE=%APP_TYPE% ^
  --dart-define=BUILD_TYPE=%BUILD_TYPE% ^
  --target-platform=android-arm64 ^
  --analyze-size