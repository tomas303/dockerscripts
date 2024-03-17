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


# Install software
# --------------------
RUN apt -y install tar

# go 
RUN wget https://dl.google.com/go/go1.22.1.linux-amd64.tar.gz \
  -O /opt/go.tar.gz --progress=dot:giga && \
	tar -C /usr/local -xzf /opt/go.tar.gz && \
	rm /opt/go.tar.gz

# Add go to PATH
ENV PATH="/usr/local/go/bin:${PATH}"

