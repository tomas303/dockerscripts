# base image
# ---------------
FROM xwin

# Maintainer
# ----------
LABEL org.opencontainers.image.authors="tomashorak@post.cz"

# Environment variables
# -------------------------------------------------------------
ENV ScriptsDir=/opt/scripts \
	VSCodeURL="https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64" \
	PowerShellURL="https://github.com/PowerShell/PowerShell/releases/download/v7.2.1/powershell_7.2.1-1.deb_amd64.deb"
# Install scripts
# --------------------
COPY ./scripts/* $ScriptsDir/


# .net sdk
RUN wget https://packages.microsoft.com/config/debian/11/packages-microsoft-prod.deb -O /opt/packages-microsoft-prod.deb && \
	dpkg -i /opt/packages-microsoft-prod.deb && \
	rm /opt/packages-microsoft-prod.deb && \
	apt-get update && \
	apt-get install -y apt-transport-https && \
	apt-get install -y dotnet-sdk-5.0

# vscode
RUN wget --progress=dot:giga -O /opt/vscode.deb $VSCodeURL && \
	apt-get -y install /opt/vscode.deb && \
	apt-get -y install libasound2

#	&& \
#	/usr/bin/code --verbose --no-sandbox --user-data-dir="/root" --install-extension="Ionide.Ionide-fsharp"

# powershell
RUN wget --progress=dot:giga -O /opt/ps.deb $PowerShellURL && \
	apt-get -y install /opt/ps.deb



# Install Xwindows files
# ----------------------
RUN cp $ScriptsDir/.xsessionrc /root/ && \
    cp $ScriptsDir/system.jwmrc /etc/jwm/
