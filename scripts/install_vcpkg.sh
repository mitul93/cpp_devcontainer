#!/usr/bin/env bash

set -euo pipefail

INSTALL_DIR=$1

if [ -z "${VCPKG_TOOL_VERSION:-}" ]; then
    echo "VCPKG_TOOL_VERSION is not set"
    exit 1
fi

echo "(*) Running ./install_vcpkg.sh:"
echo "    INSTALL_DIR : ${INSTALL_DIR}"
echo "    VCPKG_TOOL_VERSION: ${VCPKG_TOOL_VERSION}"

detect_platform() {
    OS="$(uname -s)"

    case "$OS" in
        Linux)
            OS="linux"
            ;;
        *)
            echo "Unsupported OS: $OS"
            exit 1
            ;;
    esac

    ARCH="$(dpkg --print-architecture)"

    case "$ARCH" in
        x86_64|amd64)
            ARCH="x64"
            ;;
        aarch64|arm64)
            ARCH="arm64"
            ;;
        *)
            echo "Unsupported architecture: $ARCH"
            exit 1
            ;;
    esac
}

download_vcpkg_tool() {
    detect_platform
    local vcpkgToolName

    if [ "$OS" = "linux" ] && [ "$ARCH" = "x64" ]; then
        echo "Downloading vcpkg-glibc..."
        vcpkgToolName="vcpkg-glibc"
    else
        echo "Unsupported platform: ${OS} ${ARCH}"
        exit 1
    fi

    mkdir -p "$INSTALL_DIR"
    curl -fsSL \
        -o "${INSTALL_DIR}/vcpkg" \
        "https://github.com/microsoft/vcpkg-tool/releases/download/${VCPKG_TOOL_VERSION}/${vcpkgToolName}"

    chmod +x "${INSTALL_DIR}/vcpkg"
}


download_vcpkg_tool
echo "(*) Installed vcpkg-tools to: $INSTALL_DIR/vcpkg"
echo "(*) Version:" 
$INSTALL_DIR/vcpkg version --disable-metrics