FROM ubuntu:25.04

RUN apt-get update
RUN apt-get install -y \
    build-essential \
    cmake \
    git \
    libgtest-dev

RUN rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY . .

RUN mkdir build
WORKDIR /app/build
RUN cmake .. && make

WORKDIR /app/build
EXPOSE 8080

CMD ["./cpp_project"]