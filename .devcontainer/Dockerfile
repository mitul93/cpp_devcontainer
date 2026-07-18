# base image
FROM debian:trixie-slim

ARG DEBIAN_FRONTEND=noninteractive

RUN rm -f /etc/apt/apt.conf.d/docker-clean

# install apt packages and dependencies
RUN --mount=type=cache,target=/var/cache/apt \
    apt-get update && \
    apt-get install -y --no-install-recommends \
    sudo git make curl gnupg2 wget ca-certificates openssh-client \
    # c++
    build-essential clang clang-tidy clang-format cmake gdb

ARG USERNAME=devcontainer
ARG USER_UID=1000
ARG USER_GID=1000
# add $USER to usergroup
RUN groupadd --gid ${USER_GID} ${USERNAME} &&\
    useradd --uid ${USER_UID} --gid ${USER_GID} -m ${USERNAME}

# locale
ENV TZ="Etc/UTC"

USER ${USERNAME}

# working directory
ARG REPOSITORY_NAME=cpp_devcontainer
WORKDIR /${REPOSITORY_NAME}

# entry point
ENTRYPOINT ["/bin/bash"]