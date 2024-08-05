FROM ubuntu:latest

# Install necessary packages
RUN apt update
# RUN apt install -y git 
# RUN apt install -y zip 
# RUN apt install -y unzip 
# RUN apt install -y python3-pip 
# RUN apt install -y autoconf 
# RUN apt install -y libtool 
# RUN apt install -y pkg-config 
# RUN apt install -y zlib1g-dev 
# RUN apt install -y libncurses5-dev 
# RUN apt install -y libncursesw5-dev 
# RUN apt install -y libtinfo6 
# RUN apt install -y cmake 
# RUN apt install -y libffi-dev 
# RUN apt install -y libssl-dev 
# RUN apt install -y automake
RUN apt install -y git zip unzip python3-pip autoconf libtool pkg-config zlib1g-dev libncurses5-dev libncursesw5-dev libtinfo6 cmake libffi-dev libssl-dev automake

# Install Python dependencies
# RUN pip3 install --no-cache-dir Cython


# Install system dependencies for building Python packages
RUN apt-get update && \
    apt-get install -y \
    build-essential \
    python3-dev && \
    # Clean up to reduce image size
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set up a virtual environment
RUN python3 -m venv /opt/venv

# Activate the virtual environment and install Cython
RUN /opt/venv/bin/pip install --upgrade pip && \
    /opt/venv/bin/pip install Cython

# Set the virtual environment as the default
ENV PATH="/opt/venv/bin:$PATH"

# Verify installation (optional)
RUN python -c "import Cython; print(Cython.__version__)"





# the rest 
RUN pip3 install --user --upgrade virtualenv
RUN pip3 install --user --upgrade buildozer

# Set environment variables
ENV JAVA_HOME /usr/lib/jvm/temurin-17-jdk-amd64
ENV PATH $JAVA_HOME/bin:$PATH

# Copy entrypoint script
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Default entrypoint
ENTRYPOINT ["/entrypoint.sh"]