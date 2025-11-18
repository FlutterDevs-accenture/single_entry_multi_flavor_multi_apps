@echo off

set APP_TYPE=%1

REM --- Remove old pubspec ---
del /F /Q pubspec.yaml 2>nul

REM --- Choose correct pubspec file ---
IF "%APP_TYPE%"=="jci" (
    echo Using pubspec_jci.yaml...
    copy /Y pubspec_jci.yaml pubspec.yaml
) ELSE IF "%APP_TYPE%"=="accenture" (
    echo Using pubspec_accenture.yaml...
    copy /Y pubspec_accenture.yaml pubspec.yaml
) ELSE (
    echo Invalid APP_TYPE: %APP_TYPE%
    exit /b 1
)

REM --- Verify pubspec copied correctly ---
IF NOT EXIST pubspec.yaml (
    echo ERROR: pubspec.yaml was NOT created!
    echo Check the filename: pubspec_%APP_TYPE%.yaml
    pause
    exit /b 1
)

flutter pub get
