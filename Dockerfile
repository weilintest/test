# This is an auto generated Dockerfile for ros:ros-base
# generated from docker_images_ros2/create_ros_image.Dockerfile.em
FROM ubuntu:latest

ARG BRANCH=iceoryx
ARG USERNAME=user

ENV USERNAME user
ARG USER_ID=1000
ARG GROUP_ID=15214

SHELL ["/bin/bash", "-o", "pipefail", "-c"]



WORKDIR /home/$USERNAME




