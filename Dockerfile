# This is an auto generated Dockerfile for ros:ros-base
# generated from docker_images_ros2/create_ros_image.Dockerfile.em
FROM ros:foxy-ros-core-focal

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
	apt-utils \
	git-core \
	wget \
	net-tools \
	inetutils-ping \
	htop \
 	cmake-curses-gui \
        cmake-qt-gui \
        dbus-x11 \
        dmz-cursor-theme \
        fonts-dejavu \
        gconf2 \
        gnome-terminal \
        gosu \
        language-pack-en \
        libarmadillo-dev \
        libcanberra-gtk-module \
        libcanberra-gtk3-0 \
        libcanberra-gtk3-module \
        libdbus-glib-1-2 \
        libgflags-dev \
        libglew-dev \
        libgoogle-glog-dev \
        libgoogle-perftools-dev \
        libgsl0-dev \
        libmosquitto-dev \
        libopenni2-dev \
        libpcap-dev \
        libssh2-1-dev \
        locales \
        pulseaudio \
        python3-colcon-common-extensions \
        python3-pip \
        python3-setuptools \
        python3-vcstool \
        sudo \
        tmux \
        vim \
	gedit \
	cmake \
	libacl1-dev \
	libncurses5-dev \
	pkg-config &&\
        pip3 install -U setuptools && \
        rm -rf /var/lib/apt/lists/*

WORKDIR /home/$USERNAME


RUN apt-get update && apt-get install -y --no-install-recommends \
	gcc \
	make \
	build-essential \
	ros-foxy-demo-nodes-py




