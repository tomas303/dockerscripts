# base image
# ---------------
FROM vscode 

# Maintainer
# ----------
LABEL org.opencontainers.image.authors="tomashorak@post.cz"

# Environment variables
# -------------------------------------------------------------
ENV ScriptsDir=/opt/scripts 

# Install scripts
# --------------------
COPY ./scripts/* $ScriptsDir/


# rustup override set nightly

# Install software
# --------------------
RUN apt -y install clang && \
	apt -y install librust-openssl-dev && \
	apt -y install openssl

# rust
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

# Add .cargo/bin to PATH
ENV PATH="/root/.cargo/bin:${PATH}"

