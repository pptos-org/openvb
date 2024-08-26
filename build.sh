#!/bin/sh

architecture=$(uname -m) # Get the architecture
os=$(uname -s) # Get the OS
os=$(echo $os | tr '[:upper:]' '[:lower:]') # convert os to lowercase

get_deps()
{
    dart pub get
}

init_webdev() {
    get_deps
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
    rm -rf web/output
    #sh -c "webdev build --output=web/output"
    mkdir -p web/output
    sh -c "dart compile wasm -o web/output/main.wasm web/main.dart"
    cp web/index.html web/styles.css web/main.dart.js web/output/
}

build_native()
{
    get_deps
    echo "Building for $os-$architecture"
    sh -c "dart compile exe bin/openvb.dart -o bin/openvb-$os-$architecture"
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
    *)
        echo "Usage: $0 {run_web|build_web|build_native}"
        exit 1
        ;;
esac
