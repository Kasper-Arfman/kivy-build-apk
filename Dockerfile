FROM ubuntu:latest

# Install necessary packages
RUN apt update
RUN apt install -y git 
RUN apt install -y zip 
RUN apt install -y unzip 
RUN apt install -y python3-pip 
RUN apt install -y autoconf 
RUN apt install -y libtool 
RUN apt install -y pkg-config 
RUN apt install -y zlib1g-dev 
RUN apt install -y libncurses5-dev 
RUN apt install -y libncursesw5-dev 
RUN apt install -y libtinfo6 
RUN apt install -y cmake 
RUN apt install -y libffi-dev 
RUN apt install -y libssl-dev 
RUN apt install -y automake

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