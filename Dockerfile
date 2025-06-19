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

# Clone Crow and Asio
RUN git clone https://github.com/CrowCpp/Crow.git /app/crow
RUN git clone https://github.com/chriskohlhoff/asio.git /app/asio

# Copy project code
COPY . .

RUN mkdir -p build
WORKDIR /app/build

# Build both app and test
RUN cmake .. && make -j$(nproc)

# You can also build your test binary alongside your main binary
EXPOSE 8080

CMD ["./cpp_project"]
