FROM ubuntu:25.04

RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    git \
    libgtest-dev \
    libboost-system-dev \
    libboost-date-time-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Clone Crow and ASIO libraries
RUN git clone https://github.com/CrowCpp/Crow.git /app/crow
RUN git clone https://github.com/chriskohlhoff/asio.git /app/asio

# Copy your source code into the container
COPY . .

RUN mkdir -p build
WORKDIR /app/build

# Run CMake and build with Crow and ASIO included in your CMakeLists.txt
RUN cmake .. && make -j$(nproc)

EXPOSE 8080

CMD ["./cpp_project"]
