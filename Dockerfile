FROM ubuntu:latest

# Install necessary packages
RUN apt-get update
RUN apt-get install -y \
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
    automake

# Install Python dependencies
RUN pip install --user --upgrade Cython virtualenv
RUN pip install --user --upgrade buildozer

# Set environment variables
ENV JAVA_HOME /usr/lib/jvm/temurin-17-jdk-amd64
ENV PATH $JAVA_HOME/bin:$PATH

# Copy entrypoint script
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Default entrypoint
ENTRYPOINT ["/entrypoint.sh"]