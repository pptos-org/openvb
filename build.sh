#!/bin/sh

architecture=$(uname -m) # Get the architecture
os=$(uname -s) # Get the OS
os=$(echo $os | tr '[:upper:]' '[:lower:]') # convert os to lowercase

init_webdev() {
    dart pub global activate webdev
    export PATH="$PATH":"$HOME/.pub-cache/bin"
}

run_web()
{
    init_webdev
    sh -c "webdev serve"
}

build_web()
{
    init_webdev
    sh -c "webdev build"
}

build_native()
{
    ehco "Building for $os-$architecture"
    sh -c "dart compile exe bin/openvb.dart -o bin/openvb-$os-$architecture"
}

run_native()
{
    sh -c "dart bin/openvb.dart"
}

case "$1" in
    run_web)
        run_web
        ;;
    build_web)
        build_web
        ;;
    build_native)
        build_native
        ;;
    run_native)
        run_native
        ;;
    *)
        echo "Usage: $0 {run_web|build_web|build_native|run_native}"
        exit 1
        ;;
esac
