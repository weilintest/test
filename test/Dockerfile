# This is an auto generated Dockerfile for ros:ros-base
# generated from docker_images_ros2/create_ros_image.Dockerfile.em
FROM ubuntu:latest

ARG BRANCH=iceoryx
ARG USERNAME=user

ENV USERNAME user
ARG USER_ID=1000
ARG GROUP_ID=15214

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN mkdir /etc/sudoers.d && \
	groupadd --gid $GROUP_ID $USERNAME && \
        useradd --gid $GROUP_ID -m $USERNAME && \
        echo "$USERNAME:$USERNAME" | chpasswd && \
        usermod --shell /bin/bash $USERNAME && \
        usermod -aG sudo $USERNAME && \
        usermod  --uid $USER_ID $USERNAME && \
        echo "$USERNAME ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/$USERNAME && \
        chmod 0440 /etc/sudoers.d/$USERNAME

RUN apt-get update && apt-get install -y --no-install-recommends \
	git-core \
	wget \
	net-tools 


WORKDIR /home/$USERNAME




