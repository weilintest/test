FROM ubuntu:bionic

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends -y \
    curl \
    git \
    gnupg \
    openssh-client \
    wget \
    && rm -rf /var/lib/apt

RUN echo "deb http://packages.ros.org/ros/ubuntu bionic main" > /etc/apt/sources.list.d/ros-latest.list \
    && curl -sSL 'http://keyserver.ubuntu.com/pks/lookup?op=get&search=0xC1CF6E31E6BADE8868B172B4F42ED6FBAB17C654' | apt-key add - \
    && apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends -y \
    python3-vcstool \
    && rm -rf /var/lib/apt

COPY .ssh /tmp/.ssh

RUN mv /tmp/.ssh ~/.ssh \
    && chmod 600 /root/.ssh/id_ed25519 \
    && ssh-keyscan -t rsa github.com > ~/.ssh/known_hosts \
    && git config --global http.sslverify false && git config --global https.sslverify false \
    && git clone --single-branch --depth 1 git@github.com:tier4/AutowareArchitectureProposal.git /AutowareArchitectureProposal \
    && git clone --single-branch --depth 1 git@github.com:astuff/kvaser_interface.git /AutowareArchitectureProposal/src/vendor/kvaser_interface \
    && cd /AutowareArchitectureProposal \
    && vcs import src < autoware.proj.repos \
    && rm -rf ~/.ssh
