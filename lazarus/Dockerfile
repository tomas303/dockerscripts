# base image
# ---------------
FROM fpc

# Maintainer
# ----------
MAINTAINER Tomáš Horák <tomashorak@post.cz>

# Environment variables
# -------------------------------------------------------------
ENV ScriptsDir=/opt/scripts \
	LazarusUrl="https://svn.freepascal.org/svn/lazarus/trunk" \
	LazarusSourceDir=/opt/src/lazarus \
	LazarusTargetLinDir=/opt/bin/lazarus


# Install scripts
# --------------------
COPY ./scripts/*.sh $ScriptsDir/

# install dependecies
RUN apt-get -y install libx11-dev && \
    apt-get -y install libgtk2.0-dev && \ 
    apt-get -y install ibgdk-pixbuf2.0-dev && \
    apt-get -y install libpango1.0-dev && \
    apt-get -y install libcairo2-dev && \
    apt-get -y install libglib2.0-dev

# compile and install fpc
RUN $ScriptsDir/install_lazarussource.sh && \
    RUN $ScriptsDir/install_lazarus.sh Lin64


ENTRYPOINT ["$LazarusTargetLinDir/runlazarus/run.sh"]
