# OpenVB (Open Visual Basic)
OpenVB is a project that aims to create a free and open-source implementation of the Visual Basic programming language. OpenVB is written in dart and is designed to run on the web and desktop.

## Builds

| Platform | Build Status | Download |
|----------|--------------|----------|
| Linux    | [![Build openvb for Linux](https://github.com/pptos-org/openvb/actions/workflows/build_linux.yml/badge.svg)](https://github.com/pptos-org/openvb/actions/workflows/build_linux.yml) | [openvb-linux-x86_64](https://github.com/pptos-org/openvb/releases/download/alpha/openvb-linux-x86_64) |
| Windows  | [![Build openvb for Windows](https://github.com/pptos-org/openvb/actions/workflows/build_windows.yml/badge.svg)](https://github.com/pptos-org/openvb/actions/workflows/build_windows.yml) | [openvb-windows-x86_64.exe](https://github.com/pptos-org/openvb/releases/download/alpha/openvb-windows-x86_64.exe) |
| Web      | [![Build website for openvb](https://github.com/pptos-org/openvb/actions/workflows/build_web.yml/badge.svg)](https://github.com/pptos-org/openvb/actions/workflows/build_web.yml) | [openvb-web](https://pptos-org.github.io/openvb/) |

## Building

### Linux

Build for Linux as a native binary:

```sh
./build.sh build_native
```

Build for web:

```sh
./build.sh build_web
```

Running a local web server:

```sh
./build.sh run_web
```

### Windows

Build for Windows as a native binary:

```powershell
build.bat
```

## License

OpenVB is licensed under the Apache License 2.0. See [LICENSE](LICENSE) for more information.
