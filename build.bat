@echo off

:: Get the architecture
set ARCH=%PROCESSOR_ARCHITECTURE%

:: Replace "AMD64" with "x64"
if "%ARCH%"=="AMD64" (
    set ARCH=x86_64
)

:: Replace "x86" with "x86"
if "%ARCH%"=="x86" (
    set ARCH=x86
)

:: Replace "ARM64" with "aarch64"
if "%ARCH%"=="ARM64" (
    set ARCH=aarch64
)

:: Replace "ARM" with "arm"
if "%ARCH%"=="ARM" (
    set ARCH=arm
)

dart pub get
dart compile exe bin/openvb.dart -o bin/openvb-windows-%ARCH%.exe
