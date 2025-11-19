@echo off
set APP_TYPE=%1

echo --- CLEAN OLD pubspec.yaml ---
del /F /Q pubspec.yaml 2>nul

echo --- USING COMMON BASE pubspec.yaml ---
copy /Y common.yaml pubspec.yaml

echo --- Adding flavor: %APP_TYPE% ---

IF "%APP_TYPE%"=="jci" (
    echo Using pubspec_jci.yaml...
    type pubspec_jci.yaml >> pubspec.yaml
) ELSE IF "%APP_TYPE%"=="accenture" (
    echo Using pubspec_accenture.yaml...
    type pubspec_accenture.yaml >> pubspec.yaml
) ELSE (
    echo Invalid APP_TYPE: %APP_TYPE%
    exit /b 1
)

echo --- VERIFY pubspec.yaml EXISTS ---
IF NOT EXIST pubspec.yaml (
    echo ERROR: pubspec.yaml was NOT created!
    pause
    exit /b 1
)

echo --- Running flutter pub get ---
flutter pub get

echo --- Build ready ---
pause