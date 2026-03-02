# cpp_devcontainer

C++ development container for VS Code that supports both Docker and Podman.

This devcontainer provides a reproducible C++ build environment using CMake,
and can be used with either Docker or Podman as the container runtime.

## Features

- Works with VS Code Dev Containers
- Supports Docker and Podman
- Non-root user inside container
- UID/GID matching with host
- Forwards host SSH keys for Git access

---

## Requirements

- VS Code
- Dev Containers extension
- Docker or Podman installed on Host

---

## Prerequisite
### Using with Podman
#### Install and verify podman
Make sure that podman is installed and accessible
```bash
$ podman --version
```
#### Configure VS Code to use Podman
Open VS Code settings for workspace
- `Ctrl + Shift + P` -> Preference Open Workspace Settings
- Search `containers.containerClient` and set it to `podman`. This tells the VS Code Dev Containers extension to use Podman instead of Docker.

### Using with Docker
TODO : Test and Write

## Open project in VS Code
Clone this repository (if you haven’t already) and open it in VS Code.

## Start Devcontainer
Press Ctrl + Shift + P → Dev Containers: Reopen in Container

## Build hello world inside devcontainer
```
mkdir -p build
cd build
cmake ..
cmake --build .
```

```
$ cd build
$ ./hello_world/hello_world 
Hello and welcome to C++!
i = 1
i = 2
i = 3
i = 4
i = 5
```