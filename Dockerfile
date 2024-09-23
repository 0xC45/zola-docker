FROM ubuntu:24.04 AS builder
WORKDIR /
RUN apt-get update && \
    apt-get install -y \
      curl \
      git \
      g++ \
      libssl-dev \
      make
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs > rustup.sh && \
    chmod +x rustup.sh && \
    ./rustup.sh -y
RUN git clone https://github.com/getzola/zola.git
WORKDIR /zola
RUN git checkout v0.19.2 && \
    /root/.cargo/bin/cargo build --release

FROM ubuntu:24.04
WORKDIR /
COPY --from=builder /zola/target/release/zola /usr/local/bin/zola
