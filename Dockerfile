FROM ubuntu:latest

# Install necessary packages
RUN apt-get update && apt-get install -y \
    git \
    zip \
    unzip \
    python3-pip \
    autoconf \
    libtool \
    pkg-config \
    zlib1g-dev \
    libncurses5-dev \
    libncursesw5-dev \
    libtinfo5 \
    cmake \
    libffi-dev \
    libssl-dev \
    automake \
    && rm -rf /var/lib/apt/lists/*

# Install Python dependencies
RUN pip install --user --upgrade Cython virtualenv buildozer

# Set environment variables
ENV JAVA_HOME /usr/lib/jvm/temurin-17-jdk-amd64
ENV PATH $JAVA_HOME/bin:$PATH

# Default entrypoint
ENTRYPOINT ["/entrypoint.sh"]